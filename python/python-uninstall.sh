#!/bin/bash

# /Library/Frameworks/Python.framework 削除
sudo rm -rf  /Library/Frameworks/Python.framework
sudo rm ~/.bash_profile.pysave

sudo rm -rf /usr/local/bin/.pyenv/

find /usr/local/bin | grep pyenv | xargs rm
find /usr/local/bin | grep virtual | xargs rm

brew uninstall pyenv
brew uninstall pyenv-virtualenv