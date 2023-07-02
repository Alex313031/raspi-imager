# raspi-imager

Raspberry Pi Imaging Utility for ThoriumOS

 - This is a custom fork of [rpi-imager](https://github.com/raspberrypi/rpi-imager) for [ThoriumOS](https://github.com/Alex313031/ThoriumOS) on Raspberry Pi, with support for the OS repo and the `.bin` images therein.
 - To install (this fork), See > [Releases]()
 - To install (upstream) on Raspberry Pi OS, Raspbian, or Ubuntu, use `sudo apt update && sudo apt install rpi-imager`.

## Building on Debian/Ubuntu Linux

#### Get dependencies

Install the build dependencies:

```bash
sudo apt install --no-install-recommends build-essential devscripts debhelper cmake git libarchive-dev libcurl4-gnutls-dev \
    qtbase5-dev qtbase5-dev-tools qtdeclarative5-dev libqt5svg5-dev qttools5-dev libgnutls28-dev \
    qml-module-qtquick2 qml-module-qtquick-controls2 qml-module-qtquick-layouts qml-module-qtquick-templates2 qml-module-qtquick-window2 qml-module-qtgraphicaleffects
```

#### Get the source

```bash
git clone https://github.com/Alex313031/raspi-imager.git
```

#### Build

Run `build.sh` to make a x64 build:

```bash
./build.sh
```

Once it is complete, you will find an "build" directory in the root of the repo. \
The binary is only a single file! To run, simply run `./raspi-imager` from "build". You can copy this binary anywhere. \
You can run `./build.sh --clean` to clean the output directory, and `./build.sh --help` to see more options.

### Building a .deb package, or for ARM64, Windows, or MacOS

See > [BUILDING.md](BUILDING.md)

### Advanced Developer/Debugging Stuff

See > [DEVELOPMENT.md](DEVELOPMENT.md)

### Telemetry

*This fork fully disables Telemetry!*

~~In order to understand usage of the application (e.g. uptake of Raspberry Pi Imager versions and which images and operating systems are most popular) when using the default image repository, the URL, operating system name and category (if present) of a selected image are sent along with the running version of Raspberry Pi Imager, your operating system, CPU architecture, locale and Raspberry Pi revision (if applicable) to https://rpi-imager-stats.raspberrypi.com by downloadstatstelemetry.cpp.~~

~~This web service is hosted by [Heroku](https://www.heroku.com) and only stores an incrementing counter using a [Redis Sorted Set](https://redis.io/topics/data-types#sorted-sets) for each URL, operating system name and category per day in the `eu-west-1` region and does not associate any personal data with those counts. This allows us to query the number of downloads over time and nothing else.~~

~~The last 1,500 requests to the service are logged for one week before expiring as this is the [minimum log retention period for Heroku](https://devcenter.heroku.com/articles/logging#log-history-limits).~~

On Windows, you can opt out of telemetry by disabling it in the Registry:

```
reg add "HKCU\Software\Raspberry Pi\Imager" /v telemetry /t REG_DWORD /d 0
```

On Linux, run `rpi-imager --disable-telemetry` or add the following to `~/.config/Raspberry Pi/Imager.conf`:

```ini
[General]
telemetry=false
```

On macOS, disable it by editing the property list for the application:

```
defaults write org.raspberrypi.Imager.plist telemetry -bool NO
```

## License

See > [LICENSE.md](LICENSE.md)

The main code of the Imaging Utility is made available under the terms of the Apache license.
See license.txt and files in "src/dependencies" folder for more information about the various open source licenses that apply to the third-party dependencies used such as Qt, libarchive, drivelist, mountutils and libcurl.
For the embedded (netboot) build see also "embedded/legal-info" for more information about the extra system software included in that.
