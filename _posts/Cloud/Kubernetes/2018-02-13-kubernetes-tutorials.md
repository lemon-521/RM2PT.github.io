---
layout: post
title: Kubernetes Tutorials
date: 2018-02-13 16:57:10.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Cloud, Kubernetes]
tags:
- Kubernetes
meta:
  _edit_last: '1'
  _yoast_wpseo_content_score: '30'
  _yoast_wpseo_primary_category: '13'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
Kubernetes automates the distribution and scheduling of application containers across a cluster in a more efficient way

A Kubernetes cluster consists of two types of resources:

*   The **Master** coordinates the cluster
*   **Nodes** are the workers that run applications

Cluster Diagram
---------------

The Master is responsible for managing the cluster. A node is a VM or a physical computer that serves as a worker machine in a Kubernetes cluster. The nodes communicate with the master using the Kubernetes API

![]({{site.baseurl}}/data/imgs/module_01_cluster.svg)

Deployment
----------

The Deployment instructs Kubernetes how to create and update instances of your application. Once you've created a Deployment, the Kubernetes master schedules mentioned application instances onto individual Nodes in the cluster. **This provides a self-healing mechanism to address machine failure or maintenance.**

![]({{site.baseurl}}/data/imgs/module_02_first_app.svg)

Pods
----

A Pod is a Kubernetes abstraction that represents a group of one or more application containers (such as Docker or rkt), and some shared resources for those containers. Those resources include:

*   Shared storage, as Volumes
*   Networking, as a unique cluster IP address
*   Information about how to run each container, such as the container image version or specific ports to use

![]({{site.baseurl}}/data/imgs/module_03_pods.svg)

A Pod models an application-specific "logical host" and can contain different application containers which are relatively tightly coupled.

Node
----

A Pod always runs on a **Node**. A Node is a worker machine in Kubernetes and may be either a virtual or a physical machine, depending on the cluster. Each Node is managed by the Master. A Node can have multiple pods, and the Kubernetes master automatically handles scheduling the pods across the Nodes in the cluster. The Master's automatic scheduling takes into account the available resources on each Node.

![]({{site.baseurl}}/data/imgs/module_03_nodes.svg)

Service
-------

A Service in Kubernetes is an abstraction which defines a logical set of Pods and a policy by which to access them

Services can be exposed in different ways by specifying a `type`in the ServiceSpec:

*   _ClusterIP_ (default) - Exposes the Service on an internal IP in the cluster. This type makes the Service only reachable from within the cluster.
*   _NodePort_ \- Exposes the Service on the same port of each selected Node in the cluster using NAT. Makes a Service accessible from outside the cluster using `<NodeIP>:<NodePort>`. Superset of ClusterIP.
*   _LoadBalancer_ \- Creates an external load balancer in the current cloud (if supported) and assigns a fixed, external IP to the Service. Superset of NodePort.
*   _ExternalName_ \- Exposes the Service using an arbitrary name (specified by `externalName`in the spec) by returning a CNAME record with the name. No proxy is used. This type requires v1.7 or higher of `kube-dns`

![]({{site.baseurl}}/data/imgs/module_04_services.svg)

Services match a set of Pods using [labels and selectors](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels), a grouping primitive that allows logical operation on objects in Kubernetes.

![]({{site.baseurl}}/data/imgs/module_04_labels.svg)

Scaling overview
----------------

 ![]({{site.baseurl}}/data/imgs/module_05_scaling2.svg)

Running multiple instances of an application will require a way to distribute the traffic to all of them. Services have an integrated load-balancer that will distribute network traffic to all Pods of an exposed Deployment. Services will monitor continuously the running Pods using endpoints, to ensure the traffic is sent only to available Pods.

       Once you have multiple instances of an Application running, you would be able to do Rolling updates without downtime.

 **Rolling updates**
--------------------

allow Deployments' update to take place with zero downtime by incrementally updating Pods instances with new ones. The new Pods will be scheduled on Nodes with available resources.

![]({{site.baseurl}}/data/imgs/module_06_rollingupdates3.svg)

![]({{site.baseurl}}/data/imgs/module_06_rollingupdates4.svg)

Rolling updates allow the following actions:

*   Promote an application from one environment to another (via container image updates)
*   Rollback to previous versions
*   Continuous Integration and Continuous Delivery of applications with zero downtime

Useful Command Line
-------------------

*   minikube version
*   minikube start
*   kubectl version
*   kubectl cluster-info
*   kubectl get nodes
*   kubectl run kubernetes-bootcamp --image=docker.io/jocatalin/kubernetes-bootcamp:v1 --port=8080 (create a deployment)
*   kubectl get deployments
*   kubectl proxy
*   curl http://localhost:8001/version
*   **kubectl get** \- list resources
*   **kubectl describe** \- show detailed information about a resource
*   **kubectl logs** \- print the logs from a container in a pod
*   **kubectl exec** \- execute a command on a container in a pod
*   kubectl get pods
*   kubectl describe pods
*   kubectl logs $POD_NAME (View the container logs)
*   kubectl exec $POD_NAME env (execute commands directly on the container once the Pod is up and running)
*   kubectl exec -ti $POD_NAME bash
*   kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080
*   kubectl get services
*   kubectl describe services/kubernetes-bootcamp
*   kubectl get pods -l run=kubernetes-bootcamp
*   kubectl get services -l run=kubernetes-bootcamp
*   kubectl label pod $POD_NAME app=v1
*   kubectl describe pods $POD_NAME
*   kubectl get pods -l app=v1
*   kubectl delete service -l run=kubernetes-bootcamp
*   kubectl scale deployments/kubernetes-bootcamp --replicas=4
*   kubectl get pods -o wide
*   kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=jocatalin/kubernetes-bootcamp:v2 (set to new images)
*   kubectl rollout status deployments/kubernetes-bootcamp
*   kubectl rollout undo deployments/kubernetes-bootcamp
