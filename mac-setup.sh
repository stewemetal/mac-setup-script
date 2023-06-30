#! /bin/bash

echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Configuring Homebrew"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/stewe/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

declare -a casks=(
    "google-chrome"
    "sublime-text"
    "warp"
    "balance-lock"
    "shottr"
    "vlc"
    "typora"
    "bartender"
    "gimp"
    "messenger"
    "slack"
    "skype"
    "zoom"
)

declare -a packages=(
	"git"
	"zsh" 
	"zsh-completions"
)

for i in "${casks[@]}"
do
   echo "Installing $i..."
   brew install --cask $i
done

for i in "${packages[@]}"
do
   echo "Installing $i..."
   brew install $i
done

