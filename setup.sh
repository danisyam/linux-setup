#!/usr/bin/zsh

# Remove Libre Office
if [ "$(dpkg -l | grep libreoffice)" != "" ]; then
    echo "Y\nY\nY" | sudo apt-get remove --purge "libreoffice*"
    sudo apt-get clean
    sudo apt-get autoremove
    echo "Berhasil Menghapus libre office"
else
    echo "Libre Office Sudah Terhapus"
fi

# Remove Firefox
if [ "$(dpkg -l | grep firefox)" != "" ]; then
    echo "Y\nY\nY" | sudo apt-get remove --purge "firefox*"
    sudo apt-get clean
    sudo apt-get autoremove
    echo "Berhasil Menghapus Firefox"
else
    echo "Firefox Sudah Terhapus"
fi

# Install Font
if [ ! -d "$HOME/.local/share/fonts/JetBrainsMono" ]; then
    mkdir -p $HOME/.local/share/fonts
    cp ./JetBrainsMono $HOME/.local/share/fonts
    echo "Berhasil Mengcopy Fonts"
else
    echo "Fonts Sudah Dicopy"
fi

# Copy zshrc
if [ ! -f "$HOME/.zshrc" ]; then
    cp ./.zshrc $Home/
    echo "\033[32mBerhasil Mengcopy .zshrc\033[0m"
else
    echo "\033[32m.zshrc Sudah Dicopy\033[0m"
fi

# Install zsh
if [ "$(dpkg -l | grep zsh)" = "" ]; then
    sudo apt install zsh
    echo "Berhasil Mengistall zsh"
else
    echo "zsh Sudah di Install"
fi

# install Alacritty
if [ "$(dpkg -l | grep alacritty)" = "" ]; then
    sudo apt install alacritty
    echo "Berhasil Mengistall Alacritty"
else
    echo "Alacritty Sudah di Install"
fi

# Setup alacritty config
if [ ! -d "$HOME/.config/alacritty" ]; then
    echo "Membuat Config Alacritty..."
    mkdir -p $HOME/.config/alacritty
    cp ./alacritty/alacritty.yml $HOME/.config/alacritty/
    echo "Berhasil Membuat Config Alacritty"
else
    echo "Config Alacritty Sudah Dibuat"
fi

if [ -f /etc/default/grub ]; then
    sudo rm -rf /etc/default/grub
    sudo cp ./grub /etc/default/
    sudo update-grub
    sudo reboot
fi