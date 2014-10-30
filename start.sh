#!/bin/bash

TTV_URL="$1"

if [[ -n "$TTV_URL" ]]; then
    cat > /home/tv/aceproxy-master/plugins/config/torrenttv.py << EOF
url = '$1'
updateevery = 0
EOF
    echo "Paste this URL into your player"
    echo "http://CHANGE_THIS_TO_SERVER_IP:8000/torrenttv/torrenttv.m3u"
fi

sed -i 's/vlcuse = False/vlcuse = True/' /home/tv/aceproxy-master/aceconfig.py
sed -i 's/videoobey = True/videoobey = False/' /home/tv/aceproxy-master/aceconfig.py
sed -i 's/videopausedelay = .*/videopausedelay = 0/' /home/tv/aceproxy-master/aceconfig.py
sed -i 's/videodelay = .*/videodelay = 0/' /home/tv/aceproxy-master/aceconfig.py
sed -i 's/videodestroydelay = .*/videodestroydelay = 30/' /home/tv/aceproxy-master/aceconfig.py

exec /usr/bin/supervisord
