ARG ROS_DISTRO=humble
FROM osrf/ros:${ROS_DISTRO}-desktop-full


ARG WORKSPACE=ros2_dev_ws
WORKDIR /root/${WORKSPACE}


# Uncomment this line and add custom packages and dependencies you want to install here.
RUN apt-get -qq update && apt-get -qq upgrade -y && apt-get install -y \
    python3-colcon-common-extensions \
    python3-rosdep \
    ros-${ROS_DISTRO}-moveit \
    ros-${ROS_DISTRO}-ros2-control 


# Copy all pkgs from /src into the workspace
COPY ros2_dev_ws /root/${WORKSPACE}
# WORKDIR /colcon_melfa/src
# RUN rosdep update -y -r && \
#     apt-get update && \
#     rosdep install --from-paths /colcon_melfa/src --ignore-src --rosdistro ${ROS_DISTRO} -y -r

# WORKDIR /root/${WORKSPACE}
# RUN source /opt/ros/${ROS_DISTRO}/setup.bash && \
#     colcon build 



# build workspace
RUN colcon build

# WORKDIR /colcon_melfa
# RUN source /opt/ros/${ROS_DISTRO}/setup.bash && \
#     # source /colcon_melfa/install/setup.bash && \
#     colcon build \
#     --cmake-args -DCMAKE_BUILD_TYPE=Release && \
#     source /colcon_melfa/install/setup.bash

# WORKDIR /

# copy entrypoint scripts and make executable
COPY scripts/*.sh /
RUN find . -iname "*.sh" -exec bash -c 'chmod +x "$0"' {} \;

#ENTRYPOINT ./melfa_control.sh ./melfa_demo.sh


