# fog Environmental Report
This report is designed to provide a quick glance into the PCF fog environment
## Deployed Products
|Deployment |Version |
|---- |---- |
## Quotas
| Quota Name | Total RAM | Instance RAM | routes | Service Instances | paid plans | App Instances | Route Ports |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
|default | 250G | 9G | 1000 | unlimited | allowed | unlimited | 0
|runaway | 500G | 9G | 2000 | unlimited | allowed | unlimited | 0
|redis-smoke-test-quota | 10G | unlimited | unlimited | 100 | allowed | unlimited | 0
|redis-smoke-test-org | 10G | unlimited | unlimited | 100 | allowed | 0 | 0
|medium | 25G | unlimited | unlimited | 150 | allowed | unlimited | 0
|EcsServiceBoker-service-quota | 4G | unlimited | unlimited | 10 | disallowed | unlimited | 0
|big | 1T | 9G | 4000 | unlimited | allowed | unlimited | 0
|ecs-broker-service-quota | 4G | unlimited | unlimited | 10 | disallowed | unlimited | 0
|p-spring-cloud-services | 150G | unlimited | 1000 | unlimited | allowed | unlimited | 0
## BuildPacks
|BuildPack | Version |  Stack  |
| --------- | ------- | ------- |
| hwc_buildpack | v3.1.10 | windows2016 | 
| hwc_buildpack | v3.1.10 | windows2012R2 | 
| java_buildpack_offline | v4.26 | cflinuxfs3 | 
| staticfile_buildpack | v1.5.3 | cflinuxfs3 | 
| go_buildpack | v1.9.4 | cflinuxfs3 | 
| python_buildpack | v1.7.5 | cflinuxfs3 | 
| php_buildpack | v4.4.5 | cflinuxfs3 | 
| dotnet_core_buildpack | v2.3.3 | cflinuxfs3 | 
| binary_buildpack | v1.0.36 | cflinuxfs3 | 
| ruby_buildpack | v1.8.6 | cflinuxfs3 | 
| nodejs_buildpack | v1.7.8 | cflinuxfs3 | 
| nginx_buildpack | v1.1.3 | cflinuxfs3 | 
| r_buildpack | v1.1.1 | cflinuxfs3 | 
| hwc_buildpack | v3.1.10 | windows | 
| binary_buildpack | v1.0.36 | windows | 
| binary_buildpack | v1.0.36 | windows2012R2 | 
| binary_buildpack | v1.0.36 | windows2016 | 
| nodejs_buildpack_sim | cflinuxfs3 |  | 
## Stemcells
| Stemcell | Version | VM Name |
| ---- | ---- | ---- |
|bosh-vsphere-esxi-ubuntu-trusty-go_agent | 3586.79 | sc-364b06b8-792d-4e28-9981-e29523f430ab
|bosh-vsphere-esxi-ubuntu-trusty-go_agent | 3586.46* | sc-8f17a858-70b1-4a5b-9ac4-ae5b833fff44
|bosh-vsphere-esxi-ubuntu-trusty-go_agent | 3586.36 | sc-f81dc60c-ef61-4810-8d21-6c9aa5d8bcf5
|bosh-vsphere-esxi-ubuntu-xenial-go_agent | 621.51* | sc-212066b7-2027-48e8-9dbe-399bc5b27f7e
|bosh-vsphere-esxi-ubuntu-xenial-go_agent | 621.29* | sc-ae09140e-ff2c-48cb-999d-dddfcbf6c014
|bosh-vsphere-esxi-ubuntu-xenial-go_agent | 456.93* | sc-bef4e7ba-e7af-4a55-a810-9776c34c54b2
|bosh-vsphere-esxi-ubuntu-xenial-go_agent | 456.77 | sc-138ce65a-6177-4c48-a6a0-0be299c6b8c6
|bosh-vsphere-esxi-ubuntu-xenial-go_agent | 456.40* | sc-7a352f59-92bf-4311-ab92-cb8f2ea6bdbe
|bosh-vsphere-esxi-ubuntu-xenial-go_agent | 456.30 | sc-8bab1080-f388-4431-a788-764e9bce35ab
|bosh-vsphere-esxi-ubuntu-xenial-go_agent | 456.27* | sc-49b9f2ae-5bd3-4c75-ac95-2cc885044e60
|bosh-vsphere-esxi-ubuntu-xenial-go_agent | 315.163* | sc-2fb8b045-3c98-45b8-813d-90b3da2de335
|bosh-vsphere-esxi-ubuntu-xenial-go_agent | 315.45* | sc-1425d5fc-2d61-4323-8fb1-acb4687aee1e
|bosh-vsphere-esxi-ubuntu-xenial-go_agent | 250.178* | sc-c52486bd-8dae-4685-a2b7-7037ffcacc64
|bosh-vsphere-esxi-ubuntu-xenial-go_agent | 250.73* | sc-90a4c5f6-4867-48ed-a779-b6fa9844b097
|bosh-vsphere-esxi-ubuntu-xenial-go_agent | 170.198* | sc-51bc43db-a54d-4664-b1be-544a408ff341
|bosh-vsphere-esxi-ubuntu-xenial-go_agent | 97.226* | sc-a18d9e42-2966-4c42-adfe-52d6d7cae862
|bosh-vsphere-esxi-ubuntu-xenial-go_agent | 97.12* | sc-14061aa6-90fe-4696-b728-bcd38c0850f9
|bosh-vsphere-esxi-windows2019-go_agent | 2019.15* | sc-fb9d27c5-252e-451d-9347-83eeb4664b5e
|bosh-vsphere-esxi-windows2019-go_agent | 2019.14* | sc-fd2d149a-5cdf-4efe-a2dd-0c307ae32658
|bosh-vsphere-esxi-windows2019-go_agent | 2019.13 | sc-c6834304-27d2-472e-9ed2-aadd1c0c16ad
|bosh-vsphere-esxi-windows2019-go_agent | 2019.12 | sc-6f7072d4-0bf9-4b3d-81eb-4360b0e5f1c5