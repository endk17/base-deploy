#!/bin/bash
exists()
{
  command -v "$1" >/dev/null 2>&1
}

echo "---------------------------------------------------"
echo -e "\e[32mStep 1: Script Initialization \e[0m" && sleep 2

sudo apt install curl -y
curl -s https://raw.githubusercontent.com/endk17/base-deploy/main/logo.sh | bash


echo "---------------------------------------------------"
echo -e "\e[32mSelect an action. Enter the required number and confirm with the Enter key\e[0m" && sleep 3
echo -e ""
echo "1 - Install the node (Base)"

read doing

case $doing in 
  1) 
  echo "---------------------------------------------------"
  echo -e "\e[32mStep 2: Downloading and installing the node: \e[0m" && sleep 2

  sudo apt-get update && sudo apt-get upgrade -y
  sleep 3
  sudo apt-get install curl
  sleep 3
  wget https://raw.githubusercontent.com/endk17/base-deploy/main/install-docker.sh
  chmod +x docker.sh && ./docker.sh
  sleep 3
  sudo apt-get update && sudo apt install jq && sudo apt install apt-transport-https ca-certificates curl software-properties-common -y && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin && sudo apt-get install docker-compose-plugin
  sleep 3
  git clone https://github.com/endk17/base-node
  screen -S base
  cd node

  echo "---------------------------------------------------"
  echo -e "Node installation is complete."
  echo "---------------------------------------------------"
  sleep 1
  echo "---------------------------------------------------"
  echo -e "Step 3: Launching the node"
  echo "---------------------------------------------------"
  sleep 1
  docker compose up
  ;;
esac
