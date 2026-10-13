#!/bin/bash
# Walks through the Week 7 activity: deploy, scale, rolling update, rollback.
# Run from the Activity folder with Minikube/Kind running.  Usage: ./demo.sh
set -e
NS=devops-app

pause() { echo; read -r -p ">>> Press Enter to continue (take screenshots now) ..." _; }

echo "== 1. Namespace, Deployment (3 replicas) and Service =="
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl rollout status deployment/web-app -n $NS
kubectl get deployment,pods,svc -n $NS -o wide
pause

echo "== 2. Scale up to 5, then down to 2 =="
kubectl scale deployment/web-app --replicas=5 -n $NS
kubectl rollout status deployment/web-app -n $NS
kubectl get pods -n $NS
kubectl scale deployment/web-app --replicas=2 -n $NS
sleep 5 && kubectl get pods -n $NS
kubectl scale deployment/web-app --replicas=3 -n $NS
kubectl rollout status deployment/web-app -n $NS
pause

echo "== 3. Rolling update: nginx 1.25-alpine -> 1.27-alpine =="
kubectl set image deployment/web-app web=nginx:1.27-alpine -n $NS
kubectl annotate deployment/web-app -n $NS kubernetes.io/change-cause="Update to nginx 1.27-alpine" --overwrite
kubectl rollout status deployment/web-app -n $NS
kubectl get pods -n $NS -o custom-columns=NAME:.metadata.name,IMAGE:.spec.containers[0].image,STATUS:.status.phase
kubectl rollout history deployment/web-app -n $NS
pause

echo "== 4. Roll back to the previous version =="
kubectl rollout undo deployment/web-app -n $NS
kubectl rollout status deployment/web-app -n $NS
kubectl get pods -n $NS -o custom-columns=NAME:.metadata.name,IMAGE:.spec.containers[0].image,STATUS:.status.phase
kubectl rollout history deployment/web-app -n $NS
pause

echo "== 5. Application access =="
echo "Run in another terminal:  minikube service web-service -n $NS --url"
echo "or:                       kubectl port-forward svc/web-service 8080:80 -n $NS   (then open http://localhost:8080)"
