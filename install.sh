#!/bin/bash

ln -s .vim/_vimrc ../.vimrc

git submodule update --init --recursive
