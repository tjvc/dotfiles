# dotfiles

Some config files, primarily for customising my Bash environment and Vim. They're for use on development machines, and intended to be portable between OS X and Ubuntu.

## Installation

```bash
    $ git clone --recursive git@github.com:tjvc/dotfiles.git ~/dotfiles
    $ bash ~/dotfiles/setup.sh
```

## OS X development environment

### Homebrew

```bash
    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    $ brew install coreutils node the_silver_searcher tmux
```

### Vim

Install Vim plugins:

```bash
    $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    $ vim +PluginInstall +qall
```

### Ruby

Install the latest stable Ruby with rbenv:

```bash
    $ brew install rbenv ruby-build
    $ rbenv install $(rbenv install -l | grep -v - | tail -1)
```

#### Gems

```bash
    $ gem install bundler rubocop tmuxinator
```

### Other dependencies

```bash
    $ sudo npm install -g jshint
```

## TODO

* Collate the above steps in an install script
* Create a minimal subset of these files for use on servers
