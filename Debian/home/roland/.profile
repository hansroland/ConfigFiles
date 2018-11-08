# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes Software/ghcjs/bin if it exists
if [ -d "$HOME/Software/ghcjs/bin" ] ; then
    PATH="$HOME/Software/ghcjs/bin:$PATH"
fi


# set PATH so it includes cabals bin if it exists
if [ -d "$HOME/.cabal/bin" ] ; then
    PATH="$HOME/.cabal/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Set the path to the current GHC compiler
# See: https://gist.github.com/yantonov/10083524
export GHC_HOME=$HOME/Software/ghc  
export PATH=$GHC_HOME/bin:${PATH}

# 8.4.2 is the default Haskell version
switchghc 8.4.3

# Avoid error in criterion benchmarking: 
# ERROR: <stdout>: commitBuffer: invalid argument (invalid character)
export LC_ALL=C.UTF-8

# set PATH so it includes Software/arcanist/bin if it exists
if [ -d "$HOME/Software/arcanist/bin" ] ; then
    PATH="$HOME/Software/arcanist/bin:$PATH"
fi

if [ -e /home/roland/.nix-profile/etc/profile.d/nix.sh ]; then . /home/roland/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
