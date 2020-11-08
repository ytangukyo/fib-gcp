docker build -t cromulentscientist/fib-k8s-client:latest -t cromulentscientist/fib-k8s-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t cromulentscientist/fib-k8s-server:latest -t cromulentscientist/fib-k8s-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t cromulentscientist/fib-k8s-worker:latest -t cromulentscientist/fib-k8s-worker:$GIT_SHA -f ./worker/Dockerfile ./worker
docker push cromulentscientist/fib-k8s-client:latest
docker push cromulentscientist/fib-k8s-server:latest
docker push cromulentscientist/fib-k8s-worker:latest
docker push cromulentscientist/fib-k8s-client:$GIT_SHA
docker push cromulentscientist/fib-k8s-server:$GIT_SHA
docker push cromulentscientist/fib-k8s-worker:$GIT_SHA
kubectl apply -f .
kubectl set image deployments/server-deployment server=cromulentscientist/fib-k8s-server:$GIT_SHA
kubectl set image deployments/client-deployment client=cromulentscientist/fib-k8s-client:$GIT_SHA
kubectl set image deployments/worker-deployment worker=cromulentscientist/fib-k8s-worker:$GIT_SHA

