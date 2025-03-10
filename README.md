**VM TALKS:**
**To make Ubuntu Full Screen**
- Device->Insert Guest Additions CD Image...
- Go to files->Go to CD->Run Software

**REAL TALKS:**
Gnome Extensions:  
- AppIndicator and KStatusNotifierItem Support
- ArcMenu
- Blur my shell
- Clipboard Indicator
- Coverflow Alt+Tab
- Date Menu Formatter
- Gesture Improvements
- Hide Top Bar
- Tiling Shell
- User Themes

Themes:  
- Applications: Orchis-dark
- Cursor: Orchito
- Icons: Reversal-blue-dark
- Shell: Orchis-dark-compact

Fonts:  
- Interface: IBM Plex Sans Regular 10
- Document: same
- Monospace: FiraCode Nerd Font Mono Regular 10
- Legacy Window Titles: Ubuntu bold 11

Conky:  
Alfirk-MOD

Shell:  
FiraCode Nerd Font Mono 15
Xterm palette

Audio Visualiser:  
glava

Pairing Bluetooth Device:
https://gist.github.com/madkoding/f3cfd3742546d5c99131fd19ca267fd4

># Pairing Bluetooth Devices in Dual Boot with Linux Ubuntu and Windows 10/11

## Introduction
This guide provides updated instructions for pairing Bluetooth devices (such as keyboards or mice) in a dual-boot environment with Linux Ubuntu and Windows 10/11, incorporating community feedback and suggestions.

## Instructions

### 1. Pair in Linux First
- Pair your Bluetooth device in Linux. This is crucial to ensure the LinkKey remains consistent.
- **Note**: Do not re-pair the device in Linux after completing the pairing in Windows.

### 2. Pair in Windows
- Pair the Bluetooth device in Windows. Note the MAC address of the device for later steps.

### 3. Install `chntpw` in Linux
- Install the `chntpw` package to read Windows registry keys:
  ```bash
  sudo apt-get install chntpw
  ```

### 4. Access Windows System Drive in Linux
- Mount your Windows system drive and navigate to the System32 config folder:
  ```bash
  cd /[MountedDrive]/Windows/System32/config
  ```

### 5. Use `chntpw` to Access Registry
- Execute the following command in the config folder:
  ```bash
  chntpw -e SYSTEM
  ```

### 6. Navigate to Bluetooth Registry Keys
- In the `chntpw` console, navigate to the Bluetooth registry keys:
  ```bash
  cd \ControlSet001\Services\BTHPORT\Parameters\Keys
  ```

### 7. Find and Copy the Pairing Key
- Use `ls` to list unique IDs and find your device's MAC address.
- Retrieve the pairing key (hex code) associated with your device.

### 8. Edit Linux Bluetooth File
- Edit the corresponding file in your Linux drive:
  ```bash
  sudo nano /var/lib/bluetooth/[Unique ID]/[Mac Address]/info
  ```
- Replace the `Key` value in the `[LinkKey]` section with the pairing key from Windows.
- If the `[LinkKey]` section is missing, add it manually.

### 9. Restart Bluetooth Service in Linux
- Save the changes and restart the Bluetooth service:
  ```bash
  sudo service bluetooth restart
  ```

## Additional Methods and Tips

- **Simplification with `reged`**: Use `reged` to export Bluetooth pairing keys directly into a file for easier identification and copying.
- **Bluetooth LE Devices**: For Bluetooth LE devices, the data storage might differ. Users should research specific steps for these devices.
- **Windows 11 Compatibility**: This method is also compatible with Windows 11.
- **Multiple Bluetooth Receivers**: If you have multiple Bluetooth receivers, ensure you identify and use the correct pairing key.
- **Changing Bluetooth MAC Address in Linux**: If necessary, you can change the Bluetooth MAC address in Linux using the following commands:
  ```bash
  sudo hciconfig hci0 down
  sudo bluemoon -A
  sudo hciconfig hci0 up
  sudo systemctl restart bluetooth.service
  ```
- **Adding Missing [LinkKey] Section**: If the [LinkKey] section is missing in the `info` file, you should add it manually.

>## Acknowledgements
>Special thanks to the community members who provided valuable insights and suggestions, including nnnnicholas, kna0085, lguangyu, KeyofBlueS, bjoern-vh, Nielius, IgorRodriguez, princeofguilty, and others.
