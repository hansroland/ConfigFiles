# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.

# to use updated .profile without log off
# source ~/.profile

#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's .cabal\bin if it exists
if [ -d "$HOME/.cabal/bin" ] ; then
    PATH="$HOME/.cabal/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/Software/bin" ] ; then
    PATH="$HOME/Software/bin:$PATH"
fi

# set PATH so it includes my ghcjs bin if it exists
if [ -d "$HOME/GHCJS/.cabal-sandbox/bin" ] ; then
    PATH="$HOME/GHCJS/.cabal-sandbox/bin:$PATH"
fi

# See: https://gist.github.com/yantonov/10083524
export GHC_HOME=$HOME/Software/ghc  
export PATH=$GHC_HOME/bin:${PATH}

# Establish the default ghc version
switchghc 7.10.2

