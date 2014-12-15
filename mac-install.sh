#!/bin/sh

CYAN="\\033[1;36m"

function info() {
    echo $CYAN $1
}

function error() {
    echo $CYAN $1
    exit 1
}

info "### start install ####"

if ! type brew &> /dev/null; then
    info "homebrew installation"
    # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
    info "brew is already installed"
fi

if ! type brew &> /dev/null; then
    error "brew must be installed"
fi

info "Install homebrew package"
brew tap homebrew/dupes
brew tap josegonzalez/homebrew-php
brew tap phinze/homebrew-cask
brew update
brew install $(cat Brewfile)

info "Install homebrew cask package"
brew cask install $(cat Caskfile)

brew cleanup

info "Install Oh my zsh"
curl -L http://install.ohmyz.sh | sh

mv .zshrc ~/.zshrc
