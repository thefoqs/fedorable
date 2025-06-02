# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root (use sudo)"
   exit 1
fi

echo "Installing Proton VPN GTK App"

# Step 1: Download Proton VPN rpm package
wget "https://repo.protonvpn.com/fedora-$(cat /etc/fedora-release | cut -d' ' -f 3)-stable/protonvpn-stable-release/protonvpn-stable-release-1.0.3-1.noarch.rpm"

# Step 2: Enable Proton VPN repository
sudo dnf install -y ./protonvpn-stable-release-1.0.3-1.noarch.rpm && sudo dnf check-update --refresh "" --unattended

# Step 3: Install proton-vpn-gtk-app
sudo dnf install -y proton-vpn-gnome-desktop "" --unattended

# Step 4: Remove downloaded rpm package
rm ./protonvpn-stable-release-1.0.3-1.noarch.rpm
