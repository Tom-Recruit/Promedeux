# Unblock IP

read -p "IP:" S1
sudo iptables -D FORWARD -d  $S1 -j DROP

# by JS
