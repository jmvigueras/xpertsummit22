# Xpert Summit 2022 - Automation Cloud training
## Objetivo del laboratorio
El objetivo de este laboritorio es dar nociones sobre como desplegar una infraestructura relativamente compleja de hub y spoke en AWS. Además de dar idea de cómo poder operar un firewall Fortigate a través de su API. Durante el laboratio te familizaras con el entorno Terraform y como lanzar y customizar los despligues. 

El formato del laboratorio consiste en 4 entrenamiento diferenciados, que van desde el despliegue básico de un servidor de test y el Fortigate a realizar la configuración ADVPN para poder establecer conexión el HUB central, llamado Golden VPC. 

Los detalles necesarios para poder realizar el curso se encuentra en: 
http://xpertsummit22.jvigueras-fortinet-site.com

## Indice de entramientos a completar
* T1_day0_deploy-vpc: despliegue del entorno básico en AWS
* T2_day0_deploy-server: despliegue del servidor de test en spoke
* **T3_day0_deploy-fgt**: despligue de Fortigate standalone en region AZ1
* T4_dayN_fgt-terraform: actualiación de configuraicón del Fortigate mediante Terraform

## Deployment Overview

En este entrenamiento realizaremos lo siguiente:
- **IMPORTANTE** se debe haber completado con éxito el laboratorio T1
- Las variables necesarias para poder realizar el despliegue de la IaC se recogen del entrenamiento T1
- En este lab se realizará el despligue de un Fortigate en la última versión disponible en el ![AWS Marketplace](https://aws.amazon.com/marketplace/pp/prodview-wory773oau6wq?sr=0-1&ref_=beagle&applicationId=AWSMPContessa) (7.2.2) en modo PAYG.
- El firewall se despliega con una configuración básica para poder acceder via https y también de forma programatica via API.
- El detalle necesario para poder acceder al fortigate se pueden obtener de la salida de Terraform cuando se realice.


## Diagram solution

![architecture overview](images/images/image0.png)


## Pasos a seguir:

# 1. Conexión al entorno de desarrollo Cloud9
- (Revisar pasos laboratorio T1)

# 2. Clonar repositorio Git
- (Revisar pasos laboratorio T1)

# 3.  Acceder a la carpeta T3_day0_deploy-fgt
- Abrir un nuevo terminal y entrar en la carpeta del laboratorio
```
cd T3_day0_deploy-fgt
```
- Desde el navegador de ficheros de la parte izquierda desdplegando la carpeta corrspondiente al T3

* 4. **IMPORTANTE** Debes haber completado con éxito el laboratorio T1 para continuar
- Las variables necesarias para este laboratorio se importan del anterior.
- Las credendiales progrmáticas ACCESS_KEY y SECRET_KEY también se importan del lab anterior.
- Cambiar el nombre al fichero `terraform.tfvars.example` a `terraform.tfvars`

* 6. Revisión de la estructura y de los diferentes ficheros (NO ES NECESARIO REALIZAR NINGUNA CONFIGURACIÓN ADICIONAL)

* 7. **Despligue** 

* Inicialización de providers y modulos:
  ```sh
  $ terraform init
  ```
* Crear un plan de despliegue y 
  ```sh
  $ terraform plan
  ```
* Comprobación que toda la configuración es correcta y no hay fallos.
* Desplegar el plan.
  ```sh
  $ terraform apply
  ```
* Confirmar despligue, type `yes`.


Output will include the information necessary to log in to the FortiGate-VM instances:
```sh
Outputs:


# Support
This a personal repository with goal of testing and demo Fortinet solutions on the Cloud. No support is provided and must be used by your own responsability. Cloud Providers will charge for this deployments, please take it in count before proceed.

## License
Based on Fortinet repositories with original [License](https://github.com/fortinet/fortigate-terraform-deploy/blob/master/LICENSE) © Fortinet Technologies. All rights reserved.


