DOTFILES
========

It's unlikely that this repository is going to be of much interest to anybody but me, but feel free to use it. The only things in here that are possibly of interest are the things in .ccgrc.

I swiped some functions from Fink for dealing with the colon-delimited strings for PATH-type variables, because that's how we're stuck simulating lists in the Unix shell world.

The reason I'm using those functions is that I want to be able to add things to .ccgrc and source it in my current shell arbitrarily often without having those PATH variables grow every time. In other words, I can call ``source ~/.ccgrc`` as many times as I want, and it should only makes changes the first time.

USAGE
-----

``./configure-git.sh`` to set the Git configs (name, email, shell colors, etc.)

``./install.sh`` to create all the symlinks.

After running ``install.sh``, you'll need to source it in .bashrc, .bash_profile, or .profile.
