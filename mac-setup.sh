#! /bin/bash

JDK_VERSION="17"

echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Configuring Homebrew"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> "${HOME}/.zprofile"
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
    "contexts"
    "gimp"
    "messenger"
    "slack"
    "skype"
    "zoom"
    "marta"
    "dropbox"
    "google-drive"
    "jetbrains-toolbox"
    "visual-studio-code"
    "hugo"
    "spotify"
)

declare -a packages=(
    "openjdk@$JDK_VERSION"
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

echo "Setting up JDK"
sudo ln -sfn /opt/homebrew/opt/openjdk@$JDK_VERSION/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-$JDK_VERSION.jdk
echo 'export PATH="/opt/homebrew/opt/openjdk@$JDK_VERSION/bin:$PATH"' >> ~/.zshrc
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@$JDK_VERSION/include"
echo "JDK configured"

echo "Disabling automatic Space rearrangement"
defaults write com.apple.dock "mru-spaces" -bool "false" && killall Dock
echo "Done"
