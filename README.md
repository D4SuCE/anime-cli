<p align=center>
<br>
<a href="http://makeapullrequest.com"><img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg"></a>
<a href="#Linux"><img src="https://img.shields.io/badge/os-linux-brightgreen"></a>
<a href="#MacOS"><img src="https://img.shields.io/badge/os-mac-brightgreen"></a>
<a href="#Android"><img src="https://img.shields.io/badge/os-android-brightgreen"></a>
<a href="#Windows"><img src="https://img.shields.io/badge/os-windows-yellowgreen"></a>
<a href="#iOS"><img src="https://img.shields.io/badge/os-ios-yellow"></a>
</p>

<h3 align="center">
A cli to browse and watch anime (alone AND with friends). This tool scrapes the site <a href="https://anilibria.top/">anilibria.</a>
</h3>

## Table of Contents

- [Fixing errors](#fixing-errors)
- [Install](#install)
  - [From Source](#installing-from-source)
  - [Tier 1: Linux, Mac, Android](#tier-1-support-linux-mac-android)
  - [Tier 2: WSL, iOS, FreeBSD](#tier-2-support-wsl-ios-freebsd)
- [Uninstall](#uninstall)
- [Completion](#completion)
  - [bash](#bash)
  - [zsh](#zsh)
- [Dependencies](#dependencies)
  - [anime-skip](#anime-skip)
- [FAQ](#faq)

## Fixing errors

If you encounter `No results found` (and are sure the prompt was correct) or any breaking issue, then make sure you are on **latest version** by typing
`sudo anime-cli -U` to update on Linux, Mac and Android. On Windows, run `anime-cli -U`.
If after this the issue persists then open an issue.

## Install

[![Packaging status](https://repology.org/badge/vertical-allrepos/ani-cli.svg?minversion=4.0)](https://repology.org/project/anime-cli/versions)

### Installing from source

*This method works for any unix-like operating system and is a baseline for porting efforts.*

Install dependencies [(See below)](#dependencies)

```sh
git clone "https://github.com/D4SuCE/anime-cli.git"
sudo cp anime-cli/anime-cli /usr/local/bin
sudo chmod +x /usr/local/bin/anime-cli
```

### Tier 1 Support: Linux, Mac, Android

*These Platforms have rock solid support and are used by maintainers and large parts of the userbase.*

<details><summary><b>Linux</b></summary>

#### Native Packages

*Native packages have a more robust update cycle, but sometimes they are slow to upgrade. \
If the one for your platform is up-to-date we suggest going with it.*

<details><summary>Arch</summary>

```sh
git clone "https://github.com/D4SuCE/anime-cli.git"
./anime-cli/install.sh
```

</details>

</details><details><summary><b>MacOS</b></summary>

Install dependencies [(See below)](#dependencies)

Install [HomeBrew](https://docs.brew.sh/Installation) if not installed.

```sh
git clone "https://github.com/D4SuCE/anime-cli.git" && cd ./anime-cli
cp ./anime-cli "$(brew --prefix)"/bin
cd .. && rm -rf ./anime-cli
```

*To install (with Homebrew) the dependencies required on Mac OS, you can run:*

```sh
brew install curl grep aria2 ffmpeg git fzf yt-dlp jq && \
brew install --cask iina
```
*Why iina and not mpv? Drop-in replacement for mpv for MacOS. Integrates well with OSX UI. Excellent support for M1. Open Source.*

</details>

<details><summary><b>Android</b></summary>

Install termux [(Guide)](https://termux.com/)

#### Termux package

```sh
git clone "https://github.com/D4SuCE/anime-cli.git"
cp anime-cli/anime-cli /usr/local/bin
chmod +x /usr/local/bin/anime-cli
```

For players you can use the apk (playstore/fdroid) versions of mpv and vlc. Note that these cannot be checked from termux so a warning is generated when checking dependencies.

</details>

### Tier 2 Support: WSL, iOS, FreeBSD

*While officially supported (except FreeBSD), installation is more involved on these platforms and sometimes issues arise. \
Reach out if you need help.*
<details><summary><b>WSL</b></summary>

Follow the installation instructions of your Linux distribution.

Note that the media player (mpv or vlc) will need to be installed on Windows, not WSL.

When installing the media player on Windows, make sure that it is on the Windows Path. An easy way to ensure this is to download the media player with a package manager (on Windows, not WSL) such as scoop.

</details>

<details><summary><b>iOS</b></summary>

Install iSH and VLC from the app store.

Make sure apk is updated using
```apk update; apk upgrade```
then run this:
```sh
apk add grep sed curl fzf git aria2 ncurses patch
apk add ffmpeg jq
git clone "https://github.com/D4SuCE/anime-cli.git"
cp anime-cli/anime-cli /usr/local/bin
chmod +x /usr/local/bin/anime-cli
```
note that downloading is going to be very slow. This is an iSH issue, not an anime-cli issue.
</details>

<details><summary><b>FreeBSD</b></summary>

#### Copypaste script:

```sh
sudo pkg install mpv fzf aria2 yt-dlp patch git jq
git clone "https://github.com/D4SuCE/anime-cli.git"
sudo cp anime-cli/anime-cli /usr/local/bin
sudo chmod +x /usr/local/bin/anime-cli
```

#### Installation in steps:

##### Install dependencies:

```sh
sudo pkg install mpv fzf aria2 yt-dlp patch jq
```

##### Install anime-cli:

install git if you haven't already

```sh
sudo pkg install git
```

install from source:

```sh
git clone "https://github.com/D4SuCE/anime-cli.git"
sudo cp anime-cli/anime-cli /usr/local/bin
sudo chmod +x /usr/local/bin/anime-cli
```

</details>

## Uninstall

<details>

* Linux:
```sh
sudo rm "/usr/local/bin/anime-cli"
```
* Mac:
```sh
rm "$(brew --prefix)/bin/anime-cli"
```
* Android:
```sh
rm "$PREFIX/bin/anime-cli"
```
* iOS
```sh
rm -rf /usr/local/bin/anime-cli
```
To uninstall other dependencies:
```sh
apk del grep sed curl fzf git aria2 ffmpeg ncurses jq
```

</details>

## Completion

### bash

To add tab completions using bash run the following command inside the anime-cli directory
```sh
cp _anime-cli-bash /path/to/your/completions
echo "source /path/to/your/completions/_anime-cli-bash" >> ~/.bashrc
```

### zsh

To add tab completions using zsh run the following command inside the anime-cli directory
```sh
cp _anime-cli-zsh /path/to/your/completions
echo "source /path/to/your/completions/_anime-cli-zsh" >> ~/.zshrc
```

## Dependencies

- grep
- sed
- curl
- mpv - Video Player
- iina - mpv replacement for MacOS
- aria2c - Download manager
- yt-dlp - m3u8 Downloader
- ffmpeg - m3u8 Downloader (fallback)
- fzf - User interface
- jq - Parsing json
- anime-skip (optional)
- patch - Self updating

### Anime-skip

Anime-skip is a script to automatically skip anime opening sequences, making it easier to watch your favorite shows without having to manually skip the intros each time.

Anime-skip uses the external lua script function of mpv and as such – for now – only works with mpv.

<details><summary><b>Linux</b></summary>

```sh
git clone "https://github.com/D4SuCE/anime-cli.git"
sudo cp anime-cli/anime-skip /usr/local/bin
sudo chmod +x /usr/local/bin/anime-skip
mkdir -p ~/.config/mpv/scripts
cp skip.lua ~/.config/mpv/scripts
```

</details>

<details><summary><b>WSL</b></summary>

After installing mpv you need to copy the lua script to:

```sh
C:\Users\"UserName"\AppData\Roaming\mpv\scripts\
```

If you don't have a scripts folder, just create it.

</details>

## FAQ
<details>

* Can I change media source? - No (unless you can scrape that source yourself).
* Can I use vlc? - Yes, use `--vlc` or `export ANI_CLI_PLAYER=vlc`.
* Can I adjust resolution? - Yes, use `-q resolution`, for example `anime-cli -q 1080`.
* How can I download? - Use `-d`, it will download into your working directory.
* Can i change download folder? - Yes, set the `ANI_CLI_DOWNLOAD_DIR` to your desired location.
* How can I bulk download? - `Use -d -e firstepisode-lastepisode`, for example `anime-cli onepiece -d -e 1-1000`.

**Note:** All features are documented in `anime-cli --help`.

</details>