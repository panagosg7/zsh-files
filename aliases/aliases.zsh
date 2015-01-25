#
# Aliases for all Computers
#

# Builtin aliases
alias lla='ls -al'
alias ls='ls -G --color'
alias ll='ls -lha'
alias la='ls -ha'
alias lc='ls --color=never'
#alias rs='ls -rhsS'
alias l='ls -lh'
#alias s='ls -sh'
#alias 1='ls -1'

alias d='df -h'

alias 'grep=grep --colour'

# some useful aliases
alias md='mkdir -p'
alias rmd='rmdir'
alias wgetr='wget -r --no-parent --reject "index.html*"'

# Some cd aliases
alias back='cd -'

# ......
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias ........='cd ../../../../../../../'
alias .........='cd ../../../../../../../../'
alias ..........='cd ../../../../../../../../../'
alias ...........='cd ../../../../../../../../../../'
alias ............='cd ../../../../../../../../../../../'

# ZSH Global Aliases
alias -g L=' | less'
alias -g T=' | tail -20'
alias -g NUL=' > /dev/null 2>&1'

# I like to be safe...
# Prompts for confirmation after 'rm *' etc
# Helps avoid mistakes like 'rm * o' when 'rm *.o' was intended
#setopt RM_STAR_WAIT
alias 'rm *'='rm -i *'

# derp derp
alias mkdirp='mkdir -p'

# Alias Git, moved most other aliases to ~/.gitconfig
# For some reason, Git doesn't like capitalized aliases. Some must remain.
alias g='git'
alias gp='git pull'
alias gP='git push'

# Racket: load Readline
alias racketrl='racket -il readline'

# less with color
alias vless='vim -u /usr/share/vim/vim73/macros/less.vim'

# p is aliased to $PWD
alias p=pwd

#List only driectories
alias lsd='ls -l | grep "^d"'

#Json nice viewer
alias pp='python -mjson.tool'

#
# OS Specific Aliases
#

# OS X Aliases
if [[ $CURRENT_OS == 'OS X' ]]; then
    # Hidden files
    alias showhiddenfiles='defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder'
    alias hidehiddenfiles='defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder'

    alias 'kb-disable'='sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/'
    alias 'kb-enable'='sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/'


    # Custom search script
    alias ebook='locates ~/EBooks '

    alias rebuild-open-with='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -seed /Applications{,/Utilities}'

    # Journal Alias
    alias journal='vim ~/Documents/Journal/`date "+%Y"`/`date "+%B"`/`date "+%d-%A"`.txt'

    # EBooks
    alias tex4ebook='texlua ~/Library/texmf/tex/latex/tex4ebook/tex4ebook.lua'


    #
    # Application aliases
    #
    alias vine='open -a Vine\ Server'
    alias ss='/System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine &'

    # Open from command line
    alias finder='open -a Finder '
    
elif [[ $CURRENT_OS == 'Linux' ]]; then
    #
    # Global Linux
    #

    # Misc Aliases
    alias ls='ls --color=auto'

    # MVim == GVim on Linux
    alias mvim='gvim'

    # Extensions
    alias -s avi=vlc
    alias -s html=$BROWSER
    alias -s pdf=epdfview
    alias -s txt=$EDITOR
    alias -s text=$EDITOR

    # Images
    alias -s png=feh
    alias -s jpeg=feh
    alias -s jpg=feh
    alias -s gif=feh

    # Source Extensions
    alias -s hs=$EDITOR
    alias -s c=$EDITOR
    
    # Apt-get
    # No need for apt-get install in there, zsh completion handles apt-get real good ;)
    alias apt='aptitude'
    alias apts='aptitude search'
    alias aptc='apt-cache search'
    alias aptf='apt-file search'
    alias show='apt-cache show'
    alias dbuild='dpkg-buildpackage -uc -B -rfakeroot'
    alias di='dpkg -i'

    #
    # User Specific Aliases
    #

    if [[ $USER == 'pvekris' ]]; then
    
        #URL aliases
        alias greedy='ssh greedy.softlab.ntua.gr'
        alias xgreedy='ssh -X greedy.softlab.ntua.gr'
        alias godel='ssh godel.ucsd.edu'
        alias goto='ssh goto.ucsd.edu'
        alias syno='ssh pvekris.synology.me'
        alias synoroot='ssh root@pvekris.synology.me'

        alias mountdl='sudo mount -t vboxsf Downloads /home/pvekris/Downloads'

    
    fi
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    alias py='/cygdrive/c/Python27/python'
fi
