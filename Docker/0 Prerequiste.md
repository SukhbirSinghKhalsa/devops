# Docker Prerequistes

```bash
Hello Dear Friends, lets grow together in this journey of DevOps, let's get into Docker today
```

Before we get into Docker, let's first understand Virtualization
>>What is Virtualization?   
1. Virtualization in simple terms a way to run the different types of operating systems over your operating system by sharing its hardware resources.   
2. To enable virtualization a layer of hypervisor is setup over our base OS, which is a software that helps allocating the physical hardware resources to the virtual OS.
3. some of the software that supports virtualization includes Virtual Box, Vmware, Hyper-V and more.
4. So we simply can download the ISO image of operating systems and run them inside the above mentioned softwares
<br><br>

>>Uses of virtualization
1. Testing your applications in different operating system environments.
2. Reduced any extra hardware costs of buying the different machines
3. Virtualization is heavily used in cloud environments to create virtual resources like virtual machine, virtual network and more
<br><br>

>> Issues with Virtualization
1. <b>Wastage of Memory,</b>- Each operating system will take up its own full space, eg: 2gb per different os
2. <b>High Restart time </b>- Each OS will take some time to boot up itself
3. <b>High Downtime </b>-  Misconfigurations of OS, accential deletion of required files can lead to High downtime of the virtualized system
<br><br>


>>What is Docker?   
1. Docker is an Open Source tool that came into picture to solve some of the problem with Virtualization
2. It is similar to virtualization, and instead of installing the whole operating system it will install the part of OS that is needed to run particular application
3. In place of Hypervisor, Docker engine is used as a middle layer between our Host OS and Containers
4. The basic buiding component of Docker is Image
5. Image is a collection of your desired application along with its necessary files to run that application
6. With the help of images we can create multiple containers in very less time
7. Example - You want to run nginx server in your windows OS, so you can download the nginx image and create container out of it, you see no more need to install the full Ubuntu or any Linux based OS with docker
8. It helps to port the applications faster as once it is packaged it can run in almost all environment you just need to sent it to desired person
