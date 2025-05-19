# Update to Nvim v0.11.1

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
echo -e "\n\nexport PATH=\$PATH:/opt/nvim-linux-x86_64/bin" | tee -a ~/.bashrc
