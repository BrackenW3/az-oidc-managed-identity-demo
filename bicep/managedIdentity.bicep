@description('The name of the user assigned managed identity')
param name string

@description('The location of the resources')
param location string = resourceGroup().location

@description('The GitHub username or organization name')
param ghUserName string

@description('The GitHub repository name')
param ghRepoName string

@description('The name of the GitHub environment')
param ghEnvironmentName string = 'Azure'

@description('The role definition ID to assign to the managed identity. Defaults to Reader.')
param roleDefinitionId string = 'acdd72a7-3385-48ef-bd42-f606fba81ae7'

resource mi 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: name
  location: location
}

@description('The role definition to assign. Defaults to Reader.')
resource roleDefinition 'Microsoft.Authorization/roleDefinitions@2022-04-01' existing = {
  scope: subscription()
  name: roleDefinitionId
}

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(mi.id, roleDefinition.id, resourceGroup().id)
  properties: {
    principalId: mi.properties.principalId
    roleDefinitionId: roleDefinition.id
    principalType: 'ServicePrincipal'
  }
}

resource federatedCredential 'Microsoft.ManagedIdentity/userAssignedIdentities/federatedIdentityCredentials@2023-01-31' = {
  name: ghRepoName
  parent: mi
  properties: {
    audiences: [
      'api://AzureADTokenExchange'
    ]
    issuer: 'https://token.actions.githubusercontent.com'
    subject: 'repo:${ghUserName}/${ghRepoName}:environment:${ghEnvironmentName}'
  }
}

@description('The client ID of the managed identity')
output clientId string = mi.properties.clientId
