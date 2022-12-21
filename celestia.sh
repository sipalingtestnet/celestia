#!/bin/bash
clear
echo -e "\033[0;33m"
echo "================================"
echo " ███████ ██████  ████████     ";
echo " ██      ██   ██    ██        ";
echo " ███████ ██████     ██        ";
echo "      ██ ██         ██        ";
echo " ███████ ██         ██    	 ";
echo "================================"
echo -e "\e[0m"
echo -e '\e[33mNama Project =\e[55m' TESTNET CELESTIA-MOCHA
echo -e '\e[33mKomunitas Kami =\e[55m' Sipaling Testnet
echo -e '\e[33mChannel Telegram =\e[55m' https://t.me/ssipalingtestnet
echo -e '\e[33mGroup Telegram =\e[55m' https://t.me/diskusisipalingairdrop
echo -e "\e[0m"

sleep 2

echo -e "\e[1m\e[32m1. Install packages... \e[0m" && sleep 1
sudo apt update && sudo apt upgrade -y
sudo apt install curl tar wget clang pkg-config libssl-dev jq build-essential bsdmainutils git make ncdu gcc git jq chrony liblz4-tool -y


echo -e "\e[1m\e[32m2. Install GO... \e[0m" && sleep 1
ver="1.19.1"
cd $HOME
wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz"
rm "go$ver.linux-amd64.tar.gz"
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.bash_profile
source $HOME/.bash_profile
go version

echo -e "\e[1m\e[32m3. Build Binary... \e[0m" && sleep 1
cd $HOME
rm -rf celestia-app
git clone https://github.com/celestiaorg/celestia-app.git
cd celestia-app/
git checkout v0.11.0
make install
celestia-appd version # 0.11.0


echo -e "\e[1m\e[32m4. Setup P2P Network... \e[0m" && sleep 1
cd $HOME
rm -rf networks
git clone https://github.com/celestiaorg/networks.git


echo -e "\e[1m\e[32m5. Set Vars... \e[0m" && sleep 1
celestia-appd config node tcp://localhost:${CELESTIA_PORT}657
celestia-appd config chain-id $CELESTIA_CHAIN_ID
celestia-appd init $CELESTIA_MONIKER --chain-id $CELESTIA_CHAIN_ID

echo -e "\e[1m\e[32m6. Download Genesis... \e[0m" && sleep 1
wget -O $HOME/.celestia-app/config/genesis.json "https://raw.githubusercontent.com/celestiaorg/networks/master/mocha/genesis.json"

echo -e "\e[1m\e[32m7. Download Addressbook... \e[0m" && sleep 1
wget -O $HOME/.celestia-app/config/addrbook.json "https://raw.githubusercontent.com/vinjan23/Testnet.Guide/main/Celestia/addrbook.json"

echo -e "\e[1m\e[32m1. Dikit Lagi Say... \e[0m" && sleep 1

echo '--------------DONO----------------'
