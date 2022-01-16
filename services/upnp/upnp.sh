  #!/bin/bash

  LOCAL_IP=$( ip a show wlp2s0 | grep 'inet ' | awk '{ print $2 }' | cut -f1 -d'/' )
  echo "local IP is $LOCAL_IP"

  GATEWAY_IP=$( ip r | grep default | awk '{ print $3}' )
# upnpc -e "Certbot" -r 80 80 tcp
# upnpc -e "Certbot" -r 443 443 tcp

  for PORT in 8090
  do
  echo "upnp $PORT"
  upnpc -a $LOCAL_IP $PORT $PORT TCP  
  done
