# Setup lazygit
LAZYGIT_VERSION=0.40.2
wget https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz -P /tmp/
cd /tmp
tar -xf lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz
mv lazygit ~/.local/bin/

