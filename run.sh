#!/usr/bin/env sh

nix build
Xephyr -ac -br -noreset -screen 800x600 :3 &
sleep 1
DISPLAY=:3.0 ./result/bin/nwm &
sleep 1
DISPLAY=:3.0 xterm &
