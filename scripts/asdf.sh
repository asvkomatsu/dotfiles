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