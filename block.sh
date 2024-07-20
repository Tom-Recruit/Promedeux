# Block IP

read -p "IP:" S1
sudo iptables -I FORWARD -d $S1 -j DROP

#by JS
