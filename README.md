DOTFILES
========

It's unlikely that this repository is going to be of much interest to anybody but me, but feel free to use it. The only things in here that are possibly of interest are the things in `.ccgrc`.

I swiped some functions from Fink for dealing with the colon-delimited strings for PATH-type variables, because that's how we're stuck simulating lists in the Unix shell world.

The reason I'm using those functions is that I want to be able to add things to `.ccgrc` and source it in my current shell arbitrarily often without having those PATH variables grow every time. In other words, I can call `source ~/.ccgrc` as many times as I want, and it should only makes changes the first time.

One thing to note is that it will prepend any paths it finds that match `~/opt/*/bin`. The idea is that if you have these two directories:

```
~/opt/my-app-6.3/bin
~/opt/my-app-7.0/bin
```

... then you probably want 7.0 to appear earlier in your `$PATH` than version 6.3. Because it processes them in ascii-betical order but _prepends_ them, you would end up with `~/opt/my-app-7.0/bin:~/opt/my-app-6.3/bin:...`

Usage
-----

1. Run `./configure-git.sh` to set the Git configs (name, email, shell colors, etc.).

2. Run `./install.sh` to create all the symlinks.

3. Install LiquidPrompt:

  ```bash
  cd ~/Code # or ~/src or whatever
  git clone https://github.com/nojhan/liquidprompt.git
  ```

4. Create or update `~/.bash_profile` (this part is not automated, in case the OS has already created one):

  ```bash
  CCGRC="$HOME/.ccgrc"
  [ -f "$CCGRC" ] && source "$CCGRC"

  LIQUID_PROMPT="$HOME/Code/liquidprompt"
  source "$LIQUID_PROMPT/liquidprompt"
  ```

5. The nvm developers do support having Homebrew manage nvm, so avoid that and
install it the old-fashioned way:

  https://github.com/creationix/nvm#installation

  Note that this will update `~/.bash_profile` automatically.

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
