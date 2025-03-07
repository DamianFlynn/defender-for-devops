@description('The location to deploy our resources to. Default is location of resource group')
param location string = resourceGroup().location

@description('The name of our application.')
param applicationName string = uniqueString(resourceGroup().id)

@description('The name of the storage account to deploy')
param storageAccountName string = take(toLower(replace('${applicationName}genfunc', '-', '')), 24)

var tags = {
  Demo: 'Defender for DevOps'
  Tech: 'Bicep'
}

// Sample Rewource

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: storageAccountName
  location: location
  tags: tags
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    // allowBlobPublicAccess: false
    // minimumTlsVersion: 'TLS1_2'
  }
}
