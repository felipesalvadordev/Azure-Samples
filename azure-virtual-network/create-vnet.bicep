@description('Random suffix to apply to our resources')
param appName string = uniqueString(resourceGroup().id)

@description('The location that our resources will be deployed to')
param location string = resourceGroup().location

@description('The name of our virtual network')
param virtualNetworkName string = 'vnet-${appName}'

var subnetName = 'MySubnetTest'

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2022-09-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
    ]
  }
}
