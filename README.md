# docker-oracle


## Download docker Oracle Database image in your macchine
How to download and create an image in your macchine is explained here [Oracle Database on Docker](https://github.com/oracle/docker-images/blob/master/OracleDatabase/SingleInstance)
and [here] (https://github.com/oracle/docker-images/tree/master/OracleDatabase/SingleInstance)

For this you would need the zip file ```oracle-xe-11.2.0-1.0.x86_64.rpm.zip``` which you can download [here](http://download.xskernel.org/soft/linux-rpm/)

```
/image-to-build
	/11.2.0.2
		checkDBStatus.sh
		Checksum.xe
		Dockerfile.xe
		oracle-xe-11.2.0-1.0.x86_64.rpm
		runOracle.sh
		setPassword.sh
		xe.rsp
	buildDockerImage.sh
```	

## Create Oracle Database image in your macchine 

In my case to create the image oracle/database:11.2.0.2-xe I run the following
 
>buildDockerImage.sh -v 11.2.0.2 -x