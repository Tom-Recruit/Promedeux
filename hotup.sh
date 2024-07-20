# HotSpot UP

sudo cp interfaces.hotspot /etc/network/interfaces
sudo ifconfig wlan0 down
sleep 1
sudo ifconfig wlan0 up
sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl enable dnsmasq
sudo service hostapd restart
sudo service dnsmasq restart

#by JS
