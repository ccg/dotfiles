DOTFILES
========

It's unlikely that this repository is going to be of much interest to anybody but me, but feel free to use it. The only things in here that are possibly of interest are the things in .ccgrc.

I swiped some functions from Fink for dealing with the colon-delimited strings for PATH-type variables, because that's how we're stuck simulating lists in the Unix shell world.

The reason I'm using those functions is that I want to be able to add things to .ccgrc and source it in my current shell arbitrarily often without having those PATH variables grow without bound. If you want to be pedantic, the operation ``source ~/.ccgrc`` is idempotent. Apparently, I want to be pedantic.
