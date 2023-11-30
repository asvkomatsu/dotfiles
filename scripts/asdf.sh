sudo apt update
sudo apt install \
	build-essential libssl-dev zlib1g-dev \
	libbz2-dev libreadline-dev libsqlite3-dev curl \
	libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev


# Setup asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1

# nodejs
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

# java
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf install java oracle-graalvm-21.0.1
asdf global java oracle-graalvm-21.0.1

# python
asdf plugin-add python
asdf install python 3.12.0
asdf global python 3.12.0

# golang
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf install golang 1.21.4
asdf global golang 1.21.4

# neovim
asdf plugin add neovim
asdf install neovim stable
asdf global neovim stable

# rust
asdf plugin-add rust https://github.com/asdf-community/asdf-rust.git
asdf install rust 1.74.0
asdf global rust 1.74.0

# odin
asdf plugin add odin
asdf install odin dev-2023-11
asdf global odin dev-2023-11
