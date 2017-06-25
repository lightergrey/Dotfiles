# dotfiles

## Setup:

* Install [pure-prompt](https://github.com/sindresorhus/pure#npm)
* Symlink `.zshrc`: `ln -s ~/Development/dotfiles/zshrc ~/.zshrc`
* Symlink `.zprofile`: `ln -s ~/Development/dotfiles/zprofile ~/.zprofile`
* Install python3 and neovim
  * `brew install neovim`
  * `brew install python3`
  * `pip3 install --user neovim`
* Symlink `init.vim`: `ln -s ~/development/dotfiles/init.vim ~/.config/nvim/init.vim`
* Install [vim-plug](https://github.com/junegunn/vim-plug#installation)
* Install plugins in Vim: `:PlugInstall`
* Install tern: `npm install -g tern`
