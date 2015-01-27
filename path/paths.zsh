#
# Paths for all Computers
#

#  Add the ~/bin/ directory for all users
export PATH=~/.cabal/bin:$PATH
export PATH=~/.root/bin/:$PATH

if [[ $USER == 'pvekris' ]]; then
    export PATH=$PATH:$HOME/.dynamic-colors/bin
fi

#
# OS Specific Paths
#

# OS X Aliases
if [[ $CURRENT_OS == 'OS X' ]]; then
    #
    # Prefixed Paths
    #

    # Prefix /usr/local/bin for brew
    export PATH=/usr/local/bin:$PATH

    # Rbenv
    export PATH=~/.rbenv/shims:$PATH

    #
    # Normal Paths
    #

    # MIT-Scheme
    export MITSCHEME_LIBRARY_PATH=/usr/local/lib/mit-scheme-c/
    # Nmap
    export PATH=$PATH:/Users/Davis/.nmap
    #  Django
    export PATH=$PATH:/Library/Python/2.5/site-packages/django/bin
    #  MacPorts
    export PATH=$PATH:/opt/local/bin
    #  Add the bin/Mac directory
    export PATH=$PATH:~/bin/Mac
    # Add all npm packages
    export PATH=$PATH:/usr/local/share/npm/bin

    # Add Java jars (like checkstyle, etc)
    export PATH=$PATH:~/jars
elif [[ $CURRENT_OS == 'Linux' ]]; then

    # CentOS Paths
    if [[ $DISTRO == 'CentOS' ]]; then
        # Add LaTeX to path
        export PATH=$PATH:/usr/local/texlive/2013/bin/x86_64-linux
    fi

    #
    # User Specific Aliases
    #

    if [[ $USER == 'pvekris' ]]; then
        # Home Linux
        #
        #
    fi
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    #
fi
