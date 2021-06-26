echo $(sed -i '$ d' /etc/tor/torrc)

# echo $(sudo systemctl reload tor)


echo ExitNodes "{us}" | sudo tee -a /etc/tor/torrc

echo $(sudo systemctl reload tor)

echo $(sudo systemctl restart privoxy)
# echo $( torsocks curl ipinfo.io/country )

echo $(torsocks wkhtmltopdf www.google.com google.pdf )
