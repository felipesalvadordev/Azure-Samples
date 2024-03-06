param webAppName string = uniqueString(resourceGroup().id)
param acrName string = toLower('acr${webAppName}')
param acrSku string
param appServicePlanName string = toLower('asp-${webAppName}')
param appServiceName string = toLower('asp-${webAppName}')
param appServicePlanSkuName string
param appServicePlanInstanceCount int

var appServiceSlotName = 'blue'

param location string = resourceGroup().location

module containerRegistry 'container-registry.bicep' = {
  name: 'containerRegistry'
  params: {
    registryLocation: location 
    registryName: acrName
    registrySku: acrSku
  }
}

module appServicePlan 'app-service-plan.bicep' = {
  name: 'appServicePlan'
  params: {
    appServicePlanLocation: location
    appServicePlanName: appServicePlanName
    appServicePlanSkuName: appServicePlanSkuName
    appServicePlanCapacity: appServicePlanInstanceCount
  }
}

module appService 'app-service.bicep' = {
  name: 'appService'
  params: {
    appServiceLocation: location 
    appServiceName: appServiceName
    serverFarmId: appServicePlan.outputs.appServicePlanId
    appServiceSlotName: appServiceSlotName
    acrName: acrName
  }
}
