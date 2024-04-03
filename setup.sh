#Add user to Sudoers list
su root
echo "$USER ALL=(ALL) ALL" >> /etc/sudoers

# Update apt
sudo apt update

# Confirm that universe repository is enabled in your system
sudo add-apt-repository universe

# Install Gnome Tweak Tool
echo Installing Gnome Twaek Tool
sudo apt install gnome-tweak-tool

# Install Google Chrome
echo Install Google Chrome
sudo apt-get install libxss1 libappindicator1 libappindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome*.deb

# Install VS Code
echo Installing VS Code
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https -y
sudo apt install code