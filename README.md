- [1. Arm Templates Repository](#1-arm-templates-repository)
    - [1.1. Introduction](#11-introduction)
  - [2. List of Arm Templates](#2-list-of-arm-templates)
    - [2.1. WindowsServer](#21-windowsserver)
    - [2.1.1. Code for Keyvault](#211-code-for-keyvault)
  
# 1. Arm Templates Repository
### 1.1. Introduction
This Repository will contain some of the ARM Templates I have created for any number of reasons, mostly to be fair to try and learn how to create ARM templates. I find the whole subject of Infrastructure as code fascinating andd want to show that I can accomplish what I am setting out to do. By creating the templates here. Some will be fairly simple and some will be very complex depending on the problem or targets I have set myself. I dont tend to name the temapltes

## 2. List of Arm Templates

### 2.1. WindowsServer
This template was created to stop the drudge of creating windows servers for testing purposes, I changed it recently to support creating multiple servers within the same Resource Group and vNet. The next challenge for this will be create the machines in multiple vNets and Subnets with Peerings.

The Parameters file needs filling in to reflect your own environments, it has a number of values that need adding 

- virtualMachineSize - Make this the right one I tend to use "Standard_B2s"
- adminUsername - Again I use the value already there "sysadmin" but you can change that to whatever you need it to be
- Project - I use the word project to mean a common name that can be spread across all the resources, the template uses this to name everything, eg if the project was "sales" a vm would be "SalesVM<integer of the build>"
- Count - The number of machines to build
- adminPassword - well self explanatory this, I dont put a password here I use a Azure Key Vault and pick the value right from there. Ive added the code in below in case you would like to change to use this method

### 2.1.1. Code for Keyvault
                "adminPassword": {
                            "reference": {
                                "keyVault": {
                                    "id": "ID of your keyvault"
                                    },
                                    "secretName": "<Name of your secret>"
                            }
                }
  







