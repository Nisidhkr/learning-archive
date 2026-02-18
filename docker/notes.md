# Docker Commands

## Check Docker Service Status
```bash
sudo systemctl status docker
```
Checks if the Docker service is running on your system.

## List Running Containers
```bash
docker ps
```
Shows all containers that are currently running.

## Add User to Docker Group
```bash
sudo usermod -aG docker $USER
```
Adds your current user to the docker group so you can run docker commands without using `sudo`. You'll need to log out and log back in for this to take effect.

## Pull a Docker Image
```bash
docker pull image-name
```
Example: `docker pull hello-world`

Downloads an image from Docker Hub.

## View Downloaded Images
```bash
docker images
```
Lists all Docker images on your system.

## Run a Container
```bash
docker run image-name
```
Example: `docker run hello-world`

Creates and starts a new container from an image.

## Creating a Docker Image with a Dockerfile

A Dockerfile contains instructions to build a Docker image. Docker images include your application code, libraries, OS info, frameworks, and tools.

**Workflow:** Dockerfile → Image → Container

### Dockerfile Instructions

**1. FROM - Set Base Image**
```bash
FROM openjdk:17-jdk-alpine
```
Specifies the base image with required tools and libraries. Example: Java environment.

**2. WORKDIR - Create Working Directory**
```bash
WORKDIR /app
```
Sets the directory where your application code will be stored in the container.

**3. COPY - Copy Files**
```bash
COPY . /app
```
Copies files from your host machine to the container.

**4. RUN - Execute Commands**
```bash
RUN javac src/Main.java
```
Runs commands during image build (e.g., compiling code).

**5. CMD - Run Application**
```bash
CMD ["java", "Main"]
```
Specifies the default command to run when the container starts. Can be overridden.

**Note:** Use `ENTRYPOINT` if you need a command that cannot be overridden.

### Build a Docker Image
```bash
docker build -t javaApp .
```
Creates an image named `javaApp` from the Dockerfile in the current directory.

**Important:** Update the Dockerfile whenever your source code changes for changes to take effect.


.......................................................


# build the jar and Docker image (skip tests for speed)
mvn -U clean package -DskipTests

# build Docker image
docker build --no-cache -t chatappf .

# run container and publish port 8080 to host
docker run -d --name chatappf -p 8080:8080 chatappf

docker start chatappf

.............................................................................

# Docker networking
1. Host: 
2. Bridge (Default)
3. UserDefined Bridge (Custom)
4. None
5. MACVLAN (Docker Swarm)
6. IPVLAN
7.