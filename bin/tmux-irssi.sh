#!/bin/bash
tmux new-session -d -s irssi -n irssi irssi
tmux -2 attach-session -d
