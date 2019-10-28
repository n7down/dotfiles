#!/bin/bash

# Uee dockerfs.sh CONTAINER_NAME_OR_ID and it will take you into the directory on your 
# machine where the container rootfs is mounted. You can look around and edit any files 
# using tools from your own machine (vim, grep, find, awk, etc.), which are, more often 
# than not, stripped away from the container image to save space.
# https://www.reddit.com/r/docker/comments/dnxda4/top_15_docker_commands_you_should_know/

#P=$(docker inspect $@ | jq '.[].State.Pid')
P=$(docker inspect $@ | jq '.[].State.Pid')
sudo sh -c "cd /proc/$P/root/; bash"
