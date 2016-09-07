#!/usr/bin/env bash
rm -f ~/.fake_sudo && ./main.sh && source ~/.fake_sudo && sudo
