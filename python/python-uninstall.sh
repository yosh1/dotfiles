#!/bin/bash

# /Library/Frameworks/Python.framework 削除
sudo rm -rf  /Library/Frameworks/Python.framework
sudo rm ~/.bash_profile.pysave

sudo rm -rf /usr/local/bin/.pyenv/

sudo find /usr/local/bin | grep pyenv | xargs rm
sudo find /usr/local/bin | grep virtual | xargs rm

sudo brew uninstall pyenv
sudo brew uninstall pyenv-virtualenv