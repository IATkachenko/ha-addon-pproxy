#!/usr/bin/with-contenv bashio
CONFIG_PATH=/data/options.json

scheme="$(bashio::config 'proxy_scheme')"
host="$(bashio::config 'proxy_host')"
port="$(bashio::config 'proxy_port')"
user="$(bashio::config 'proxy_user')"
password="$(bashio::config 'proxy_password')"
auth=""
[ -n "$user" ] && auth="${user}"
[ -n "$password" -a -n "$user" ] && auth="${auth}:${password}"
[ -n "$auth" ] && auth="${auth}@"

python3 -m pproxy -l http://:80 -vv -r "${scheme}://${auth}${host}:${port}"
