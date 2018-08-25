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


Kubernetes-bootcamp Tutorials
-------------------

Using minikube to deploy kubernetes on one computer or using docker with kubernetes on Mac and windows

    $ minikube version
    $ minikube start

Get Version

    $ kubectl version
    $ kubectl cluster-info

    Kubernetes master is running at https://localhost:6443
    KubeDNS is running at https://localhost:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

Get Node

    $ kubectl get nodes

    NAME                 STATUS    ROLES     AGE       VERSION
    docker-for-desktop   Ready     master    34m       v1.10.3

Kubernetes Basic command

    $ kubectl get //list resources
    $ kubectl describe //show detailed information about a resource
    $ kubectl logs  //print the logs from a container in a pod
    $ kubectl exec //execute a command on a container in a pod

Deployment *kubernetes-bootcamp*

    $ kubectl run kubernetes-bootcamp --image=docker.io/jocatalin/kubernetes-bootcamp:v1 --port=8080

    deployment.apps "kubernetes-bootcamp" created


List deployments (docker stack ls)

    $ kubectl get deployments

    NAME                  DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
    kubernetes-bootcamp   1         1         1            0           6s

Using proxy to access pods    

    $ kubectl proxy
    $ curl http://localhost:8001/version

List pods with their name and status (docker ps)

    $ kubectl get pods

    NAME                                  READY     STATUS    RESTARTS   AGE
    kubernetes-bootcamp-56cdd766d-n6n64   1/1       Running   0          1m

Show detailed information of pods

    $ kubectl describe pods

    Name:           kubernetes-bootcamp-56cdd766d-n6n64
    Namespace:      default
    Node:           docker-for-desktop/192.168.65.3
    Start Time:     Sat, 25 Aug 2018 19:17:06 +0800
    Labels:         pod-template-hash=127883228
                    run=kubernetes-bootcamp
    Annotations:    <none>
    Status:         Running
    IP:             10.1.0.4
    Controlled By:  ReplicaSet/kubernetes-bootcamp-56cdd766d
    Containers:
      kubernetes-bootcamp:
        Container ID:   docker://b059154f1ee99cb02e3e3665ecac1b77a212ea541cc65d8b569847ec969f53b0
        Image:          docker.io/jocatalin/kubernetes-bootcamp:v1
        Image ID:       docker-pullable://jocatalin/kubernetes-bootcamp@sha256:0d6b8ee63bb57c5f5b6156f446b3bc3b3c143d233037f3a2f00e279c8fcc64af
        Port:           8080/TCP
        Host Port:      0/TCP
        State:          Running
          Started:      Sat, 25 Aug 2018 19:17:41 +0800
        Ready:          True
        Restart Count:  0
        Environment:    <none>
        Mounts:
          /var/run/secrets/kubernetes.io/serviceaccount from default-token-p6tph (ro)
    Conditions:
      Type           Status
      Initialized    True
      Ready          True
      PodScheduled   True
    Volumes:
      default-token-p6tph:
        Type:        Secret (a volume populated by a Secret)
        SecretName:  default-token-p6tph
        Optional:    false
        QoS Class:       BestEffort
        Node-Selectors:  <none>
        Tolerations:     node.kubernetes.io/not-ready:NoExecute for 300s
                         node.kubernetes.io/unreachable:NoExecute for 300s
        Events:
          Type    Reason                 Age   From                         Message
          ----    ------                 ----  ----                         -------
          Normal  Scheduled              5m    default-scheduler            Successfully assigned kubernetes-bootcamp-56cdd766d-n6n64 to docker-for-desktop
          Normal  SuccessfulMountVolume  5m    kubelet, docker-for-desktop  MountVolume.SetUp succeeded for volume "default-token-p6tph"
          Normal  Pulling                5m    kubelet, docker-for-desktop  pulling image "docker.io/jocatalin/kubernetes-bootcamp:v1"
          Normal  Pulled                 5m    kubelet, docker-for-desktop  Successfully pulled image "docker.io/jocatalin/kubernetes-bootcamp:v1"
          Normal  Created                5m    kubelet, docker-for-desktop  Created container
          Normal  Started                5m    kubelet, docker-for-desktop  Started container

