#!/bin/sh

pushd ~
mkdir .vim
popd

cp vimrc tmux.conf ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/tmux.conf ~/.tmux.conf

# Install zsh wget git curl vim package
echo "Install zsh wget git curl vim fontconfig global package"
sudo apt-get install zsh wget git curl vim fontconfig global -y

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install fonts for powerlevel10k : https://linoxide.com/install-fonts-on-ubuntu/
mkdir -p ~/.local/share/fonts

wget https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Regular.ttf -P ~/.local/share/fonts/
wget https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Bold.ttf -P ~/.local/share/fonts/
wget https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Italic.ttf -P ~/.local/share/fonts/
wget https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Bold%20Italic.ttf -P ~/.local/share/fonts/

fc-cache -f -v

# Install oh my zsh : https://www.kwchang0831.dev/dev-env/ubuntu/oh-my-zsh
echo "Install oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install powerlevel10k, zsh-autosuggestions and zsh-syntax-highlighting
echo "Install powerlevel10k, zsh-autosuggestions and zsh-syntax-highlighting"

git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Switch to zsh
echo "\n\n Set zsh as default shell and switch to zsh"
echo "Don't forget to configure powerlevel10k theme by typing \"p10k configure\" \n"

pushd ~

# Set up zsh theme to powerlevel10k and plugins
sed -i 's/ZSH_THEME=.*/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/g' .zshrc
sed -i 's/plugins=.*/plugins=\(git zsh-autosuggestions zsh-syntax-highlighting\)/g' .zshrc

# Set up zsh bindkey for zsh-autosuggestions
sed -i '/# User configuration/a \
\
# bindkey Alt + -> & Alt + <- for zsh-autosuggestions \
bindkey \"^[[1;3C\" forward-word \
bindkey \"^[[1;3D\" backward-word' .zshrc

popd

chsh -s $(which zsh)
zsh
