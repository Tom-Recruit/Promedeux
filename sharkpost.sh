# HTTP POST

int="wlan0"
#tshark -i $int -Y "http.request.method == POST" -T fields -e ip.src -e ip.dst -e ip.dst -e http.request.uri -e http.request.method
tshark -i $int -Y "http.request.method == POST" -V

#by JS
