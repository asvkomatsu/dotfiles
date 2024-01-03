#!/bin/sh

{%@@ if profile == "loki" @@%}
xrandr \
	--output HDMI-A-1 --primary --mode 3840x2160 --pos 0x0 --rotate normal \
	--output HDMI-A-0 --mode 3840x2160 --pos 3840x0 --rotate normal \
	--output DisplayPort-0 --off \
	--output DisplayPort-1 --off
{%@@ elif profile == "ananta" @@%}
xrandr \
	--output HDMI-0 --primary --mode 3840x2160 --pos 0x0 --rotate normal \
	--output DP-4 --mode 3840x2160 --pos 3840x0 --rotate normal \
	--output DP-0 --off \
	--output DP-1 --off \
	--output DP-2 --off \
	--output DP-3 --off \
	--output DP-5 --off
{%@@ elif profile == "DTI-12052" @@%}
xrandr \
	--output DP-1 --off \
	--output HDMI-1 --primary --mode 1920x1080 --pos 0x310 --rotate normal \
	--output DP-2 --off \
	--output HDMI-2 --mode 1920x1080 --pos 1920x0 --rotate left \
	--output DP-3 --off \
	--output HDMI-3 --off
{%@@ endif @@%}
