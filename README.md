Vim Configuration
=================

Install like this in Windows:

    $ git clone https://github.com/wizicer/dotvim.git %USERPROFILE%\vimfiles
    $ cd %USERPROFILE%\vimfiles
    $ install.bat

Configuration Markdown
======================

To outline the vimrc file, I have a `make` file to generate markdown file from vimrc.

You can open it to see the comments: [vimrc.md](vimrc.md)

FAQ
===

Q: error message like below during startup.

```
Warning in snipMate.vim: Snippet c) is already defined. See :h multi_snip for help on snippets with multiple matches.
Warning in snipMate.vim: Snippet date is already defined. See :h multi_snip for help on snippets with multiple matches.
Warning in snipMate.vim: Snippet ddate is already defined. See :h multi_snip for help on snippets with multiple matches.
```

A: remove `~/.vim/plugged/snipmate.vim/snippets/` folder due to conflicts with other snippets.

References
==========

1. <https://github.com/gma/dotvim>
2. <http://effectif.com/vim/host-specific-vim-config>
