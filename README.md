# dotfiles

## Setup:

* Install [pure-prompt](https://github.com/sindresorhus/pure#npm)
* Symlink `.zshrc`: `ln -s ~/Development/Dotfiles/zshrc ~/.zshrc`
* Symlink `.zprofile`: `ln -s ~/Development/Dotfiles/zprofile ~/.zprofile`
* Install python3 and neovim
  * `brew install neovim`
  * `brew install python3`
  * `pip3 install --user neovim`
* Symlink `init.vim`: `ln -s ~/Development/Dotfiles/init.vim ~/.config/nvim/init.vim`
* Install [vim-plug](https://github.com/junegunn/vim-plug#installation)
* Install plugins in Vim: `:PlugInstall`
* Install tern: `npm install -g tern`
