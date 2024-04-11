# eks-ecr-demo
aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 573327415341.dkr.ecr.ap-southeast-1.amazonaws.com
  114  docker build -t ecs-ecr-service .
  115  docker images
  116  docker tag ecs-ecr-service:latest 573327415341.dkr.ecr.ap-southeast-1.amazonaws.com/ecs-ecr-service:latest
  117  docker push 573327415341.dkr.ecr.ap-southeast-1.amazonaws.com/ecs-ecr-service:latest
  118  vi deployment.yaml
  119  ls
  120  ls
  121  vi service.yaml
  122  kubectl get svc
  123  kubectl version
  124  eksctl create cluster --name gideon-cluster --region ap-southeast-1 --fargate
  125  aws eks update-kubeconfig  --name gideon-cluster --region ap-southeast-1
  126  kubectl version
  127  kubectl version
  128  kubectl apply -f deployment.yaml
  129  kubectl get pods
  130  kubectl get deploy
  131  kubectl get pods
  132  kubectl get pods
  133  kubectl get pods -w
  134  kubectl get deploy
  135  kubectl apply -f service.yml
  136  kubectl apply -f service.yaml
  137  kubectl get pods
  138  kubectl get pods
  139  kubectl logs hello-world-6948b5c59c-cvrsv
  140  kubectl get svc
  141  kubectl get pods
