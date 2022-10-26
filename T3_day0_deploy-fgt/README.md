# Xpert Summit 2022
# Automation Cloud training
## Objetivo del laboratorio
El objetivo de este laboratorio es dar nociones sobre como desplegar una infraestructura relativamente compleja de hub y spoke en AWS. Además de dar idea de cómo poder operar un firewall Fortigate a través de su API. Durante el laboratorio te familiarizaras con el entorno Terraform y como lanzar y customizaz los despliegues. 

El formato del laboratorio consiste en 4 entrenamientos diferenciados, que van desde el despliegue básico de un servidor de test y el Fortigate a realizar la configuración ADVPN para poder establecer conexión el HUB central, llamado Golden VPC. 

Los detalles necesarios para poder realizar el curso se encuentra en: 
http://xpertsummit22.jvigueras-fortinet-site.com

## Indice de entramientos a completar
* T1_day0_deploy-vpc: despliegue del entorno básico en AWS
* T2_day0_deploy-server: despliegue del servidor de test en spoke
* **T3_day0_deploy-fgt**: despligue de Fortigate standalone en region AZ1
* T4_dayN_fgt-terraform: actualiación de configuraicón del Fortigate mediante Terraform

## Resumen puesta en marcha

En este entrenamiento realizaremos lo siguiente:
- **IMPORTANTE** - debes completar con éxito el laboratorio T1 y T2 antes de continuar
- Las variables necesarias para poder realizar el despliegue de la IaC se recogen del entrenamiento T1
- En este lab se realizará el despliegue de un Fortigate en la última versión disponible en el [AWS Marketplace](https://aws.amazon.com/marketplace/pp/prodview-wory773oau6wq?sr=0-1&ref_=beagle&applicationId=AWSMPContessa) en modo PAYG.
- El firewall se despliega con una configuración básica para poder acceder via https y también de forma programática via API.
- El detalle necesario para poder acceder al Fortigate se pueden obtener de la salida de Terraform cuando se realice.


## Diagram solution

![architecture overview](./images/image0.png)


# LAB
## Pasos a seguir:

## 1. Conexión al entorno de desarrollo Cloud9
- (Revisar pasos laboratorio T1)

## 2. Clonar repositorio Git
- (Revisar pasos laboratorio T1)

## 3.  Acceder a la carpeta T3_day0_deploy-fgt
- Abrir un nuevo terminal y entrar en la carpeta del laboratorio
```
cd T3_day0_deploy-fgt
```
- Desde el navegador de ficheros de la parte izquierda desdplegando la carpeta corrspondiente al T3

## 4. **IMPORTANTE** Debes haber completado con éxito el laboratorio T1 para continuar
- Las variables necesarias para este laboratorio se importan del anterior.
- Las credendiales progrmáticas ACCESS_KEY y SECRET_KEY también se importan del lab anterior.
- (En este laboratorio NO es necesario el fichero `terraform.tfvars`)

## 6. **Despligue** 

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


![terraform apply](./images/image6-1.png)

Al final del despliegue tendremos una salida similar a esta

![terraform apply](./images/image6-2.png)

**Abrir la GUI del Fortigate para comprobar el acceso y cambiar la contraseña por defecto. Guardar los datos de acceso**


## Laboratorio completado
Pasar a lab 4: [T4_dayN_fgt-terraform](https://github.com/jmvigueras/xpertsummit22/tree/main/T4_dayN_fgt-terraform)

Con este laboratorio hemos completado los despliegues de dia 0, ya tenemos en marcha nuestra infraestructura. En el siguiente laboratorio veremos como operar el día a día de un Fortigate usando Terraform. 


## Support
This a personal repository with goal of testing and demo Fortinet solutions on the Cloud. No support is provided and must be used by your own responsability. Cloud Providers will charge for this deployments, please take it in count before proceed.

## License
Based on Fortinet repositories with original [License](https://github.com/fortinet/fortigate-terraform-deploy/blob/master/LICENSE) © Fortinet Technologies. All rights reserved.


