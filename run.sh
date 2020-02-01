#
## Run only one time.
#

# Create VMs.
#docker-machine create --driver virtualbox node-master1; for N in 1 2 3 4; do docker-machine create --driver virtualbox node-worker$N; done;

# Create cluster.
#sudo docker swarm init --advertise-addr vboxnet1

### Join workers.
## docker swarm join --token [TOKEN] [MANAGER_IP]:[MANAGER_PORT]
# docker-machine ssh node-worker1
# docker-machine ssh node-worker2
# docker-machine ssh node-worker3
# docker-machine ssh node-worker4

# Create local Service to store Docker Images
#sudo docker service create --name images-repository --publish 5000:5000 registry:2


#
## Run every Image building.
#

# Build Images
sudo docker build -t api-gateway-image ./api-gateway/
sudo docker build -t users-service-image ./Services/Users-Service/
sudo docker build -t spots-service-image ./Services/Spots-Service/

# Tag Images to `localhost:5000`
sudo docker tag api-gateway-image localhost:5000/api-gateway-image
sudo docker tag users-service-image localhost:5000/users-service-image
sudo docker tag spots-service-image localhost:5000/spots-service-image
# Push Images to `localhost:5000`
sudo docker push localhost:5000/api-gateway-image
sudo docker push localhost:5000/users-service-image
sudo docker push localhost:5000/spots-service-image

# Deploy
#sudo docker stack rm aircnc-stack
sudo docker stack deploy -c docker-compose.yml aircnc-stack