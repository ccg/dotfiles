DOTFILES
========

In 2022, I worked to clean up and simplify this repository.

Because the Mac is my primary platform, and macos now pushes zsh as the
default, I decided to stop fighting it and to use a more streamlined
configuration based on raw zsh with a handful plugins. I tried the major zsh
"frameworks" like OhMyZsh but found them too slow and demanding of attention.


Usage
-----

1. Install Xcode.

1. Install Homebrew.

1. Install dependencies:

    ```sh
    brew install nvm                    # my .zshrc sources nvm.sh
    brew install pure                   # fancy shell prompt
    brew install zsh-autosuggestions    # fish-style suggestions
    brew install zsh-completions
    brew install zsh-syntax-highlighting
    ```

1. Run `./configure-git.sh` to set the Git configs (name, email, shell colors, etc.).

1. Run `./install.sh` to create all the symlinks.

Other Setup
-----------

On a new Mac, I like to map Command-Q to something other than quitting the
current application, because it's too easy to hit Command-Q by accident,
especially when you're trying to hit Command-W.

Open System Preferences -> Keyboard -> Shortcuts and map Command-Q to
something else. I usually use App Shortcuts -> Show Help menu, but another
good option is Accessibility -> Invert colors.

https://www.quora.com/How-do-I-disable-Command-q-in-OSX

Another good Mac tweak is to disable the annoying autocorrect in text fields.
Open System Preferences -> Keyboard -> Text and then disable everything.
