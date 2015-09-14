#!/bin/sh

# if command starts with an option, prepend dnsmasq
if [ "${1:0:1}" = '-' ]; then
    set -- dnsmasq "$@"
fi

# if command is dnsmasq, set a watch on /etc/hosts file
if [ "$1" = 'dnsmasq' ]; then
    (
        while inotifywait -e MODIFY /etc/hosts; do
            pkill -HUP dnsmasq
        done
    ) &
fi

exec "$@"
