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
    $ echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/thom/.zprofile
    $ eval "$(/opt/homebrew/bin/brew shellenv)"
    $ brew bundle
```

### Fish

```bash
    $ fish setup.fish
    $ sudo sh -c "echo '/opt/homebrew/bin/fish' >> /etc/shells"
    $ chsh -s $(which fish)
```

### Neovim

```bash
    $ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    $ python3 -m pip install --user --upgrade pynvim
    $ nvim +PlugInstall +qall
```

### Ruby

Install the latest stable Ruby with rbenv:

```bash
    $ brew install rbenv ruby-build
    $ rbenv install (rbenv install -l | grep -v - | tail -1)
```

#### Gems

```bash
    $ gem install bundler standard
```
