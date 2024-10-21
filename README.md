# Metafar Challenge - Kubernetes Deployment

Este repositorio contiene la solución para el challenge técnico de la empresa **Metafar**. El objetivo es desplegar una aplicación en Kubernetes utilizando **ArgoCD** para gestionar la instalación de los componentes y los microservicios solicitados.

## Descripción

El script principal del repositorio, `start.sh`, realiza las siguientes acciones de forma automatizada:
1. Instala **ArgoCD** en el clúster de Kubernetes.
2. Configura y despliega la aplicación solicitada en el challenge, incluyendo todos los microservicios asociados.

### Componentes principales:
- **ArgoCD**: Sistema de despliegue continuo (CD) basado en GitOps, utilizado para gestionar las aplicaciones en Kubernetes.
- **Microservicios**: La aplicación solicitada incluye una arquitectura de microservicios que es desplegada y gestionada automáticamente por el script.

## Instrucciones

1. Clonar el repositorio:

   ```bash
   git clone https://github.com/jotitadev/challenge-metafar-k8s.git
   ```
2.	Ejecutar el script start.sh para iniciar el proceso de instalación:

   ```bash
   ./start.sh
   ```
El script se encargará de instalar ArgoCD y desplegar los componentes de la aplicación de manera automática.

## Requisitos

	•	Clúster de Kubernetes configurado y funcionando.
	•	Acceso administrativo al clúster (kubectl y permisos de instalación de aplicaciones).
	•	Dependencias instaladas:
	•	kubectl
	•	helm (opcional, dependiendo de la implementación del script)

## Estructura del repositorio

	•	start.sh: Script principal que ejecuta la instalación de ArgoCD y los microservicios.
	•	manifests/: Archivos YAML que definen los microservicios y recursos de Kubernetes requeridos para el challenge.
	•	argocd/: Manifiestos específicos para la instalación y configuración de ArgoCD.

Notas

	•	Asegúrate de que tu clúster de Kubernetes está correctamente configurado antes de ejecutar el script.
	•	El repositorio utiliza una URL pública de GitHub como fuente de los manifiestos de la aplicación, gestionada directamente por ArgoCD.

## Licencia

Este repositorio es parte de un challenge técnico para Metafar y es de uso exclusivo para dicha empresa.