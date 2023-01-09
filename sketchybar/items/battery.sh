#!/usr/bin/env sh

sketchybar --add item battery right                   \
           --set battery update_freq=120              \
                      background.padding_left=5  \
                      icon.font="$ICON_FONT:Regular:12.0"  \
                      icon=                   \
                      icon.color=$YELLOW             \
                      script="$PLUGIN_DIR/battery.sh" \
                      label=! \
