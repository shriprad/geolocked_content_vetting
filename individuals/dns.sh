#!/bin/bash

# This programm stores the IP of a website.

echo "Hello $(whoami)"

TIME=$(date "+%k")

if ((TIME < 12 )); then
    echo "Good morning"
elif ((TIME < 18 )); then
    echo "Good afternoon"
else
    echo "Good evening"
fi

echo " Please enter the website "

read web_link

echo " case id"

read id

#web_link='facebook.com'

host_ip=$( host $web_link | head -n1 | awk '{ print $4 }' )

echo $host_ip

country_code=$( geoiplookup $host_ip | awk '{ print $4 }' | tr "," "\n" )

echo $country_code

echo $(sudo sed -i '$ d' /etc/tor/torrc)

echo ExitNodes "{$country_code}" | sudo tee -a /etc/tor/torrc

echo $(sudo systemctl reload tor)

sleep 5

echo $(torsocks wkhtmltopdf $web_link $id.pdf )
