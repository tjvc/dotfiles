# dotfiles

Some config files, primarily for customising my shell and Vim. They're for use on development machines, and intended to be portable between macOS and Ubuntu.

## Installation

```bash
    $ git clone --recursive git@github.com:tjvc/dotfiles.git ~/dotfiles
    $ bash ~/dotfiles/setup.sh
```

## macOS development environment

### Homebrew

```bash
    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    $ brew install coreutils ctags fd git neovim node par the_silver_searcher tmux vim
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
    $ gem install bundler rubocop
```

### Fish

```bash
    $ brew install fish
    $ fish setup.fish
    $ chsh -s $(which fish)
```
