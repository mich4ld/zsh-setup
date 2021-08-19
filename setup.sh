#!/bin/sh

FONTS_DIR=~/.local/share/fonts/
FONTS_ZIP=~/fonts.zip

function install_fonts() {
    echo "===> Installing fonts..."
    curl -o $FONTS_ZIP 'https://raw.githubusercontent.com/mich4ld/zsh-setup/main/fonts.zip'
    mkdir -p $FONTS_DIR
    unzip $FONTS_ZIP -d $FONTS_DIR
    echo "===> Clearing archive..."
    rm $FONTS_ZIP
}

function ask_fonts_install() {
    echo "===> Install fonts? (Y/n)"
    read INSTALL_ANSWER < /dev/tty

    if [[ $INSTALL_ANSWER = y || $INSTALL_ANSWER = Y ]]; then
        install_fonts
    fi
}

if [ "$1" = '--no-fonts' ]; then
    echo "===> --no-fonts option detected"
elif [ "$1" = '--install-fonts' ]; then
    echo "===> --install-fonts option detected"
    install_fonts
else
    ask_fonts_install
fi


echo "===> Installing oh my zsh..."
RUNZSH=no sh -c "$(curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "===> Installing some zsh plugins..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/agkozak/zsh-z  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z

echo "===> Installing powerlevel10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "===> Changing zsh theme to powerlevel10k..."
sed -i 's%ZSH_THEME="robbyrussell"%ZSH_THEME="powerlevel10k/powerlevel10k"%g' ~/.zshrc

echo "===> Enabling zsh plugins..."
sed -i 's/plugins=(git)/plugins=(git history-substring-search colored-man-pages zsh-autosuggestions zsh-syntax-highlighting zsh-z)/g' ~/.zshrc

echo "===> Setting zsh as your default shell..."
chsh -s $(which zsh) < /dev/tty

echo "===> Zsh plugins and theme installed"
echo "Open new terminal or reboot OS and type zsh to see fonts and icons"
