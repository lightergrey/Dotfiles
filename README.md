# dotfiles

## Submodules
- [fzf](https://github.com/junegunn/fzf)
- [fzf-tab](https://github.com/Aloxaf/fzf-tab)
- [pure](https://github.com/sindresorhus/pure)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

## Setup:

- clone this repo `git clone https://github.com/lightergrey/Dotfiles.git ~/development/`
- run `git submodule init` and `git submodule update`
- Symlink `.profile`: `ln -s ~/development/Dotfiles/profile ~/.profile`
- Symlink `.zshrc`: `ln -s ~/development/Dotfiles/zshrc ~/.zshrc`
- Install fzf `~/development/Dotfiles/submodules/fzf/install`
