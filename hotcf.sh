# Auto Config

read -p "Nuevo SSID: " ssid
read -p "Nuevo Pass:(> 8 chars) " pass
#read -p "Nuevo Rango(Ej: 10.0.1.2,10.0.1.100,255.255.255.0,24h): " range

sed -i "s/^ssid=.*/ssid=$ssid/" /etc/hostapd/hostapd.conf
sed -i "s/^wpa_passphrase=.*/wpa_passphrase=$pass/" /etc/hostapd/hostapd.conf

#sed -i "s/^dhcp-range=.*/dhcp-range=$range/" /etc/dnsmasq.conf

sudo ifconfig wlan0 down
sleep 1
sudo ifconfig wlan0 up

sudo ./hotup.sh

#by JS
