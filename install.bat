@echo off

:link_file
    cd ..
    if exist _vimrc del _vimrc
    mklink _vimrc .vim\_vimrc /h
    if exist _vsvimrc del _vsvimrc
    mklink _vsvimrc .vim\_vsvimrc /h

:update_submodule
    cd .vim
    git submodule update --init --recursive
:end
