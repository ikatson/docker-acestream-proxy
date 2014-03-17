#!/bin/bash

TTV_URL="$1"

if [[ -n "$TTV_URL" ]]; then
    cat > /home/tv/aceproxy-master/plugins/ttvplaylist_config.py << EOF
url = '$1'
host = False
EOF
    echo "Paste this URL into your player"
    echo "http://CHANGE_THIS_TO_SERVER_IP:8000/ttvplaylist/ttvplaylist.m3u"
fi

exec /usr/bin/supervisord
