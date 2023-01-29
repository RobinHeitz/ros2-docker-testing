docker run --rm -it -p 8080:8080 theasp/novnc

docker run --rm -it -p 8080:8080 -e DISPLAY_HEIGHT=1000 -e DISPLAY_WIDTH=1800 theasp/novnc


# ROS2 Docker Dev-Setup

## Starting the ros container:
- Open a terminal window, cd into this repo's folder
- docker-compose up --build

Now, when opening a browser, the display is visible: http://localhost:8080/vnc.html


## Connecting into the running container:
- docker-compose exec ros bash
where ros it the service name defined in 'docker-compose.yaml'.

There, you have to source:
- source /opt/ros/humble/setup.bash
- source install/setup.bash (within your workspace)


## Trouble with display output?
Maybe *xhost +local:docker* does the trick  


# Turtlebot setup (https://docs.ros.org/en/humble/Tutorials/Beginner-CLI-Tools/Introducing-Turtlesim/Introducing-Turtlesim.html)
1. start XQuartz and expose current IP: xhost + <ip>
1. in Container, export $DISPLAY to ip:0, e.g. 192.168.0.234:0
1. Should work now, if it doesn't, set env var QT_DEBUG_PLUGINS=1 for further details.


# XQuartz setup example with ubuntu 18.04 container
1. Install XQuartz, settings-> security -> Check 'allow network connection'
1. get host ip adress with 'ifconfig en0' -> inet
1. start XQuartz terminal, xhost + <IP-Adress>
1. run docker container with IP exposed as $DISPLAY (can check within container with echo $DISPLAY):
docker run -it -e DISPLAY=$IP:0 -v /tmp/.X11-unix:/tmp/.X11-unix <image>
1. (if firefox not installed: apt-get update && apt-get install firefox -y)
1. start firefox from termial: firefox


# Maybe: rocker for launching GUI Applications like RViz in another container (but with correct forwarding/ settings etc.)

#### NEED TO EXPORT ENV VARIABLES IN EVERY TERMINAL (DOCKER EXEC-CMD!!!!)