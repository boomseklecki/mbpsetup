#!/usr/bin/env bash

# Rosetta2
softwareupdate --install-rosetta
# Xcode Select Tools installed automatically but could run …
# xcode-select --install

# Check if Homebrew is installed
which -s brew
if [[ $? != 0 ]] ; then
    # echo 'Please install Homebrew by running the following command: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/matt/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/matt/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"                 
else
    brew update
fi

# Upgrade installed formulae
brew upgrade

# Save Homebrew’s installed location
BREW_PREFIX=$(brew --prefix)

# Carbon Copy Cloner
brew install --cask carbon-copy-cloner

# iTerm2
brew install --cask iterm2
# Settings > Profiles > Keys > Key Mappings > Presets > Natural Text Editing > Remove

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# nano ~/.zshrc 
# find plugins=(git)
# and change to
# plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
# Close and reopen terminal

# Git
brew install git
# git config --global user.email "email@gmail.com"
# git config --global credential.helper osxkeychain

# SSH Key https://luiscastro.co/2022/01/17/new-m1-mac-setup#ssh-key
# ssh-keygen -t ed25519 -C "email@gmail.com"
# eval "$(ssh-agent -s)"

# touch ~/.ssh/config
# vim ~/.ssh/config

# Paste the following text in the vim editor
# Host *
#   AddKeysToAgent yes
#   UseKeychain yes
#   IdentityFile ~/.ssh/id_ed25519
# Type :x then press enter to Save and Exit
# VIM :x is like :wq, but writes only when changes have been made

# ssh-add -K ~/.ssh/id_ed25519
# Persist SSH Key beyond sign-off in Keychain
# ssh-add --apple-use-keychain ~/.ssh/id_ed25519

# Copy the public key and add to GitHub SSH Keys github.com/settings 
# pbcopy < ~/.ssh/id_ed25519.pub

# GPG Key https://luiscastro.co/2022/01/17/new-m1-mac-setup#gpg-key
brew install gpg
# gpg --full-generate-key
# Select RSA key 4096 minimum key size for GitHub
# gpg --list-secret-keys --keyid-format=long
# Copy the key id appearing after “4096R/“
# git config --global user.signingkey "key id"
# gpg --armor --export “key id”
# Copy the PGP Public Key Block and Add to GitHub GPG Keys github.com/settings
# Run the following two lines to append TTY startup lines to .zshrc https://wiki.archlinux.org/title/GnuPG#Configure_pinentry_to_use_the_correct_TTY
# echo 'export GPG_TTY=$(tty)' >> ~/.zshrc
# echo 'gpg-connect-agent updatestartuptty /bye >/dev/null' >> ~/.zshrc

# GitIgnore https://sourabhbajaj.com/mac-setup/Git/gitignore.html
# https://github.com/github/gitignore/blob/main/Global/macOS.gitignore
# https://betterprogramming.pub/setting-up-a-macbook-m1-development-machine-cda22a92fa22#global-git-ignore
# cd ~
# touch .gitignore
# git config --global core.excludesfile ~/.gitignore

# Docker
brew install docker

# Docker Desktop
# didn’t work after brew install docker, decide if desktop is needed
# brew install #cask docker

# Vs code
brew install --cask vscodium

# JetBrains toolbox
brew install --cask jetbrains-toolbox

# Alfred
brew install --cask alfred
# Alfred Custom Terminal https://github.com/vitorgalvao/custom-alfred-iterm-scripts#copy-the-script

# SetApp
brew install --cask setapp

# Swish
# brew install --cask swish #Ended up downloading swish through SetApp

# OpenIn4
# brew install --cask openin # Would only install 3.0.5, couldn't get it to install 4

# Eul
brew install --cask eul

# Microsoft Office
brew install --cask microsoft-office

# Dropbox
brew install --cask dropbox

# Spotify
brew install --cask spotify

# Beersmith3
brew install --cask beersmith

# Arduino
brew install --cask arduino

# Caffeine
brew install --cask caffeine

# Chirp
brew install --cask chirp

# Angry IP Scanner
brew install --cask angry-ip-scanner

# Balena Etcher
brew install --cask balenaetcher

# Raspberry Pi Imager
brew install --cask raspberry-pi-imager

# SD Card Formatter
brew install --cask sdformatter

# Additional Browsers
# brew install --cask tor-browser
# brew install --cask brave
# brew install --cask firefox
# brew install --cask homebrew/cask-versions/firefox-nightly
# brew install --cask google-chrome
# brew install --cask homebrew/cask-versions/google-chrome-canary

# Remove outdated versions from the cellar.
brew cleanup