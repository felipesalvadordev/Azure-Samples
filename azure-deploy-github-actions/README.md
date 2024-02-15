# GitHub Actions with Terraform

#Creating terraform state:  
az group create -n rg_storage_tf -l eastus2  
az storage account create -n tfstoragesalvador -g rg_storage_tf -l eastus2 --sku Standard_LRS  
az storage container create -n tfstate --account-name tfstoragesalvador --auth-mode login  

#References:
https://faun.pub/github-actions-with-terraform-in-10-minutes-de75129a8e74  
https://thomasthornton.cloud/2021/03/19/deploy-terraform-using-github-actions-into-azure/
