ARG ROS_DISTRO=humble
FROM ros:${ROS_DISTRO}

# ARG USERNAME=ros
# ARG USER_UID=1000
# ARG USER_GID=$USER_UID

ARG WORKSPACE=ros2_dev_ws
WORKDIR /root/${WORKSPACE}


# Uncomment this line and add custom packages and dependencies you want to install here.
RUN apt-get -qq update && apt-get -qq upgrade -y && apt-get install -y \
    git \
    python3-pip \
    python3-colcon-common-extensions \
    python3-rosdep \
    #ros-${ROS_DISTRO}-moveit \
    ros-humble-rqt* \
    #ros-${ROS_DISTRO}-ros2-control \
    nano &&\
    rm -rf /var/lib/apt/lists/*




# Copy all pkgs from /src into the workspace
COPY ros2_dev_ws /root/${WORKSPACE}

# RUN groupadd --gid $USER_GID $USERNAME \
#     && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME
    # [Optional] Add sudo support for the non-root user
    # && apt-get update \
    # && apt-get install -y sudo \
    # && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
    # && chmod 0440 /etc/sudoers.d/$USERNAME \
    # # Cleanup
    # && rm -rf /var/lib/apt/lists/* \
    # && echo "source /usr/share/bash-completion/completions/git" >> /home/$USERNAME/.bashrc \
    # && echo "if [ -f /opt/ros/${ROS_DISTRO}/setup.bash ]; then source /opt/ros/${ROS_DISTRO}/setup.bash; fi" >> /home/$USERNAME/.bashrc





# build workspace
#RUN colcon build

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


