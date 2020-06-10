- [1. Arm Templates Repository](#1-arm-templates-repository)
    - [1.1. Introduction](#11-introduction)
  - [2. List of Arm Templates](#2-list-of-arm-templates)
    - [2.1. WindowsServer](#21-windowsserver)
    - [2.1.1. Code for Keyvault](#211-code-for-keyvault)
  
# 1. Arm Templates Repository
### 1.1. Introduction
This Repository will contain some of the ARM Templates I create for any number of reasons, mostly to be fair this will be learn how to create ARM templates and solve the little problems/challenges I give myself. I find the whole subject of Infrastructure as code fascinating and want to show that I can accomplish what I am setting out to do. By creating the templates here. Some will be fairly simple and some will be very complex depending on the scale of the problem or targets I have set myself. I don't tend to name the templates as azureDeploy but something more meaning full to me.

## 2. List of Arm Templates

### 2.1. WindowsServer
This template was created to stop the drudge of creating windows servers for testing purposes, I changed it recently to support creating multiple servers within the same Resource Group and vNet. The next challenge for this will be create the machines in multiple vNets and Subnets with vNet Peerings.

The Parameters file needs filling in to reflect your own environments, it has a number of values that need adding 

- virtualMachineSize - Make this the right one I tend to use "Standard_B2s"
- adminUsername - Again I use the value already there "sysadmin" but you can change that to whatever you need it to be
- Project - I use the word project to mean a common name that can be spread across all the resources, the template uses this to name everything, eg if the project was "sales" a vm would be "SalesVM<integer of the build>"
- Count - The number of machines to build
- adminPassword - well self explanatory this, I don't put a password here I use a Azure Key Vault and pick the value right from there. Ive added the code in below in case you would like to change to use this method

### 2.1.1. Code for Keyvault
                "adminPassword": {
                            "reference": {
                                "keyVault": {
                                    "id": "ID of your keyvault"
                                    },
                                    "secretName": "<Name of your secret>"
                            }
                }

The code to run the template is the file windowsserver.ps1, all with commenting, another habit I have to get into better.

The network security group has one rule in it to provide RDP access to the servers.







