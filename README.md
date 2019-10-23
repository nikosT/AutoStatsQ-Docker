# AutoStatsQ-Docker
Dockerization of the AutoStatsQ software https://github.com/gesape/AutoStatsQ.

* ## Dependencies
You must have Docker installed. 
Typical Ubuntu installation (https://docs.docker.com/install/linux/docker-ce/ubuntu/):
```
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```


* ## Download
```
git clone https://github.com/nikosT/AutoStatsQ-Docker.git
```
Set the ```ARCHIVE``` variable inside the ```Makefile``` to the path where your SDS structure is.


* ## Start the container
```
cd AutoStatsQ-Docker
make start
```

* ## Stop the container
```
exit
```

### Vault directory
Keep all of your work inside the ```/vault``` folder. Otherwise, when you exit the container, everything else will be lost.