Get logs of pod (View the container logs)

    $ kubectl logs pod_name

Execute commands directly on the container once the Pod is up and running

    $ kubectl exec pod_name env

Open bash on pods

    $ kubectl exec -it pod_name bash

Get services

    $ kubectl get services

      NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
      kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   1h

Expose port to external by NodePort Service (expose internal port to outside, like docker -p xxxx:xxxx)    

    $ kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080

      service "kubernetes-bootcamp" exposed

    $ kubectl get services

      NAME                  TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
      kubernetes            ClusterIP   10.96.0.1       <none>        443/TCP          1h
      kubernetes-bootcamp   NodePort    10.100.73.232   <none>        8080:31435/TCP   15s

    $ curl http://localhost:31435/version

      Hello Kubernetes bootcamp! | Running on: kubernetes-bootcamp-56cdd766d-n6n64 | v=1



Check deployment kubernetes-bootcamp services

    $ kubectl describe services/kubernetes-bootcamp

      Name:                     kubernetes-bootcamp
      Namespace:                default
      Labels:                   run=kubernetes-bootcamp
      Annotations:              <none>
      Selector:                 run=kubernetes-bootcamp
      Type:                     NodePort
      IP:                       10.100.73.232
      LoadBalancer Ingress:     localhost
      Port:                     <unset>  8080/TCP
      TargetPort:               8080/TCP
      NodePort:                 <unset>  31435/TCP
      Endpoints:                10.1.0.4:8080
      Session Affinity:         None
      External Traffic Policy:  Cluster
      Events:                   <none>   

Using label to access pods and services

    $ kubectl get pods -l run=kubernetes-bootcamp
    $ kubectl get services -l run=kubernetes-bootcamp

Set label to pods

    $ kubectl label pod $POD_NAME app=v1
    $ kubectl describe pods $POD_NAME
    $ kubectl get pods -l app=v1

Delete the services of the specific deployment

    $ kubectl delete service -l run=kubernetes-bootcam

Scale up deployment

    $ kubectl scale deployments/kubernetes-bootcamp --replicas=4
    $ kubectl get pods -o wide

Set deployments with new image    

    $ kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=jocatalin/kubernetes-bootcamp:v2

    $ kubectl rollout status deployments/kubernetes-bootcamp

        Waiting for rollout to finish: 0 of 1 updated replicas are available...
        deployment "kubernetes-bootcamp" successfully rolled out

Undo changes

    $ kubectl rollout undo deployments/kubernetes-bootcamp

Add Kubernetes Dashboard

    $ kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml

      secret "kubernetes-dashboard-certs" created
      serviceaccount "kubernetes-dashboard" created
      role.rbac.authorization.k8s.io "kubernetes-dashboard-minimal" created
      rolebinding.rbac.authorization.k8s.io "kubernetes-dashboard-minimal" created
      deployment.apps "kubernetes-dashboard" created
      service "kubernetes-dashboard" created

Get kubernetes system deploymenet

    $ kubectl -n kube-system get deployments

      NAME                   DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
      kube-dns               1         1         1            1           1h
      kubernetes-dashboard   1         1         1            1           6m

Get kubernetes system pods

    $ kubectl -n kube-system get pods

      NAME                                         READY     STATUS    RESTARTS   AGE
      etcd-docker-for-desktop                      1/1       Running   0          1h
      kube-apiserver-docker-for-desktop            1/1       Running   0          1h
      kube-controller-manager-docker-for-desktop   1/1       Running   0          1h
      kube-dns-86f4d74b45-vlg8g                    3/3       Running   0          1h
      kube-proxy-v5zpd                             1/1       Running   0          1h
      kube-scheduler-docker-for-desktop            1/1       Running   0          1h
      kubernetes-dashboard-7d5dcdb6d9-wdbvw        1/1       Running   0          8m


Get kubernetes system services

    $ kubectl -n kube-system get service

      NAME                   TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)         AGE
      kube-dns               ClusterIP   10.96.0.10    <none>        53/UDP,53/TCP   1h
      kubernetes-dashboard   ClusterIP   10.99.247.8   <none>        443/TCP         5m      

    $ kubectl proxy

      Starting to serve on 127.0.0.1:8001

    Open Dashboard through http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/    
