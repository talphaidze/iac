@sys.description('The Web App name.')
@minLength(3)
@maxLength(24)
param appServiceAppName string = 'talphaidze-app-bicep'

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: 'talphaidzestorage'
  location: 'westus3'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

resource appServicePlan 'Microsoft.Web/serverFarms@2022-03-01' = {
  name: appServiceAppName
  location: 'westus3'
  sku: {
    name: 'F1'
  }
}

resource appServiceApp 'Microsoft.Web/sites@2022-03-01' = {
  name: 'talphaidze-app-bicep'
  location: 'westus3'
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
