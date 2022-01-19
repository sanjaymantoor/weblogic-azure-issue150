/* 
 Copyright (c) 2021, Oracle and/or its affiliates.
Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
*/

param acrName string = 'acr-contoso'
param createNewAcr bool = false

param location string

module acrDeployment './_azure-resoruces/_acr.bicep' = if (createNewAcr) {
  name: 'acr-deployment'
  params: {
    location: location
  }
}

output acrName string = createNewAcr ? acrDeployment.outputs.acrName : acrName
