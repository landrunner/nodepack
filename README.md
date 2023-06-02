# nodepack
This Docker image is designed to compile and package a Node.js project along with its dependent node_modules. It can also be used to compile dependent node modules for other platforms.

## Usage
### Install QEMU Environment
```
sudo apt-get install qemu-user-static
```

### Compile and package
```
cd path_to_your_project
docker run -v /$(pwd):/work --rm -t landrunner1/nodepack:18
```

If you want to compile C++ code of dependent modules for another platform, you can specify the platform. 
Currently, the following platforms are available :  ```linux/arm/v7```, ```linux/arm64```, ```linux/amd64```.
```
cd path_to_your_project
docker run -v /$(pwd):/work --platform linux/arm/v7 --rm -t landrunner1/nodepack:18
```

If you want to compile typescript code, you can use ```type``` environment variable.
```
docker run -v /$(pwd):/work --env type=ts --rm -t landrunner1/nodepack:18
```

### DockerHub
https://hub.docker.com/repository/docker/landrunner1/nodepack


Please note that this is a simplified revision, and if you need any specific changes or additional information, feel free to let me know.
