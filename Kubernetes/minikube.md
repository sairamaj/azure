
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

[Running your own Docker containers in Minikube for Windows](https://medium.com/@maumribeiro/running-your-own-docker-images-in-minikube-for-windows-ea7383d931f6)

* minikube docker-env  ( this will set up so that images can be created in minikube VM)

[Setting up Kubernetes on Windows10 Laptop with Minikube]
(https://blogs.msdn.microsoft.com/wasimbloch/2017/01/23/setting-up-kubernetes-on-windows10-laptop-with-minikube/)

[Install and run Minikube in Azure Linux VM]
(https://medium.com/@binduc/install-and-run-minikube-in-azure-linux-vm-47a12ade2d43)