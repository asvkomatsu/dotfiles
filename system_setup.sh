#!/usr/bin/env sh

# sublime text repository
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# install packages
sudo apt-get update
sudo apt-get install \
	apt-transport-https \
	aptitude \
	alacritty \
	blueman \
	dotdrop \
	dunst \
	feh \
	git \
	htop \
	libgdk-pixbuf-2.0-0 \
	maim \
	nala \
	pipx \
	playerctl \
	python3-dbus-next \
	remmina \
	rofi \
	sublime-text \
	tree \
	udiskie \
	vim

# Setup rofi-power-menu
mkdir -p ~/.local/bin
cp rofi-power-menu ~/.local/bin/rofi-power-menu
chmod +x ~/.local/bin/rofi-power-menu

# Setup qtile
pipx install qtile
sudo cp qtile.desktop /usr/share/xsessions/qtile.desktop
sudo echo "Exec=/home/$USER/.local/bin/qtile start" | sudo tee -a /usr/share/xsessions/qtile.desktop
cp -R ~/.local/pipx/shared/lib/python3.11/site-packages/dbus_next* ~/.local/pipx/venvs/qtile/lib/python3.11/site-packages/

# Install JetBrains Mono Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.tar.xz -P /tmp/
cd /tmp
tar -xf /tmp/JetBrainsMono.tar.xz 
mkdir -p ~/.local/share/fonts/jetbrains-mono-nerd/
mv /tmp/*.ttf ~/.local/share/fonts/jetbrains-mono-nerd/
sudo fc-cache -f -v

# Setup lazygit
LAZYGIT_VERSION=0.40.2
wget https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz -P /tmp/
cd /tmp
tar -xf lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz
mv lazygit ~/.local/bin/
