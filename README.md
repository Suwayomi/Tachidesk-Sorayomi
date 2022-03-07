<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="assets/images/icon.png" alt="Bot logo"></a>
</p>

<h1 align="center"> Tachidesk Sorayomi </h1>

<div align="center">

[![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20Windows%20%7C%20Android-lightgrey)](https://t.me/CR_ALT_BOT)
[![GitHub Issues](https://img.shields.io/github/issues/Suwayomi/Tachidesk-Sorayomi)](https://github.com/Suwayomi/Tachidesk-Sorayomi/issues)
[![GitHub Forks](https://img.shields.io/github/forks/Suwayomi/Tachidesk-Sorayomi)](https://github.com/Suwayomi/Tachidesk-Sorayomi)

</div>
<div align="center">

[![GitHub Stars](https://img.shields.io/github/stars/Suwayomi/Tachidesk-Sorayomi)](https://github.com/Suwayomi/Tachidesk-Sorayomi)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/Suwayomi/Tachidesk-Sorayomi)](https://github.com/Suwayomi/Tachidesk-Sorayomi/pulls)
[![GitHub License](https://img.shields.io/github/license/Suwayomi/Tachidesk-Sorayomi)](https://github.com/Suwayomi/Tachidesk-Sorayomi/blob/main/LICENSE)

</div>


<p align="center">  
A free and open source manga reader to read manga from a <a href="https://github.com/Suwayomi/Tachidesk-Server">Tachidesk-Server</a> instance.</br></br>
Tachidesk-Sorayomi need to connect with an already hosted server.</br></br>
Tachidesk-Sorayomi supports Linux, Windows and Android.
</p>

---

## Is this application usable? Should I test it?

Here is a list of current features for interaction with Tachidesk-Sorayomi:

- Managing installed Extensions.
- Interaction with your library.
- Browsing installed sources.
- Viewing manga and chapters.
- Reading, downloading, and managing chapters.
- Viewing chapter updates

**Note:** Keep in mind that Tachidesk-Sorayomi and Tachidesk-Server are alpha software, so it can have issues. See [Support and help](#support-and-help) if it happens.


### Supported Tachidesk versions

These are the versions of [Tachidesk-Server][tachidesk-server] that Flutter supports.

#### [Release build][release]

- [Tachidesk-Server][tachidesk-server] v0.6.0+

<!-- 

## Downloading and Running the app

### Windows 

Download the latest msi release from [the releases section][release].

### MacOS 

Download the latest dmg release from [the releases section][release].

### Debian based Linux 

Download the latest deb release from [the releases section][release].

### Fedora based Linux 

Download the latest rpm release from [the releases section][release].

### Arch based Linux 

Download the latest release from [the aur](https://aur.archlinux.org/packages/tachidesk-sorayomi/).

If you use yay, you can run `yay -S tachidesk-sorayomi` inside a terminal window. 

-->

## Building from source

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You can install Flutter & Dart from [Official website](https://docs.flutter.dev/get-started/install)
```
  $ Dart sdk - ">=2.16.0-80.1.beta <3.0.0"
  $ Flutter version 2.11.0-0.1.pre Channel beta
```

### Installing

1.  Clone the repository:

```
  $ git clone https://github.com/Suwayomi/Tachidesk-Sorayomi.git
  $ cd Tachidesk-Sorayomi/
```
2.  You can install all dependencies by running this command in terminal:

```
  $ flutter pub get
```

3.  Now enter the following command to start debugging the app:

```
  $ flutter run       
```


## Support and help

-   Join Tachidesk's [discord server](https://discord.gg/DDZdqZWaHA) to hang out with the community and receive support and help.


## Built Using

- [Flutter](https://flutter.dev/)
- [Flutter Getx](https://github.com/jonataslaw/getx) - State, Navigation & Dependencies Manager
- [Flutter Getx Pattern](https://github.com/kauemurakami/getx_pattern) - A proposal to standardize your development with GetX (File structure).
    
    Find other dependencies in [pubspec.yaml](pubspec.yaml)

## Credit

- The `Tachidesk` project is developed by [@AriaMoradi](https://github.com/AriaMoradi) and contributors, 

- The `Tachidesk-Sorayomi` project is developed by [@DattatreyaReddy](https://github.com/DattatreyaReddy) and contributors, 

- CI-CD for `Tachidesk-Sorayomi` is developed by [@mahor1221](github.com/mahor1221)  and contributors.

    
## License

A link for [Tachidesk is provided here](https://github.com/Suwayomi/Tachidesk) and is licensed under `Mozilla Public License v2.0`.

Parts of [Tachiyomi-1.x](https://github.com/tachiyomiorg/tachiyomi-1.x) is adopted into this codebase, also licensed under `Mozilla Public License v2.0`.

You can obtain a copy of `Mozilla Public License v2.0` from https://mozilla.org/MPL/2.0/


    Copyright (C) Contributors to the Suwayomi project

    This Source Code Form is subject to the terms of the Mozilla Public
    License, v. 2.0. If a copy of the MPL was not distributed with this
    file, You can obtain one at http://mozilla.org/MPL/2.0/.


[release]: https://github.com/Suwayomi/Tachidesk-Sorayomi/releases
[tachidesk-server]: https://github.com/Suwayomi/Tachidesk-Server
[tachidesk-server-preview]: https://github.com/Suwayomi/Tachidesk-Server-preview/releases