#!/bin/bash

# Update package list and upgrade existing packages
pkg update && pkg upgrade -y

# Install required packages
pkg install -y wget python openjdk-17 android-tools apksigner xz-utils aapt termux-tools

# Download and set up apktool
wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.10.0.jar -O $PREFIX/bin/apktool.jar
echo '#!/bin/bash' > $PREFIX/bin/apktool
echo 'java -jar $PREFIX/bin/apktool.jar "$@"' >> $PREFIX/bin/apktool
chmod +x $PREFIX/bin/apktool

# Install colorama for Python
pip install colorama

# Create a directory for the Frida gadget
GADGET_DIR="gadget"
mkdir -p "$GADGET_DIR"

# Frida version
FRIDA_VERSION="16.5.2"

# Download Frida gadget for different architectures
declare -A architectures=(
    ["arm"]="armeabi-v7a"
    ["arm64"]="arm64-v8a"
    ["x86"]="x86"
    ["x86_64"]="x86_64"
)

for arch in "${!architectures[@]}"; do
    folder_name="${architectures[$arch]}"
    arch_dir="$GADGET_DIR/$folder_name"
    mkdir -p "$arch_dir"

    url="https://github.com/frida/frida/releases/download/$FRIDA_VERSION/frida-gadget-$FRIDA_VERSION-android-$arch.so.xz"
    
    echo "Downloading Frida gadget for $folder_name..."
    if wget "$url" -O "$arch_dir/frida-gadget.so.xz"; then
        echo "Decompressing Frida gadget for $folder_name..."
        xz -d "$arch_dir/frida-gadget.so.xz"
        mv "$arch_dir/frida-gadget.so" "$arch_dir/libfrida.so"
        echo "Successfully downloaded and decompressed Frida gadget for $folder_name"
        
        # Create libfrida.config.so file
        echo '{
    "interaction": {
        "type": "script",
        "path": "libscript.so",
        "on_load": "resume"
    }
}' > "$arch_dir/libfrida.config.so"
        echo "Created libfrida.config.so for $folder_name"
    else
        echo "Failed to download Frida gadget for $folder_name"
    fi
done

# Create a debug keystore for signing APKs
keytool -genkey -v -keystore debug.keystore -storepass android -alias androiddebugkey -keypass android -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Android Debug,O=Android,C=US"

echo "Setup complete. The following tools have been installed:"
echo "- apktool"
echo "- aapt "
echo "- keytool (part of openjdk-17)"
echo "- apksigner"
echo "Frida gadgets have been downloaded to $GADGET_DIR"
echo "A debug keystore has been created at debug.keystore"

# Open the Telegram channel link
echo "Opening Telegram channel..."
termux-open-url "https://t.me/primes_era"

echo "Installation complete! Join our Telegram channel for updates and support."
