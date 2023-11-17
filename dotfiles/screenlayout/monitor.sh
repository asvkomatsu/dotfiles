#!/bin/sh

{%@@ if profile == "loki" @@%}
xrandr \
	--output HDMI-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
	--output HDMI-2 --mode 1920x1080 --pos 1920x0 --rotate left \
	--output DP-1 --off \
	--output DP-2 --off \
	--output DP-3 --off \
	--output HDMI-3 --off
{%@@ elif profile == "DTI-12052" @@%}
xrandr \
	--output DP-1 --off \
	--output HDMI-1 --primary --mode 1920x1080 --pos 0x310 --rotate normal \
	--output DP-2 --off \
	--output HDMI-2 --mode 1920x1080 --pos 1920x0 --rotate left \
	--output DP-3 --off \
	--output HDMI-3 --off
{%@@ endif @@%}
