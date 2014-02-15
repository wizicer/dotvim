rem @echo off
start /min /wait gvim -s script.in -n vimrc
pandoc -s vimrc.md -c markdown.css -o vimrc.html --toc
