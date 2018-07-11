
# Setting up minikube on Windows 10 Home

https://rominirani.com/tutorial-getting-started-with-kubernetes-on-your-windows-laptop-with-minikube-3269b54a226

minikube status  
kubectl get pods --all-namespaces  
kubectl config use-context minikube  
  
Not able to access dashboard  
used powershell Invoke-WebRequest url and working (getting 200)  
Tried in chrome and working

## Deploying a single image
kubectl run <name> --image=<imagename>

## Exposing
* kubectl expose deployment hello-nginx --type=NodePort
* minikube service --url=true hello-nginx (shows url)
* minikube.exe service hello-nginx (launches)

*   kubectl get deployment