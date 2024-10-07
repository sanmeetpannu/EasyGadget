# EasyGadget 🛠️🔧

EasyGadget is a powerful tool designed to simplify the process of patching Android APKs with Frida for easy instrumentation, specifically for use in Termux on Android. 🚀📱

## What is EasyGadget? 🤔

EasyGadget automates the process of:
- Decompiling APKs 📦
- Inserting Frida loader into the main activity 💉
- Adding Frida gadget libraries 📚
- Recompiling and signing the modified APK 🔐

This tool is perfect for developers, security researchers, and reverse engineers who want to quickly instrument Android applications for dynamic analysis directly on their Android devices using Termux. 🕵️‍♀️🔍

## Setup 🔧

### Prerequisites

- Termux app installed on your Android device

### Installation

1. Install Termux from the Google Play Store or F-Droid.

2. Open Termux and run the following commands:

   ```
   termux-setup-storage
   pkg update && pkg upgrade
   pkg install git
   ```

3. Clone the repository:
   ```
   git clone https://github.com/yourusername/easygadget.git
   cd easygadget
   ```

4. Run the setup script:
   ```
   chmod +x setup.bash
   ./setup.bash
   ```

   This script will:
   - Install all required tools (apktool, aapt, keytool, apksigner)
   - Set up the necessary Python environment
   - Download and configure Frida gadgets for various architectures
   - Create a debug keystore for signing APKs

5. Restart Termux or run `source ~/.bashrc` to apply the changes.

That's it! EasyGadget is now ready to use in Termux. 🎉

## Usage 🚀

To use EasyGadget, run the following command in Termux:

```
python easygadget.py -a /path/to/your/app.apk --arch [architecture] [options]
```

### Options:

- `-a`, `--apk`: Path to the APK file to patch (required)
- `--arch`: Target architecture (choices: 'armeabi-v7a', 'arm64-v8a', 'x86', 'x86_64') (required)
- `--script`: Path to the script.js file to be included in the APK
- `--logs`: Show detailed logs

### Example:

```
python easygadget.py -a /sdcard/Download/myapp.apk --arch arm64-v8a --script myscript.js
```

This command will patch `myapp.apk` for the arm64-v8a architecture, including `myscript.js` in the patched APK.

## Output 📤

EasyGadget will generate a patched APK file with the suffix `_mod.apk` in the same directory as the input APK.

## Troubleshooting 🔍

If you encounter any issues:
1. Ensure the setup script ran successfully and all tools were installed correctly.
2. Check that you have granted Termux storage permissions (`termux-setup-storage`).
3. Use the `--logs` option for more detailed output to identify the problem.
4. Make sure you've restarted Termux or sourced your shell configuration file after running the setup script.

## Developer 👨‍💻

EasyGadget is developed and maintained by Sannmeet Pannu.

## Contributing 🤝

Contributions are welcome! Please feel free to submit a Pull Request.

## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Disclaimer ⚠️

This tool is for educational and research purposes only. Always ensure you have permission to modify and analyze any APK you don't own. Be aware of the legal implications of reverse engineering applications in your jurisdiction.

Happy Instrumentation on Termux! 🎉🔧📱
