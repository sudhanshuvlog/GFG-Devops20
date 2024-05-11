# Docker

Before going into Docker, Let's understand How companies used to deploy applications in a server. They have different methods for deploying applications:

- Bare Metal Servers involve installing the operating system directly on a physical server, making recovery slow in case of application crashes, and it could take around 30 minutes. With Virtual Machines like AWS EC2, a hypervisor manages virtual machines, reducing downtime but still taking around 2-3 minutes to restart. Docker, a containerization technology, uses images to create lightweight and isolated containers, allowing for instant recovery within seconds if the application crashes.
  
## What is Docker?

Docker is a tool designed to create, deploy, and run applications using containers. Containers package an application with its dependencies, allowing it to run consistently across various environments.

## What is Docker Image?

Docker Image is a template for creating Docker containers. It contains all dependencies and libraries needed to run an application. We can create a Docker image by using Dockerfile or by using the docker commit command. It is like a Package that contains all the dependencies and libraries required to run the application.

## What is a Docker Container?

A Docker Container is a running instance of a Docker image. We can create a Docker container from a Docker image. It is similar to a virtual machine but more lightweight.
<br>

For more reference, [Click Here](https://www.docker.com/resources/what-container/)<br>

#### Learn About virtualization - https://aws.amazon.com/what-is/virtualization/

### Why Docker is Fast? 

- Docker uses the kernel of the host machine. It doesn't need to create a new kernel for each container. This makes Docker lightweight and fast.
- If we run a command, it's just a process running on the host machine. It doesn't need to create a new kernel for each command.
- Docker Containers are just processes running on the host machine. They are not virtual machines. They are lightweight and fast.

---

## Namespaces

***Namespaces are a feature of the Linux kernel that partitions kernel resources such that one set of processes sees one set of resources while another set of processes sees a different set of resources.***

You can read more about namespaces [here](https://www.nginx.com/blog/what-are-namespaces-cgroups-how-do-they-work/).

---

## Kernal

- The kernel is the core of the operating system. It is responsible for managing the resources of the system and for communicating with the hardware.
- In simple words the kernel is the interface between the hardware and the software.
- The kernel is responsible for managing the resources of the system such as the CPU, the memory, the disk, etc.

### Docker Commands

- **docker version**: Shows Docker version.
- **docker info**: Displays Docker information.
- **docker images**: Lists all Docker images.
- **docker ps**: Shows running Docker containers.
- **docker ps -a**: Lists all Docker containers.
- **docker pull <image-name>**: Pulls a Docker image from the Docker Hub.
- **docker run <image-name>**: Runs a Docker image, creating a Docker container.
- **docker run -it <image-name>**: Runs a Docker image, creating a Docker container with an open interactive terminal.
- **docker run -it -d <image-name>**: Create a  Docker container but run it in background( detach mode).
- **docker run -it -d -p 8080:80 <image-name>**: Runs a Docker image, creating a background Docker container, mapping port 8080 on the host to port 80 on the container.
- **docker attach <container-id>**: Attaches the terminal to a Docker container.
- **docker exec -it <container-id> bash**: Opens a terminal in a Docker container.
- **docker stop <container-id>**: Stops a Docker container.
- **docker start <container-id>**: Starts a Docker container.
- **docker rm <container-id>**: Deletes a Docker container.
- **docker rmi <image-id>**: Deletes a Docker image.
- **docker commit <container-id> <image-name>**: Creates a Docker image from a Docker container.
- **docker rm -f <container-id>**: Deletes a Docker container forcefully.
- **docker rm -f $(docker ps -a -q)**: Deletes all Docker containers forcefully.
- **docker rmi -f <image-id>**: Deletes a Docker image forcefully.
- **netstat -tnlp**: Displays all ports running on the host machine.
- **ctrl+p+q**: Detaches the terminal from the Docker container without stopping it.
- **docker run -p 80:80 -d --name webos -v /mydata/:/usr/share/nginx/html  nginx** Mount a local     directory with the container to get persistent volume

- Docker Architecture -
  <img width="596" alt="image" src="https://github.com/sudhanshuvlog/GFG-Devops18/assets/124223047/3624888c-0dd8-46c8-bcdc-4229fde9b825">

- Dockerfile- https://docs.docker.com/reference/dockerfile/#:~:text=Docker%20can%20build%20images%20automatically,line%20to%20assemble%20an%20image.

Important Document Links:

1) What are containers - https://www.docker.com/resources/what-container/
2) What is container Runtime - https://www.docker.com/products/container-runtime/
3) Dockerhub Registery - https://hub.docker.com/repositories/jinny1
4) Docker Architecture - https://docs.docker.com/get-started/overview/
5) Docker Compose - https://docs.docker.com/network/drivers/
6) Docker Network Drivers - https://docs.docker.com/network/drivers/
7) DockerHub - https://hub.docker.com/repositories/jinny1
8) *Why Docker Is Fast*- Check Docker Underlying Technology 👇
`Docker is written in the Go programming language and takes advantage of several features of the Linux kernel to deliver its functionality. Docker uses a technology called *namespaces* to provide the isolated workspace called the container. When you run a container, Docker creates a set of namespaces for that container.`

*What Is Namespace* - https://www.nginx.com/blog/what-are-namespaces-cgroups-how-do-they-work/

- `docker save -o image.tar myimg` - save a Docker images to a tar archive
- `docker load -i image.tar` - load Docker images from a tar archive

