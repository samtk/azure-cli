set resourcegroupname=test-vm-app
set location=ukwest
set servername=server-cli-$(get-random)
set adminlogin=admin
set password=SuperSecret123
set startip=0.0.0.0
set endip=0.0.0.0
set databasename=samclidb

az group create --name %resourcegroupname% --location %location% 

az sql server create --name %servername% --resource-group %resourcegroupname% --location %location% --admin-user %adminlogin% --admin-password %password%

az sql server firewall-rule create --resource-group %resourcegroupname% --server %servername% -n AllowYourIp --start-ip-address %startip% --end-ip-address %endip%

az sql db create --resource-group %resourcegroupname% --server %servername% --name %databasename% --sample-name AdventureWorksLT --service-objective S0

az group delete --name %resourcegroupname%