#!/bin/bash

# kill all detached sessions of Screen
killd () {
    for session in $(screen -ls | grep -oP '\d{3,10}');do
        screen -S "${session}" -X quit;
    done
}