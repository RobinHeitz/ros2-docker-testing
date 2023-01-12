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