---
layout: post
title: On-premise Kubernetes on Cluster
date: 2018-09-07 23:57:10.000000000 +08:00
type: post
categories: [Cloud, Kubernetes]
author: Yilong
---

## Prerequests

Ubuntu 16.04+
Debian 9
CentOS 7
RHEL 7
Fedora 25/26 (best-effort)
HypriotOS v1.0.1+
Container Linux (tested with 1800.6.0)

## Installing Docker kubeadm, kubelet and kubectl

kubeadm: the command to bootstrap the cluster.

kubelet: the component that runs on all of the machines in your cluster and does things like starting pods and containers.

kubectl: the command line util to talk to your cluster.

## Kubenetes Cluster

start Master node

    $ kubeadm init --pod-network-cidr=192.168.0.0/16
    
Installing a pod network add-on

    $ sysctl net.bridge.bridge-nf-call-iptables=1
    $ KUBECONFIG=/etc/kubernetes/admin.conf kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml
    $ KUBECONFIG=/etc/kubernetes/admin.conf kubectl -n kube-system delete ds kube-proxy
    $ docker run --privileged --net=host k8s.gcr.io/kube-proxy-amd64:v1.10.2 kube-proxy --cleanup
    $ KUBECONFIG=/etc/kubernetes/admin.conf kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter-all-features.yaml

Install Dashborad

    $ kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml

Allow deploy on Master node

    $ kubectl taint nodes --all node-role.kubernetes.io/master-

Worker node join

    $ kubeadm join --token <token> <master-ip>:<master-port> --discovery-token-ca-cert-hash sha256:<hash>

## Install Helm (Package Management Tool)

    $ helm ls
    $ helm repo update
    $ helm install stable/xxxx

## Reference 

https://kubernetes.io/docs/setup/independent/install-kubeadm/
