#!/bin/bash
set -x

git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

git config --global user.email "user@domain.com"
git config --global user.name $GIT_USER

git -c http.sslVerify=false clone https://$GIT_USER:$GIT_PASSWORD@$RPT_GIT
cd env-report

git config http.sslVerify false

if [ ! -d "./$PCF_ENV" ]; then
    mkdir ./$PCF_ENV
fi

cd $PCF_ENV

if [ ! -d "./manifests" ]; then
    mkdir ./manifests
fi

touch README.md

export BOSH_CLIENT=$BOSH_ADMIN_CLIENT
export BOSH_CLIENT_SECRET=$PCF_SCRT

echo -e "$PCF_CERT" > ca.cert
RESULT="$(bosh -e $PCF_DIRECTOR log-in --ca-cert ca.cert -n 2>&1 > /dev/null)"
echo $RESULT
bosh -e $PCF_DIRECTOR --ca-cert ca.cert alias-env $PCF_ENV
bosh -e $PCF_ENV vms > vms.txt
bosh -e $PCF_ENV stemcells > stemcells.txt
bosh -e $PCF_ENV releases > releases.txt
bosh -e $PCF_ENV runtime-config > runtime-config.txt

for i in $(bosh -e $PCF_ENV deployments --column name | grep .); do
    if [[ ! "$i" =~ "service-instance" ]];then
        bosh -e $PCF_ENV -d $i manifest > ./manifests/$i.yml
    fi
done

bosh -e $PCF_ENV log-out
cf login -a ${CF_API} --skip-ssl-validation -u ${MGMT_USER} -p ${MGMT_PASS}
cf buildpacks > buildpacks.txt
cf quotas > quotas.txt
cf feature-flags > cf_features.txt

if [ -z "${CLIENT_ID:-}" ] ; then
    echo "Using Ops Manager credentials"
    alias om_cmd='om -k --target https://${OPSMAN_DOMAIN_OR_IP_ADDRESS}" --username "${OPSMAN_CLIENT_ID}" --password "${OPSMAN_PASSWORD}"'
else
    echo "Using Client ID credentials"
    alias om_cmd='om -k --target https://${OPSMAN_DOMAIN_OR_IP_ADDRESS}" --client-id "${CLIENT_ID}" --client-secret "${CLIENT_SECRET}"'
fi
om_cmd deployed-products | tail -n +3 > Deployed_Products.txt
#Build the README.md
echo "# ${PCF_ENV} Environmental Report" > README.md
echo "This report is designed to provide a quick glance into the PCF ${PCF_ENV} environment" >> README.md

#Deployed Products
echo "## Deployed Products" >> README.md
echo "|Deployment |Version |" >> README.md
echo "|---- |---- |" >> README.md

om_cmd deployed-products | tail -n +4 | head -n -1 >> README.md

#QUOTAS
echo "## Quotas" >> README.md
echo "| Quota Name | Total RAM | Instance RAM | routes | Service Instances | paid plans | App Instances | Route Ports |" >> README.md
echo "| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |" >> README.md
cf quotas | awk -vOFC="\t" '{print "|" $1 " | " $2 " | " $3 " | " $4 " | " $5 " | " $6 " | " $7 " | " $8 }' | tail -n +5 >> README.md

#BUILDPACKS
echo "## BuildPacks" >> README.md
# echo "Buildpacks provide framework and runtime support for apps. Buildpacks typically examine your apps to determine what dependencies to download and how to configure the apps to communicate with bound services." >> README.md
echo "|BuildPack | Version |  Stack  |" >> README.md
echo "| --------- | ------- | ------- |" >> README.md
cf buildpacks | awk -vOFC="\t" '{sub(/.*-/,"",$5);sub(/.zip/,"",$5); print "| " $1 " | " $5 " | " $6 " | "}' | tail -n +4 >> README.md

#Stemcells
echo "## Stemcells" >> README.md
echo "| Stemcell | Version | VM Name |" >> README.md
echo "| ---- | ---- | ---- |" >> README.md
bosh -e $PCF_ENV stemcells  | awk -vOFC="\t" '{print "|" $1 " | " $2 " | " $5 }' >> README.md

cf logout
bosh -e $PCF_ENV log-out


git add .
git commit -m "Updated for TIME=$(date)"
git push
