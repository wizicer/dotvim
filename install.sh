#!/bin/bash

ln -s .vim/vimrc ../.vimrc

git submodule update --init --recursive
