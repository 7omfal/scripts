#!/bin/bash
# Focus an existing terminal window
WINDOW_ID=$(xdotool search --name "Terminal631")

if [ -n "$WINDOW_ID" ]; then
	xdotool windowactivate "$WINDOW_ID"
	xdotool windowraise "$WINDOW_ID"
else
	gnome-terminal -t "Terminal631"
fi


