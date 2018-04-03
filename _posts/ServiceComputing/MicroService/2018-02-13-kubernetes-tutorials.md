---
layout: post
title: Kubernetes Tutorials
date: 2018-02-13 16:57:10.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [ServiceComputing, MicroService]
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
<div class="row">
<div class="col-md-8">
<div class="row">
<div class="col-md-8">
<p>Kubernetes automates the distribution and scheduling of application containers across a cluster in a more efficient way</p>
<div class="row">
<div class="col-md-8">
<p>A Kubernetes cluster consists of two types of resources:</p>
<ul>
<li>The <b>Master</b> coordinates the cluster</li>
<li><b>Nodes</b> are the workers that run applications</li>
</ul>
</div>
</div>
<h2>Cluster Diagram</h2>
<p>The Master is responsible for managing the cluster. A node is a VM or a physical computer that serves as a worker machine in a Kubernetes cluster. The nodes communicate with the master using the Kubernetes API</p>
</div>
</div>
<div class="row">
<div class="col-md-8">
<p><img src="{{ site.baseurl }}/assets/module_01_cluster.svg" /></p>
</div>
</div>
<h2>Deployment</h2>
<p>The Deployment instructs Kubernetes how to create and update instances of your application. Once you've created a Deployment, the Kubernetes master schedules mentioned application instances onto individual Nodes in the cluster. <b>This provides a self-healing mechanism to address machine failure or maintenance.</b></p>
<p><img src="{{ site.baseurl }}/assets/module_02_first_app.svg" /></p>
<h2>Pods</h2>
<p>A Pod is a Kubernetes abstraction that represents a group of one or more application containers (such as Docker or rkt), and some shared resources for those containers. Those resources include:</p>
<ul>
<li>Shared storage, as Volumes</li>
<li>Networking, as a unique cluster IP address</li>
<li>Information about how to run each container, such as the container image version or specific ports to use</li>
</ul>
</div>
</div>
<div class="row">
<div class="col-md-8">
<p><img src="{{ site.baseurl }}/assets/module_03_pods.svg" /></p>
<p>A Pod models an application-specific "logical host" and can contain different application containers which are relatively tightly coupled.</p>
<div class="row">
<div class="col-md-8">
<h2>Node</h2>
<p>A Pod always runs on a <b>Node</b>. A Node is a worker machine in Kubernetes and may be either a virtual or a physical machine, depending on the cluster. Each Node is managed by the Master. A Node can have multiple pods, and the Kubernetes master automatically handles scheduling the pods across the Nodes in the cluster. The Master's automatic scheduling takes into account the available resources on each Node.</p>
</div>
</div>
<div class="row">
<div class="col-md-8">
<p><img src="{{ site.baseurl }}/assets/module_03_nodes.svg" /></p>
</div>
</div>
</div>
<h2>Service</h2>
<p>A Service in Kubernetes is an abstraction which defines a logical set of Pods and a policy by which to access them</p>
</div>
<p>Services can be exposed in different ways by specifying a <code>type</code>in the ServiceSpec:</p>
<ul>
<li><i>ClusterIP</i> (default) - Exposes the Service on an internal IP in the cluster. This type makes the Service only reachable from within the cluster.</li>
<li><i>NodePort</i> - Exposes the Service on the same port of each selected Node in the cluster using NAT. Makes a Service accessible from outside the cluster using <code>&lt;NodeIP&gt;:&lt;NodePort&gt;</code>. Superset of ClusterIP.</li>
<li><i>LoadBalancer</i> - Creates an external load balancer in the current cloud (if supported) and assigns a fixed, external IP to the Service. Superset of NodePort.</li>
<li><i>ExternalName</i> - Exposes the Service using an arbitrary name (specified by <code>externalName</code>in the spec) by returning a CNAME record with the name. No proxy is used. This type requires v1.7 or higher of <code>kube-dns</code></li>
</ul>
<div class="row">
<div class="col-md-8">
<p><img src="{{ site.baseurl }}/assets/module_04_services.svg" width="150%" height="150%" /></p>
</div>
</div>
<div class="row">
<div class="col-md-8">Services match a set of Pods using <a href="https://kubernetes.io/docs/concepts/overview/working-with-objects/labels">labels and selectors</a>, a grouping primitive that allows logical operation on objects in Kubernetes.</div>
</div>
<div></div>
<div><img src="{{ site.baseurl }}/assets/module_04_labels.svg" /></div>
<div>
<div class="row">
<div class="col-md-8">
<h2>Scaling overview</h2>
</div>
</div>
<div class="row"> <img src="{{ site.baseurl }}/assets/module_05_scaling2.svg" /></div>
<div>
<p>Running multiple instances of an application will require a way to distribute the traffic to all of them. Services have an integrated load-balancer that will distribute network traffic to all Pods of an exposed Deployment. Services will monitor continuously the running Pods using endpoints, to ensure the traffic is sent only to available Pods.</p>
<div class="row">
<div class="col-md-8">
<p>       Once you have multiple instances of an Application running, you would be able to do Rolling updates without downtime.</p>
</div>
</div>
</div>
</div>
<h2> <b>Rolling updates</b></h2>
<div>allow Deployments' update to take place with zero downtime by incrementally updating Pods instances with new ones. The new Pods will be scheduled on Nodes with available resources.</div>
<div><img src="{{ site.baseurl }}/assets/module_06_rollingupdates3.svg" /></div>
<div></div>
<div></div>
<div><img src="{{ site.baseurl }}/assets/module_06_rollingupdates4.svg" /></div>
<div>
<p>Rolling updates allow the following actions:</p>
<ul>
<li>Promote an application from one environment to another (via container image updates)</li>
<li>Rollback to previous versions</li>
<li>Continuous Integration and Continuous Delivery of applications with zero downtime</li>
</ul>
<h2>Useful Command Line</h2>
</div>
<ul>
<li>minikube version</li>
<li>minikube start</li>
<li>kubectl version</li>
<li>kubectl cluster-info</li>
<li>kubectl get nodes</li>
<li>kubectl run kubernetes-bootcamp --image=docker.io/jocatalin/kubernetes-bootcamp:v1 --port=8080 (create a deployment)</li>
<li>kubectl get deployments</li>
<li>kubectl proxy</li>
<li>curl http://localhost:8001/version</li>
<li><b>kubectl get</b> - list resources</li>
<li><b>kubectl describe</b> - show detailed information about a resource</li>
<li><b>kubectl logs</b> - print the logs from a container in a pod</li>
<li><b>kubectl exec</b> - execute a command on a container in a pod</li>
<li>kubectl get pods</li>
<li>kubectl describe pods</li>
<li>kubectl logs $POD_NAME (View the container logs)</li>
<li>kubectl exec $POD_NAME env (execute commands directly on the container once the Pod is up and running)</li>
<li>kubectl exec -ti $POD_NAME bash</li>
<li>kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080</li>
<li>kubectl get services</li>
<li>kubectl describe services/kubernetes-bootcamp</li>
<li>kubectl get pods -l run=kubernetes-bootcamp</li>
<li>kubectl get services -l run=kubernetes-bootcamp</li>
<li>kubectl label pod $POD_NAME app=v1</li>
<li>kubectl describe pods $POD_NAME</li>
<li>kubectl get pods -l app=v1</li>
<li>kubectl delete service -l run=kubernetes-bootcamp</li>
<li>kubectl scale deployments/kubernetes-bootcamp --replicas=4</li>
<li>kubectl get pods -o wide</li>
<li>kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=jocatalin/kubernetes-bootcamp:v2 (set to new images)</li>
<li>kubectl rollout status deployments/kubernetes-bootcamp</li>
<li>kubectl rollout undo deployments/kubernetes-bootcamp</li>
</ul>
