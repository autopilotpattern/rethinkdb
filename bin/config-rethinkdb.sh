#!/bin/bash

# Render rethinkdb configuration template using values from Consul,
# but do not reload because rethinkdb has't started yet.
preStart() {
    consul-template \
        -once \
        -consul-addr ${CONSUL}:8500 \
        -template "/etc/rethinkdb.conf.ctmpl:/etc/rethinkdb.conf"
}

# Render rethinkdb configuration template using values from Consul,
# then gracefully restart rethinkdb
onChange() {
    consul-template \
        -once \
        -consul-addr ${CONSUL}:8500 \
        -template "/etc/rethinkdb.conf.ctmpl:/etc/rethinkdb.conf:pkill -SIGHUP rethinkdb"
}

until
    cmd=$1
    if [ -z "$cmd" ]; then
        onChange
    fi
    shift 1
    $cmd "$@"
    [ "$?" -ne 127 ]
do
    onChange
    exit
done
