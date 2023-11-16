#!/bin/sh
xrandr \
	--output HDMI-A-0 --mode 3840x2160 --pos 3840x0 --rotate normal \
	--output HDMI-A-1 --primary --mode 3840x2160 --pos 0x0 --rotate normal \
	--output DisplayPort-0 --off \
	--output DisplayPort-1 --off