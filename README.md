# dotfiles

Some config files, for customising my Bash environment and a few other things.

## Installation

```bash
    $ git clone git@github.com:tjvc/dotfiles.git
    $ bash ~/dotfiles/make-links.sh
```

Currently `make-links.sh` only symlinks files common to all environments. Files specific to particular environments (`.profile` on OS X, `.gitconfig` for home and work) must be linked manually.

### Vim

Install Vundle:

```bash
    $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Then launch Vim and run `:PluginInstall`.

#### vim-livedown

This requires Livedown (<https://github.com/shime/livedown>). To install, first install Node.js, then:

```bash
    $ sudo npm install -g livedown
```
