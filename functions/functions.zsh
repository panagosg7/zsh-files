#
# Functions
#

# Automatically run ls when cd-ing into a directory
function cd() {
    builtin cd $* && ls;
}

#Get IP
function ip-addr() {
    wget -qO- http://ipecho.net/plain
    echo
}

# Time ZSH startup
function zsh-time() {
    time zsh -i -c exit
}

# Run a command or multiple commands without saving it in the $HISTFILE
function incognito() {
    if [ -z $EDITOR ]; then
        EDITOR=vim
    fi

    # Create temp for storing commands
    TEMPFILE=`mktemp -q incognito.XXXXXXXX`

    # Prompt for commands, only run if successful
    $EDITOR $TEMPFILE || {
        echo "Invalid return on the editing"
        return
    }

    # Run the script
    sh $TEMPFILE

    # Clean everything up
    rm -f $TEMPFILE
}

# Usage: simple-extract <file>
# Description: extracts archived files (maybe)
ext () {
    if [[ -f $1 ]]; then
        case $1 in
            *.tar.bz2)  bzip2 -v -d $1      ;;
            *.tar.gz)   tar -xvzf $1        ;;
            *.rar)      unrar x $1          ;;
            *.deb)      ar -x $1            ;;
            *.bz2)      bzip2 -d $1         ;;
            *.lzh)      lha x $1            ;;
            *.gz)       gunzip -d $1        ;;
            *.tar)      tar -xvf $1         ;;
            *.tgz)      gunzip -d $1        ;;
            *.tbz2)     tar -jxvf $1        ;;
            *.zip)      unzip $1            ;;
            *.Z)        uncompress $1       ;;
            *.7z)       7z x $1             ;;
            *)          echo "'$1' Error. Please go away" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Usage: cmpr <file> (<type>)
# Description: compresses files or a directory.  Defaults to tar.gz
cmpr() {
    if [ $2 ]; then
        case $2 in
            tgz | tar.gz)   tar -zcvf$1.$2 $1 ;;
            tbz2 | tar.bz2) tar -jcvf$1.$2 $1 ;;
            tar.Z)          tar -Zcvf$1.$2 $1 ;;
            tar)            tar -cvf$1.$2  $1 ;;
            gz | gzip)      gzip           $1 ;;
            bz2 | bzip2)    bzip2          $1 ;;
            *)              echo "Error: $2 is not a valid compression type" ;;
        esac
    else
        cmpr $1 tar.gz
    fi
}

# Usage: show-archive <archive>
# Description: view archive without unpack
show-archive() {
    if [[ -f $1 ]] then
        case $1 in
            *.tar.gz)      gunzip -c $1 | tar -tf - -- ;;
            *.tar)         tar -tf $1 ;;
            *.tgz)         tar -ztf $1 ;;
            *.zip)         unzip -l $1 ;;
            *.bz2)         bzless $1 ;;
            *.rar)         unrar l $1 ;;
            *)             echo "'$1' Error. Please go away" ;;
        esac
    else
        echo "'$1' is not a valid archive"
    fi
}

status() {
    print ""
    print "Date..: "$(date "+%Y-%m-%d %H:%M:%S")""
    print "Shell.: Zsh $ZSH_VERSION (PID = $$, $SHLVL nests)"
    print "Term..: $TTY ($TERM), $BAUD bauds, $COLUMNS x $LINES cars"
    print "Login.: $LOGNAME (UID = $EUID) on $HOST"
    print "System: $(cat /etc/[A-Za-z]*[_-][rv]e[lr]*)"
    print "Uptime:$(uptime)"
    print ""
}
