#!/bin/bash

# colors
RED=`tput setaf 1 -T xterm`
GREEN=`tput setaf 2 -T xterm`
YELLOW=`tput setaf 3 -T xterm`
CYAN=`tput setaf 6 -T xterm`
BLUE=`tput setaf 4 -T xterm`
MAGENTA=`tput setaf 5 -T xterm`
RESET=`tput sgr0 -T xterm && tput setaf 7 -T xterm`
BOLD=`tput bold -T xterm`

# set gpio default pin levels if global activated
if [ ! -z $ENABLE_GPIO ]; then
    if [ $ENABLE_GPIO -eq 1 ]; then
        sudo /usr/bin/gpio -g mode $DEV_PIN up
        sudo /usr/bin/gpio -g mode $INVERT_PIN up
        sudo /usr/bin/gpio -g mode $X11_PIN up
    else
        # make sure flag is correctly set if
        # ENABLE_GPIO is not set to 1 or missing
        # to prevent from errors
        ENABLE_GPIO=0
    fi
fi

# callable functions
show_clear_screen() {
    plymouth --hide-splash > /dev/null 2>&1 # hide the boot splash
    chvt 3
    printf "\033[2J" > /dev/tty3 # clear screen
    printf "\033[0;0H\n" > /dev/tty3 # Move to 0,0
}

show_screen() {
    plymouth --hide-splash > /dev/null 2>&1 # hide the boot splash
    chvt 3
}

show_cursor() {
    setterm -cursor on > /dev/tty3
    setterm -blink on > /dev/tty3
}

hide_cursor() {
    setterm -cursor off > /dev/tty3
    setterm -blink off > /dev/tty3
}
