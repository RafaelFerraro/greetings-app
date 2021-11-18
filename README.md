# greetings-app
A Ruby project, using the Sinatra framework and kubernetes, which aims to expose and persist greetings in different languages around the world.

Starts the minikube cluster:
```bash
minikube start --driver=docker
```

Build the k8s resources:
```bash
kubectl create -f deploy/webapp-deployment.yaml && \
kubectl create -f deploy/webapp-internalService.yaml && \ 
kubectl create -f deploy/webapp-ingress.yaml
```

Lastly, we have to map the ingress IP address to our defined host locally. To do so, we have to get the ingress IP address:
```bash
$ kubectl get ingress
NAME             CLASS   HOSTS        ADDRESS        PORTS   AGE
webapp-ingress   nginx   webapp.com   192.168.49.2   80      16m
```

Now, we should open the /etc/hosts and add the mapping there:
```
127.0.0.1	localhost
192.168.49.2 webapp.com
```

Finally, we should be able to hit webapp.com on our browser and see the app's response.

## Local development and tests

Requirements:
- docker
- docker-compose

```bash
docker-compose build
docker-compose up
```
