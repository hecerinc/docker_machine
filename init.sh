#!/bin/bash
# Install node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
. $HOME/.nvm/nvm.sh
# nvm install 'lts/*'
nvm install '18'
npm i -g yarn

git clone https://github.com/hecerinc/dotfiles.git
bash $HOME/dotfiles/install.sh
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# curl -fLo ~/.vimrc https://gist.githubusercontent.com/hecerinc/883c894c6cddd6af224d14376d341ce8/raw/9eff85ff1a441d5970399307591c82d653b711de/.vimrc
vim +'PlugInstall --sync' +qa


# Add NVM to .zshrc
echo 'export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
' >> ~/.zshrc

mkdir -p $HOME/.local/bin
echo 'export PATH=/home/hector/.local/bin:$PATH' >> ~/.zshrc

# Install neovim
mkdir -p $HOME/.downloads
cd $HOME/.downloads
sudo rm -rf /opt/nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar -xvzf nvim-linux64.tar.gz
ln -s $HOME/.downloads/nvim-linux64/bin/nvim $HOME/.local/bin/nvim

mkdir -p $HOME/.config/nvim
cp $HOME/dotfiles/nvim/* $HOME/.config/nvim/
DEST=$HOME/.config/nvim
ln -s $HOME/.vim/autoload $DEST/autoload
ln -s $HOME/.vim/plugged $DEST/plugged
