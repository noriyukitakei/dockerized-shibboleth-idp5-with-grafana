#!/bin/bash

if [ -e /tmp/certs/server.crt -a -e /tmp/certs/server.key ]; then
  # certsディレクトリに証明書が置いてあったらそちらを優先して配置する。
  mv -f /tmp/certs/server.crt /etc/pki/tls/certs/localhost.crt
  mv -f /tmp/certs/server.key /etc/pki/tls/private/localhost.key
fi

# httpsの待受ポートを10443に変更する。
sed -i -e 's/Listen 443 https/Listen 10443 https/g' /etc/httpd/conf.d/ssl.conf 
sed -i -e 's/<VirtualHost _default_:443>/<VirtualHost _default_:10443>/g' /etc/httpd/conf.d/ssl.conf
