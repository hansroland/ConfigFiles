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

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# -- Added by RSX
# Avoid error in criterion benchmarking: 
# ERROR: <stdout>: commitBuffer: invalid argument (invalid character)
export LC_ALL=C.UTF-8

# Set the path to the current GHC compiler
# See: https://gist.github.com/yantonov/10083524
export GHC_HOME=$HOME/Software/ghc  
export PATH=$GHC_HOME/bin:${PATH}

# Set the default Haskell version
# -- ATTENTION: Compile Xmonad before changing the default GHC version!!!
switchghc 9.0.1

export PATH="$HOME/.cargo/bin:$PATH"

# Set the Git Credential manager method 
export GCM_CREDENTIAL_STORE=cache

