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

# Set the path to the current GHC compiler
# See: https://gist.github.com/yantonov/10083524
export GHC_HOME=$HOME/Software/ghc  
export PATH=$GHC_HOME/bin:${PATH}

# Put the $HOME/bin logically before the GHC directory, so we can wrap ghc to
# compile the xmonad config with a sandbox (later !!)
# See: https://www.reddit.com/r/haskell/comments/2spurv/announce_xmonadentryhelper/



# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# 8.0.1 is the default Haskell version
switchghc 8.0.1

# 7.10.3 is the default GHCJS version
switchghcjs 7.10.3
