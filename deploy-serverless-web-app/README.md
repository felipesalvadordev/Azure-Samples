# Deploy Serverless web application using Bicep

Bicep Commands: 

az bicep build --file main.bicep

$date = Get-Date -Format "MM-dd-yyyy"  
$rand = Get-Random -Maximum 1000  
$deploymentName = "AzInsiderDeployment-"+"$date"+"-"+"$rand"  

New-AzResourceGroupDeployment -Name $deploymentName -ResourceGroupName 
azinsider_demo_fsalvador -TemplateFile .\main.json -TemplateParameterFile .\azuredeploy.parameters.json -c  


https://blog.azinsider.net/deploy-serverless-web-application-using-bicep-language-55d52d9b30a0