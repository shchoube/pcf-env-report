# pcf-env-report
A pipeline that will build an environment report for Pivotal Cloud Foundry

This will provide a versioned report of:
- All users and their permissions
- All deployment manifests
- buildpacks
- Used products
- certificates
- quotas
- bosh releases
- runtime configs
- stemcells
- VMs and their current state

This will produce a nicely formatted README output displaying your environment.  
An example of this output can be found in examples/README.md