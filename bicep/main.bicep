targetScope = 'subscription'

@description('The base name for resources')
param baseName string = 'demo-mi-gh'

@description('The location of the resources')
param location string = deployment().location

@description('The GitHub username or organization name')
param ghUserName string

@description('The GitHub repository name')
param ghRepoName string = 'az-oidc-managed-identity-demo'

@description('The name of the GitHub environment')
param ghEnvironmentName string = 'Azure'

@description('The role definition ID to assign to the managed identity. Defaults to Contributor.')
param roleDefinitionId string = 'b24988ac-6180-42a0-ab88-20f7382dd24c'

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: '${baseName}-rg'
  location: location
}

module managedIdentity 'managedIdentity.bicep' = {
  scope: rg
  name: 'managedIdentity-demo'
  params: {
    name: '${baseName}-uaid'
    location: location
    ghUserName: ghUserName
    ghRepoName: ghRepoName
    ghEnvironmentName: ghEnvironmentName
    roleDefinitionId: roleDefinitionId
  }
}

@description('The client ID of the managed identity')
output clientId string = managedIdentity.outputs.clientId

@description('The tenant ID of the subscription')
output tenantId string = subscription().tenantId

@description('The subscription ID')
output subscriptionId string = subscription().subscriptionId
