targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2020-01-01' = {
    name: 'rg-bicep'
    location: 'West Europe'
    scope: subscription()
    tags: {
        workload: 'iacdemo'
    }
}

module stgModule './storage.bicep' = {
    name: 'storageDeploy'
    scope: rg
    params: {
        location: rg.location
    }
}
