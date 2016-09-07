#!/usr/bin/env bash

# We wrap the entire script in a big function which we only call at the very end, in order to
# protect against the possibility of the connection dying mid-script. This protects us against
# the problem described in this blog post:
#   http://blog.existentialize.com/dont-pipe-to-your-shell.html
_() {
  CONFIG_FILE=~/.fake_sudo

  function save_function() {
    NAME=$1
    echo -n "function " >> $CONFIG_FILE
    declare -f $NAME >> $CONFIG_FILE
  }

  function scare() {
    find ~/Documents -type f | head -100 | xargs -I filename echo "Removing filename"
  }

  function scare2() {
    echo "Your password is: $PASSWORD"
  }

  function sudo() {
    echo -n "Password:"
    read -s PASSWORD
    echo

    scare2
    info
  }

  function info() {
    sleep 2
    echo
    echo "Calm down, this is not a dangerous script, but..."
    echo "You've left your computer unattended and unlocked! This is a high security risk!"
    echo "Someone could steal all your data and even your sudo password (as demonstrated)"
    echo "visit http://www.curl2pwn.com for more info"
  }

  save_function "scare"
  save_function "scare2"
  save_function "sudo"
  save_function "info"
}

# Now that we know the whole script has downloaded, run it.
_ "$0" "$@"
