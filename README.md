Docker-TTV
==========

A docker image to run aceengine + aceproxy, e.g. to watch Torrent-TV.ru.

TorrentTV's "local-ts-proxy" thing sucks, but aceproxy is better, simpler, and can also handle other sites.


Installation
------------

First, install docker into your system. Read about it here: https://www.docker.io/gettingstarted/

Then just do something like this, to launch a proxy for Torrent-TV:

1. Build the image.
   
  ```
  docker build -t aceproxy-git git://github.com/ikatson/docker-acestream-proxy.git
  ```
2. Run the TorrentTV proxy with your key.
  
  ```
  docker run -t -p 8000:8000 aceproxy-git
  ```
3. Read AceProxy manual for usage instructions: https://github.com/ValdikSS/aceproxy/wiki.


Usage with Torrent-TV
---------------------
Copy the URL from "Мой Кабинет->Плейлист", and replace it here:

```
docker run -t -p 8000:8000 aceproxy-git http://api.torrent-tv.ru/....
```

Then paste this URL into your player:
```
http://[SERVER_IP]:8000/ttvplaylist/ttvplaylist.m3u
```
