#!/bin/bash

k8s_checks()
{

k8sconfig=`kubectl config view 2>/dev/null`

if [ "$k8sconfig" ]; then
  echo -e "\e[00;33m[+] Looks like there is a Kubernetes Cluster running \e[00m\n$k8sconfig"
  echo -e "\n"


k8sservices=`kubectl get services 2>/dev/null`
if [ "$k8sservices" ]; then
  echo -e "\e[00;33m[+] Services Running on Kubernetes cluster. \e[00m\n$k8sservices"
  echo -e "\n"
fi

k8spodswithlabels=`kubectl get pods --all-namespaces 2>/dev/null`
if [ "$k8spodswithlabels" ]; then
  echo -e "\e[00;33m[+] Kubernetes Pods with Labels \e[00m\n$k8spodswithlabels"
  echo -e "\e[00;33m[+] Run 'kubectl logs <pod-name>' to search for interesting information in logs\e[00m\n"
  echo -e "\e[00;33m[+] Run 'kubectl exec -it <pod-name> -- sh' to gain shell access into pods and extract information like 'printenv' etc \e[00m\n"
  echo -e "\n"
fi

k8snodes=`kubectl get nodes 2>/dev/null`
if [ "$k8snodes" ]; then
  echo -e "\e[00;33m[+] Kubernetes Nodes \e[00m\n$k8snodes"
  echo -e "\n"
fi

k8sevents=`kubectl get events 2>/dev/null`
if [ "$k8sevents" ]; then
  echo -e "\e[00;33m[+] Kubernetes Events. Check here for interesting \e[00m\n$k8sevents"
  echo -e "\n"
fi

k8ssecrets=`kubectl get secret -o json 2>/dev/null`
if [ "$k8ssecrets" ]; then
  echo -e "\e[00;33m[+] Fetch all Secrets stored in Kubernetes Cluster \e[00m\n$k8ssecrets"
  echo -e "\n"
fi

fi

}

