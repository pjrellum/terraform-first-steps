# terraform first steps - part 03

## STEP 3: Add SQL Server and database Resources

Using the [Terraform Registry](https://registry.terraform.io):

1. Add the database variables to variables.tf
2. Update terraform.tfvars with database values __make sure to use a unique name for the db server__
3. Add the SQL Server and Database resources to main.tf
4. Configure firewall rules

Execute:
```bash
terraform plan
terraform apply
```

Verify the database resources in the Azure Portal

# Questions and bonus assignment
1. Do you notice anything particular about the database password variable? Check what happens when you change this setting
2. Create a random password for the database
