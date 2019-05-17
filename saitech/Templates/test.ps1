$x = Test-AzureRmResourceGroupDeployment -ResourceGroupName deleteme -TemplateParameterFile .\master.parameters.json -
TemplateFile .\master.template.json
$x
