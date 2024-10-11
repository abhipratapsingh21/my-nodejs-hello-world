1. NodeJs app- http://localhost:8080


2. Sonarcube setup done on cloud. Please find the below URL-
sonarcloud.io
Note: I will show the SonarCube setup during Interview Demo.


3. DockerHub- https://hub.docker.com/r/asmanjan/nodejs-image



4. docker run -itd -p 8080:80 asmanjan/nodejs-image

root@LAPTOP-AIQD9I4H:/home/test# docker ps
CONTAINER ID   IMAGE                   COMMAND                  CREATED         STATUS         PORTS
                         NAMES
36a3d0dff2f5   asmanjan/nodejs-image   "docker-entrypoint.s…"   2 seconds ago   Up 2 seconds   8080/tcp, 0.0.0.0:8080->80/tcp, :::8080->80/tcp   zealous_leakey


root@LAPTOP-AIQD9I4H:/home/test# curl http://localhost:8080
Hello World!root@LAPTOP-AIQD9I4H:/home/test#
