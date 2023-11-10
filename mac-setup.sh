#! /bin/bash

JDK_VERSION="17"
DEFAULT_BROWSER="chrome"

echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Configuring Homebrew"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> "${HOME}/.zprofile"
eval "$(/opt/homebrew/bin/brew shellenv)"

declare -a jdks=(
    "11"
    "17"
)

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
    "plex"
    "rectangle"
    "logi-options-plus"
    "xcodes"
    "menumeters"
)

declare -a packages=(
    "openjdk@$JDK_VERSION"
    "git"
    "zsh" 
    "zsh-completions"
    "mas"
    "defaultbrowser"
)

declare -a appStoreApps=(
    "Microsoft PowerPoint"
    "Microsoft Word"
    "Microsoft Excel"
    "Keynote"
    "Bitwarden"
    "Slack for Desktop"
    "ColorSlurp"
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

for i in "${appStoreApps[@]}"
do
   echo "Installing $i from the AppStore..."
   mas lucky "$i"
done

sudo chmod 777 ~/.zshrc
for i in "${jdks[@]}"
do
   echo "Setting up JDK $i"
   sudo ln -sfn "/opt/homebrew/opt/openjdk@$i/libexec/openjdk.jdk" "/Library/Java/JavaVirtualMachines/openjdk-$i.jdk"
   echo "alias j$X=\"export JAVA_HOME=\`/usr/libexec/java_home -v $X\`; java -version\"" >> ~/.zshrc
   echo "JDK $i configured"
done
source ~/.zshrc

echo "Remember to run j$JDK_VERSION to set default JDK!"

echo "Disabling automatic Space rearrangement"
defaults write com.apple.dock "mru-spaces" -bool "false" && killall Dock
echo "Done"

echo "Setting default browser to $DEFAULT_BROWSER"
osascript set-default-browser.scpt $DEFAULT_BROWSER
echo "Done"
