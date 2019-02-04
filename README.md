Docker-TTV
==========

A docker image to run aceengine + aceproxy, e.g. to watch Torrent-TV.ru.

As a result, you will be able to watch AceStream live content without having AcePlayer and other dependencies installed locally.

Perfect for XBMC (even on Raspberry PI), Mac OSX, where AceStream in unavailable, or hard/expensive to launch.

TorrentTV's "local-ts-proxy" thing, which does the same, sucks cause it's windows-only, very buggy, and vendor locked-in. Aceproxy works better, is simpler, and can also handle other acestream content.


Installation
------------

First, install docker into your system. Read about it here: https://www.docker.io/gettingstarted/

Then just do something like this, to launch a proxy for Torrent-TV:

1. Build the image.
   ```
   docker build -t ikatson/aceproxy git://github.com/ikatson/docker-acestream-proxy.git
   ```
   OR download the binary one, this is faster
   ```
   docker pull ikatson/aceproxy:latest
   ```

2. Run the TorrentTV proxy with your key.
   ```
   docker run -t -p 8000:8000 ikatson/aceproxy
   ```

3. Read AceProxy manual for usage instructions: https://github.com/ValdikSS/aceproxy/wiki.
   
   Or for the simple case of trying to load another acesteam link with the format 
   `acestream://{channel_id}` you can use the following link:
   
   ```
   http://[SERVER_IP]:8000/pid/{channel_id}/stream.mp4
   ```
   
   This works as a stream in VLC or other media players.


Usage with Torrent-TV
---------------------
Copy the URL from "Мой Кабинет->Плейлист", and replace it here:

```
docker run -t -p 8000:8000 ikatson/aceproxy http://api.torrent-tv.ru/....
```

Then paste this URL into your player:
```
http://[SERVER_IP]:8000/ttvplaylist/ttvplaylist.m3u
```
