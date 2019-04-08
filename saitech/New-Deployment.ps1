$ResourceGroupName = 'deleteme'
$TemplateFile = 'Templates\api-deploy.json'
$TemplateParameterFile = 'Templates\api-deploy-parameters.json'

# Creating a deployment 


# Validte the template.
Test-AzureRmResourceGroupDeployment -ResourceGroupName $ResourceGroupName `
    -TemplateParameterFile $TemplateParameterFile -TemplateFile $TemplateFile

# Deploy

New-AzureRmResourceGroupDeployment `
    -Name TestAutomationDeployment3 `
    -ResourceGroupName $ResourceGroupName `
    -TemplateFile $TemplateFile `
    -TemplateParameterFile $TemplateParameterFile `
    -AsJob
