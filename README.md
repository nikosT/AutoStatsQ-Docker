# AutoStatsQ-Docker
Dockerization of the AutoStatsQ software https://github.com/gesape/AutoStatsQ.

* ## Download
```
git clone https://github.com/nikosT/AutoStatsQ-Docker.git
```
Set the ```ARCHIVE``` variable inside the ```Makefile``` to the path where your SDS structure is.


* ## Start the container:
```
cd AutoStatsQ-Docker
make start
```

* ## Stop the container:
```
exit
```

### Vault directory
Keep all of your work inside the ```/vault``` folder. Otherwise, when you exit the container, everything else will be lost.
