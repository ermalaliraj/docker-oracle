# docker-oracle

How to Create a Docker Image with Oracle 11.2.0.2-xe.

## Download source and scripts

### Docker scripts files
A full HOW TO create an image in your macchine is explained here [Oracle Database on Docker](https://github.com/oracle/docker-images/blob/master/OracleDatabase/SingleInstance)
and [here](https://github.com/oracle/docker-images/tree/master/OracleDatabase/SingleInstance).
In this project you have all you need to create Oracle 11.2.0.2-xe. 

### Oracle rpm file
Nevertheless you will need Oracle source files, which are not present in the links above. 
Oracle files are present in the file ```oracle-xe-11.2.0-1.0.x86_64.rpm.zip``` which you can download [here](http://download.xskernel.org/soft/linux-rpm/).

### Final structure
Your file system should look like this, before running the command.
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

## Create Oracle Database Docker image

To create the image ```	oracle/database:11.2.0.2-xe``` in your local, run the following. If you are in Windows, you can use ```Git Bash```
 
>buildDockerImage.sh -v 11.2.0.2 -x

After build success you will see the following in your locak images.
![Images](./doc/docker_images_oracle_standard.jpg)