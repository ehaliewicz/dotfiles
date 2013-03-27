#!/bin/sh
echo $WINDOW >~/.emacsclient-caller
emacsclient -n "$@"
