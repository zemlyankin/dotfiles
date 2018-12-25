# Initial setup
Clone repository: `git clone https://github.com/zemlyankin/dotfiles.git ~/.dotfiles`

# zsh setup
1. Install Oh My Zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
2. Clone custom plugins
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
3. Create a link ~/.zshrc: `ln -sf ~/.dotfiles/zshrc ~/.zshrc`

# tmux setup
1. Install TPM: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
2. Create a link ~/.tmux.conf: `ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf`
3. Press `Ctrl-A Shift-I` to install plugins

# vim setup
1. Install plug-vim:
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
2. Make a link to .vimrc: `ln -sf ~/.dotfiles/vimrc ~/.vimrc`
3. Run vim and run `:PlugInstall` to install all plugins

