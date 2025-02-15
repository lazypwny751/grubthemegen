#!/bin/sh

set -e

ruby "theme-test.rb" > theme.txt

grub2-theme-preview .
