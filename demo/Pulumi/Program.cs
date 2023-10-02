await Pulumi.Deployment.RunAsync(() => {

    var resourceGroup = new ResourceGroup("rg-pulumi", new ResourceGroupArgs
    {
        Tags = new Dictionary<string, string> { ["workload"] = "iacdemo" }
    });

    new StorageAccount("sa", new StorageAccountArgs
    {
        ResourceGroupName = resourceGroup.Name,
        Sku = new SkuArgs
        {
            Name = SkuName.Standard_LRS
        },
        Kind = Kind.StorageV2,
        EnableHttpsTrafficOnly = true
    });

});