### Advanced options

When using the app, press <kbd>CTRL</kbd> + <kbd>SHIFT</kbd> + <kbd>X</kbd> to reveal the **Advanced options** dialog.

In here, you can specify several things you would otherwise set in the boot configuration files. For example, you can enable SSH, set the Wi-Fi login, and specify your locale settings for the system image.

### Debugging

On Linux and Mac the application will print debug messages to console by default if started from console. \
On Windows start the application with the command-line option `--debug` to let it open a console window.

### Custom repository

If the application is started with "--repo [your own URL]" it will use a custom image repository. \
This is what raspi-imager uses to access the ThoriumOS repository. \
So you can then simply create another 'start menu shortcut' or .desktop file for the application with that parameter to use the application with your own images.

### CMakeLists.txt

This file (found in ./src) can be used to set compilation parameters, and modify assets added into the binary.
I have used this to use compiler optimization flags, change the name, and use different image assets.
