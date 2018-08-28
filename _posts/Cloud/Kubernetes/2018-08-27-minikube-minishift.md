---
layout: post
title: Local Kubernetes and Openshift
date: 2018-02-13 16:57:10.000000000 +08:00
type: post
categories: [Cloud, Kubernetes]
author: Yilong
---

## Install Minikube and MiniShift by VMs
### Download Minikube and MiniShift

* Install VirtualBox and drive if on linux
* [Minikube](https://github.com/kubernetes/minikube/releases)
* [Minishift](https://github.com/minishift/minishift/releases)

### Start Kubernetes and Openshift

      $ minishift start --vm-driver=virtualbox
      $ minikube start --vm-driver=virtualbox
      
### Install command-line tool `kubectl` and `oc` 

* minikube docker-env [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
* minishift oc-env [oc](https://www.okd.io/download.html#oc-platforms)

## Install Minikube and MiniShift by Docker

      $ oc cluster up
      
This command:

* starts OKD listening on local interface on your host (127.0.0.1:8443),

* tarts the web console listening on all interfaces at /console (127.0.0.1:8443),

* launches the Kubernetes system components,

* and provisions registry, router, initial templates, and a default project.

Maybe require $ oc cluster up --insecure-registry "172.30.0.0/16" or  --skip-registry-check=true


MacOS/Linux        
        
      $  eval $(minikube docker-env) 
      
## Deploy application on Kubernetes and OpenShift

OpenShift:

      $ minishift console --url
      $ oc new-app https://github.com/openshift/nodejs-ex -l name=myapp
      $ oc expose svc/nodejs-ex
      $ oc logs -f bc/nodejs-ex
      $ minishift openshift service nodejs-ex --in-browser (VMs to outside)
      $ minishift stop
      
Kubernetes:

      $ minikube dashboard  
      $ kubectl run hello-minikube --image=k8s.gcr.io/echoserver:1.10 --port=8080
      $ kubectl get pod
      $ kubectl expose deployment hello-minikube --type=NodePort
      $ minikube service hello-minikube --url (VMs to outside)
      $ kubectl delete services hello-minikube
      $ kubectl delete deployment hello-minikube
      $ minikube stop


