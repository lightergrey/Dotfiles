# dotfiles

## Setup:

* Install [pure-prompt](https://github.com/sindresorhus/pure#npm) via `npm` or manally
* Clone [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) to `~/.zsh`
* Clone [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) to `~/.zsh`
* Symlink `.zshrc`: `ln -s ~/development/dotfiles/zshrc ~/.zshrc`
* Symlink `fzf-git.zsh`: `ln -s ~/development/dotfiles/fzf-git.zsh ~/.zsh/fzf-git.zsh`
* Symlink `.tmux.conf`: `ln -s ~/development/dotfiles/tmux.conf ~/.tmux.conf`
* Symlink `vimrc`: `ln -s ~/development/dotfiles/vimrc ~/.vimrc`
* Install [vim-plug](https://github.com/junegunn/vim-plug#installation)
* Install plugins in Vim: `:PlugInstall`
* Install ripgrep:
    * `sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo`
    * `sudo yum install ripgrep`


## Setup Vim with Python 3
* `cd ~`
* `mkdir opt`
* Clone vim into `~`: `git clone https://github.com/vim/vim.git`
* `cd vim`
* Had to install ncurses: `sudo yum install ncurses-devel`
* `/configure --enable-pythoninterp=yes --with-python-config-dir=/usr/lib64/python2.7/config --enable-python3interp=dynamic --prefix=$HOME/opt`
* `make`
* `make install`
* add `~/opt/bin` to path of zshrc
