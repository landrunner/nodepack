# nodepack
This is a Docker image to compile and pack a node project with dependent node_modules.  
It also can be used for compiling dependent node modules for other platforms.

## Usage
### Install Cross Docker Environment
```
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
```

### Compile and package
```
cd path_to_your_project
docker run -v /$(pwd):/work --rm -t landrunner1/nodepack:18
```

If you want to compile C++ code of dependent moudles for another platform, you can specify the platform.
Currentry, ```linux/arm/v7```, ```linux/arm64```, ```linux/amd64``` are available for the platform.
```
cd path_to_your_project
docker run -v /$(pwd):/work --platform linux/arm/v7 --rm -t landrunner1/nodepack:18
```

### DockerHub
https://hub.docker.com/repository/docker/landrunner1/nodepack

