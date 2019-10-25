# AutoStatsQ-Docker
Dockerization of the AutoStatsQ software https://github.com/gesape/AutoStatsQ.

* ## Dependencies
You must have Docker installed.
```
sudo apt install docker
```

Other Docker installation for Ubuntu can be find here: https://docs.docker.com/install/linux/docker-ce/ubuntu/.


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
