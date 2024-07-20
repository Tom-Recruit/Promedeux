# HotSpot DOWN

sudo cp interfaces.normal /etc/network/interfaces
sudo ifconfig wlan0 down
sleep 1
sudo ifconfig wlan0 up
sudo service hostapd stop
sudo service dnsmasq stop

#by JS
