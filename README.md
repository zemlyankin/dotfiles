# Initial setup
Clone repository: `git clone https://github.com/zemlyankin/dotfiles.git ~/.dotfiles`
# tmux setup
1. Install TPM: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
2. Make a link to .tmux.conf: `ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf`
3. Press `Ctrl-A Shift-I` to install plugins
# vim setup
1. Install plug-vim:
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
2. Make a link to .vimrc: `ln -sf ~/.dotfiles/vimrc ~/.vimrc`
3. Run vim and run `:PlugInstall` to install all plugins
