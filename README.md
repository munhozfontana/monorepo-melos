# monorepo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## k8s + kind

Reset

`kind delete cluster --name backoffice-demo && kind create cluster --name backoffice-demo --config ./config/k8s/kind-cluster.yml`
`kind delete cluster --name backoffice-demo && kind create cluster --name backoffice-demo --config ./config/k8s/kind-cluster.yml && kubectl apply -f config/k8s/backoffice-deployment.yaml`

Cria

`kind create cluster --name backoffice-demo --config config/k8s/kind-cluster.yml`

Deploy

`kubectl apply -f config/k8s/backoffice-deployment.yaml`

Restart
`kubectl rollout restart deployment`
