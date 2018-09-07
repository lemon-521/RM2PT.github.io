---
layout: post
title: On-premise Kubernetes and Openshift
date: 2018-02-13 16:57:10.000000000 +08:00
type: post
categories: [Cloud, Kubernetes]
author: Yilong
---

## Install Kubernetes and OpenShfit by VMs
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

## Install Docker Registry

      $ docker run -d -p 5000:5000 --restart=always --name registry registry:2

Test Docker Registry

      $ docker pull ubuntu:16.04
      $ docker tag ubuntu:16.04 registry_ip:5000/my-ubuntu
      $ docker push registry_ip:5000/my-ubuntu

## Install Kubernetes and OpenShfit by Docker

Kubernetes on docker can be done by desktop docker applications

* /etc/docker/daemon.json

      {
      "insecure-registries": [
           "registry ip:5000"
           "172.30.0.0/16"
         ]
      }
  
* Docker Restart

      $ systemctl stop docker
      $ systemctl start docker
  
* Openshift up

      $ oc cluster up --routing-suffix=10.119.180.33.nip.io --public-hostname=10.119.180.33
      
      
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


