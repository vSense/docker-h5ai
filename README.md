# What is h5ai ?

h5ai is a modern file indexer for HTTP web servers with focus on your files. Directories are displayed in a appealing way and browsing them is enhanced by different views, a breadcrumb and a tree overview.

> [More info](https://larsjung.de/h5ai/)

![Sickrage](https://raw.githubusercontent.com/vSense/docker-h5ai/master/logo.png)

# How to run this image ?

h5ai is already packaged but it is not very useful as is. The best way is to install h5ai locally in the folder you want to serve and to mount this folder into the container:

```
wget https://release.larsjung.de/h5ai/h5ai-0.27.0.zip
unzip h5ai-0.27.0.zip -d /some/folder
docker run -d --name h5ai --hostname h5ai -v /srv/seedbox:/var/www vsense/h5ai
```
Then you can access http://containerIP. Exposed port are 80 and 443. To bind them on the host:

```
docker run -d --name h5ai --hostname h5ai -v /srv/seedbox:/var/www -p 80:80 -p 443:443 vsense/h5ai
```

# Systemd Unit

```
# /etc/systemd/system/h5ai.service
[Unit]
Description= h5ai indexer
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=0
ExecStartPre=-/usr/bin/docker pull vsense/h5ai
ExecStart=/usr/bin/docker run --rm --name h5ai --hostname h5ai -v /srv/seedbox:/var/www vsense/h5ai
ExecStop=/usr/bin/docker stop h5ai
ExecReload=/usr/bin/docker restart h5ai

[Install]
WantedBy=multi-user.target
```
