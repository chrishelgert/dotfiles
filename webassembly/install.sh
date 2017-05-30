#!/bin/bash

# Emscripten via emsdk
curl https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz | tar -xv -C ~/code

~/code/emsdk-portable/emsdk update
~/code/emsdk-portable/emsdk install sdk-incoming-64bit
~/code/emsdk-portable/emsdk activate sdk-incoming-64bit
