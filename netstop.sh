# Network Stop

int="wlan0"

rule_exists() {
    sudo iptables -C INPUT -i $int -j DROP > /dev/null 2>&1
}

#sudo iptables -A INPUT -i lo -j ACCEPT
#sudo iptables -A OUTPUT -o lo -j ACCEPT

if rule_exists; then
    sudo iptables -D INPUT -i $int -j DROP
    sudo iptables -D OUTPUT -j DROP
    sudo iptables -D FORWARD -j DROP
else
    sudo iptables -A INPUT -i $int -j DROP
    sudo iptables -A OUTPUT -j DROP
    sudo iptables -I FORWARD 1 -j DROP
fi

#by JS
