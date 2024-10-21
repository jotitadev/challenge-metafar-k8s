#!/bin/bash

echo "############################################"
echo "Instalando ArgoCD"
# Crear el namespace para ArgoCD si no existe
kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -
# Instalar ArgoCD con Helm
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm install argocd argo/argo-cd --namespace argocd

# Instala microservicios
echo "############################################"
echo "Configurando una aplicación en ArgoCD desde el repositorio de GitHub"
# Crear la aplicación en ArgoCD usando el app.yaml que se encuentra en el repositorio
kubectl apply -f https://raw.githubusercontent.com/jotitadev/challenge-infra-malafar-k8s/main/app.yaml

# Esperar a que el servicio ArgoCD esté listo

# Nombre del namespace donde está Argo CD
NAMESPACE="argocd"

# Realiza el port-forward al servicio argocd-server
echo "Realizando port-forward del servicio argocd-server en el puerto 8080..."
kubectl port-forward service/argocd-server -n $NAMESPACE 8080:443 &

# Esperar unos segundos para asegurarse de que el port-forward se ha iniciado
sleep 5

# Obtiene la contraseña del usuario admin desde el secreto
PASSWORD=$(kubectl -n $NAMESPACE get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

# Verifica si se ha podido obtener la contraseña
if [ -z "$PASSWORD" ]; then
  echo "No se pudo obtener la contraseña del secreto."
  exit 1
fi

# Imprime las credenciales de acceso
echo "Accede a la UI de Argo CD en: http://localhost:8080"
echo "Usa las siguientes credenciales para iniciar sesión:"
echo "Usuario: admin"
echo "Contraseña: $PASSWORD"

# Mantén el script ejecutándose mientras el port-forward esté activo
echo "Presiona Ctrl+C para detener el port-forward. el resto de tareas ya fueron aplicadas, cancelar el forward no afectara el despliegue"
wait

