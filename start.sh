#!/bin/bash

TTV_URL="$1"

if [[ -z "$TTV_URL" ]]; then
    echo 'Missing argument TTV_URL. Aborting.' >&2
    exit 1
fi

cat > /home/tv/aceproxy-master/plugins/ttvplaylist_config.py << EOF
url = '$1'
host = False
EOF

exec /usr/bin/supervisord
