# dotfiles

Config files, primarily for customising my shell and Vim.

## Installation

```bash
    $ git clone --recursive git@github.com:tjvc/dotfiles.git ~/dotfiles
    $ bash ~/dotfiles/setup.sh
```

## macOS development environment

### Homebrew

```bash
    $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    $ brew install coreutils ctags fd git neovim par the_silver_searcher tmux vim
```

### Vim plugins

#### Vim

```bash
    $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    $ vim +PlugInstall +qall
```

#### Neovim

```bash
    $ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    $ nvim +PlugInstall +qall
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
