#!/bin/bash

cd ..
ln -s .vim/vimrc .vimrc

git submodule update --init --recursive
