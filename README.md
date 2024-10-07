# EasyGadget 🛠️🔧

EasyGadget is a powerful tool designed to simplify the process of patching Android APKs with Frida for easy instrumentation. 🚀

## What is EasyGadget? 🤔

EasyGadget automates the process of:
- Decompiling APKs 📦
- Inserting Frida loader into the main activity 💉
- Adding Frida gadget libraries 📚
- Recompiling and signing the modified APK 🔐

This tool is perfect for developers, security researchers, and reverse engineers who want to quickly instrument Android applications for dynamic analysis. 🕵️‍♀️🔍

## Setup 🔧

### Prerequisites

- A Unix-like operating system (Linux, macOS, or Windows with WSL)
- Bash shell

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/easygadget.git
   cd easygadget
   ```

2. Run the setup script:
   ```
   chmod +x setup.bash
   ./setup.bash
   ```

   This script will:
   - Install all required tools (apktool, aapt, keytool, apksigner)
   - Set up the necessary Python environment
   - Download and configure Frida gadgets for various architectures
   - Create a debug keystore for signing APKs

3. Restart your terminal or source your shell configuration file (e.g., `source ~/.bashrc`) to apply the changes.

That's it! EasyGadget is now ready to use. 🎉

## Usage 🚀

To use EasyGadget, run the following command:

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
python easygadget.py -a myapp.apk --arch arm64-v8a --script myscript.js
```

This command will patch `myapp.apk` for the arm64-v8a architecture, including `myscript.js` in the patched APK.

## Output 📤

EasyGadget will generate a patched APK file with the suffix `_mod.apk` in the same directory as the input APK.

## Troubleshooting 🔍

If you encounter any issues:
1. Ensure the setup script ran successfully and all tools were installed correctly.
2. Check that you have the necessary permissions to read the input APK and write to the output directory.
3. Use the `--logs` option for more detailed output to identify the problem.
4. Make sure you've restarted your terminal or sourced your shell configuration file after running the setup script.

## Developer 👨‍💻

EasyGadget is developed and maintained by Sannmeet Pannu.

## Contributing 🤝

Contributions are welcome! Please feel free to submit a Pull Request.

## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Disclaimer ⚠️

This tool is for educational and research purposes only. Always ensure you have permission to modify and analyze any APK you don't own.

Happy Instrumentation! 🎉🔧📱
