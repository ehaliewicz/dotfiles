#!/bin/bash

if [ $1 ] 
then
    xmacroplay "$DIPLAY" < $1
else
echo "Usage: mac.sh [path to xmacro file]"
fi
