#!/bin/bash

# cd ..
# rem for /f %%i in ('dir vimfiles\vimrc* /b') do mklink _%%i vimfiles\%%i /h
# if exist _vimrc del _vimrc
# mklink _vimrc vimfiles\vimrc /h
# if exist _vsvimrc del _vsvimrc
# mklink _vsvimrc vimfiles\_vsvimrc /h

git submodule update --init --recursive
