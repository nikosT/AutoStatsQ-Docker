# AutoStatsQ-Docker
Dockerization of the AutoStatsQ software

## Download
```
git clone https://github.com/nikosT/AutoStatsQ-Docker.git
cd AutoStatsQ-Docker
```

## Start the container:
```
make start
```

## Stop the container:
```
exit
```

### Vault directory
Keep all of your work inside the ```/vault``` folder. Otherwise, when you exit the container, everything else will be lost.

### Archive directory
Set the ```ARCHIVE``` variable inside the ```Makefile``` to the path where your SDS structure is.
