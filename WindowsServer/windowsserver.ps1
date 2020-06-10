#provide the details required for the build
$name = Read-Host -Prompt "Please enter the name of the resourcegroup to create"
$location =  Read-Host -Prompt "Please enter the location to create the resource group in"

#Create Resource Group for the machines to be deployed in based on the questions asked above
New-AzResourceGroup -Name $name -Location $location

#Create the variables for the main code
$templateFile = "./windowsserver.json"
$ParametersFile = "./windowsserver.parameters.json"

#Set the variable for the Resource Group 
$resourceGroup = "EnvOne"

#This code builds a name for the deployment based on the time and the resourcegroup name
$date = get-date -Format MMddhhmm
$deploymentname  = "$resourceGroup$Date"

#MainCode
New-AzResourceGroupDeployment -Name $deploymentname -ResourceGroupName $resourceGroup -TemplateFile $templateFile -TemplateParameterFile $ParametersFile -Verbose
