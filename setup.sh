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
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code
