#!/bin/bash
set -e

mkdir -p /SHARE/video_archive /opt/ivideon/videoserverd

[ ! -f /SHARE/config.xml ]          && cp /DEFAULT/config.xml          /SHARE/config.xml
ln -s /SHARE/config.xml            /opt/ivideon/videoserverd/config.xml

[ ! -f /SHARE/videoserverd.config ] && cp /DEFAULT/videoserverd.config /SHARE/videoserverd.config
ln -s /SHARE/videoserverd.config   /opt/ivideon/ivideon-server/videoserverd.config

[ ! -f /SHARE/schedule.json ]       && cp /DEFAULT/schedule.json       /SHARE/schedule.json
ln -s /SHARE/schedule.json         /opt/ivideon/ivideon-server/schedule.json

touch /opt/ivideon/ivideon-server/service.log
/etc/init.d/videoserver start

tail -f /opt/ivideon/ivideon-server/service.log

