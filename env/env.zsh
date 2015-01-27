#
# Env Variables
#

# Dynamic colors
source $HOME/.dynamic-colors/completions/dynamic-colors.zsh

#
# OS Specific Env Variables
#

if [[ $CURRENT_OS == 'OS X' ]]; then
    # OS X Env Variables
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # Linux Env Variables

    export DJS_DIR=$HOME/Documents/research/djs
    
    export NODE_PATH='$HOME/.root/lib/jsctags:${NODE_PATH}'
    
    export EC2_VAULT='/home/pvekris/Documents/classes/cse291/Vault'

elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    # Cygwin Env Variables
fi
