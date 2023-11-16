sudo apt-get update
sudo apt-get install \
	alacritty \
	blueman \
	dunst \
	feh \
	maim \
	pipx \
	playerctl \
	udiskie

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
