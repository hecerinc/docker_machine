#!/bin/bash
# Install node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
. $HOME/.nvm/nvm.sh
nvm install '20'
npm i -g npm
npm i -g yarn

git clone https://github.com/hecerinc/dotfiles.git
bash $HOME/dotfiles/install.sh
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
NVIM_DEST='nvim-linux-x86_64'
curl -LO "https://github.com/neovim/neovim/releases/latest/download/$NVIM_DEST.tar.gz"

tar -xvzf "$NVIM_DEST.tar.gz"
ln -s "$HOME/.downloads/$NVIM_DEST/bin/nvim" $HOME/.local/bin/nvim

mkdir -p $HOME/.config/nvim
cp $HOME/dotfiles/nvim/* $HOME/.config/nvim/
DEST=$HOME/.config/nvim
ln -s $HOME/.vim/autoload $DEST/autoload
ln -s $HOME/.vim/plugged $DEST/plugged

# Use a local file to store git credentials so we don't have to repeatedly paste them
git config --global credential.helper store
