#!/bin/ash
MOSQUITTO_ARGS=""

for i in "$@" ; do
case $i in
    --mqtt=*)
    MOSQUITTO_ARGS="${i#*=}"
    ;;
    *)
            # unknown option
    ;;
esac
done

run(){
    while true; do
        rtl_433 -C customary -M utc -F ${MOSQUITTO_ARGS}
        sleep 5
    done
}

run & wait $! # handle sigterm
