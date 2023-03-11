#!/bin/zsh

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"
export PATH="$PATH:/home/aayush/.local/bin/"
export PATH=$PATH:/usr/local/go/bin
#export PATH=$PATH:$HOME/documents/intellij/bin/
export PATH="$HOME/.emacs.d/bin/:$PATH"

export VISUAL="nvim"
export EDITOR="nvim"
export ALTERNATE_EDITOR="nvim"
export TERMINAL="st"
export TERMINAL_PROG="st"
export BROWSER="firefox"
export ALTBROWSER="brave"

# XDG Variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"


# Cleaning up home directory
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ALSA_CONFIG_PATH="$XDG_CONFIG_HOME/alsa/asoundrc"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export XAUTHORITY="$XDG_CONFIG_HOME/x11/.Xauthority"
#export FONTCONFIG_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/fontconfig/fonts.conf"
# Other program settings:
export DICS="/usr/share/stardict/dic/"
#export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export FZF_DEFAULT_OPTS="--layout=reverse --height 60%"
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export QT_QPA_PLATFORMTHEME="gtk2"	# Have QT use gtk2 theme.
export MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads.
export AWT_TOOLKIT="MToolkit wmname LG3D"	#May have to install wmname
export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm
export GOPATH="$XDG_DATA_HOME/go"

# Changfing git configuration file
export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/gitconfig"
# Changing TexLive directories:
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config
# Cleaning up Haskell files
export STACK_ROOT="$XDG_DATA_HOME"/stack
export GHCUP_USE_XDG_DIRS=true
# NPM
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config
# notmuch
export NOTMUCH_CONFIG=$XDG_CONFIG_HOME/notmuch/config



case ":$PATH:" in
    *:"/home/aayush/ghcup/bin":*)
        ;;
    *)
        export PATH="/home/aayush/.ghcup/bin:$PATH"
        ;;
esac
case ":$PATH:" in
    *:"$HOME/.local/share/cabal/bin":*)
        ;;
    *)
        export PATH="$HOME/.local/share/cabal/bin:$PATH"
        ;;
esac

#if [ -f "${HOME}/.local/share/gnupg/gpg-agent-info" ]; then
#     source "${HOME}/.local/share/gnupg/gpg-agent-info"
#       export GPG_AGENT_INFO
#       export SSH_AUTH_SOCK
#       export SSH_AGENT_PID
#else
#    eval $( gpg-agent --daemon --write-env-file ~/.local/share/gnupg/gpg-agent-info )
#fi

# ~/ Clean-up:

#export LF_ICONS="di=📁:\
#fi=📃:\
#tw=🤝:\
#ow=📂:\
#ln=⛓:\
#or=❌:\
#ex=🎯:\
#*.txt=✍:\
#*.mom=✍:\
#*.me=✍:\
#*.ms=✍:\
#*.png=🖼:\
#*.webp=🖼:\
#*.ico=🖼:\
#*.jpg=📸:\
#*.jpe=📸:\
#*.jpeg=📸:\
#*.gif=🖼:\
#*.svg=🗺:\
#*.tif=🖼:\
#*.tiff=🖼:\
#*.xcf=🖌:\
#*.html=🌎:\
#*.xml=📰:\
#*.gpg=🔒:\
#*.css=🎨:\
#*.pdf=📚:\
#*.djvu=📚:\
#*.epub=📚:\
#*.csv=📓:\
#*.xlsx=📓:\
#*.tex=📜:\
#*.md=📘:\
#*.r=📊:\
#*.R=📊:\
#*.rmd=📊:\
#*.Rmd=📊:\
#*.m=📊:\
#*.mp3=🎵:\
#*.opus=🎵:\
#*.ogg=🎵:\
#*.m4a=🎵:\
#*.flac=🎼:\
#*.wav=🎼:\
#*.mkv=🎥:\
#*.mp4=🎥:\
#*.webm=🎥:\
#*.mpeg=🎥:\
#*.avi=🎥:\
#*.mov=🎥:\
#*.mpg=🎥:\
#*.wmv=🎥:\
#*.m4b=🎥:\
#*.flv=🎥:\
#*.zip=📦:\
#*.rar=📦:\
#*.7z=📦:\
#*.tar.gz=📦:\
#*.z64=🎮:\
#*.v64=🎮:\
#*.n64=🎮:\
#*.gba=🎮:\
#*.nes=🎮:\
#*.gdi=🎮:\
#*.1=ℹ:\
#*.nfo=ℹ:\
#*.info=ℹ:\
#*.log=📙:\
#*.iso=📀:\
#*.img=📀:\
#*.bib=🎓:\
#*.ged=👪:\
#*.part=💔:\
#*.torrent=🔽:\
#*.jar=♨:\
#*.java=♨:\
#"
#[ -f ~/.config/lf/icons ] && {
#	LF_ICONS="$(tr '\n' ':' <~/.config/lf/icons)" \
#		&& export LF_ICONS
#}

 [ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"

 [ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc ] && setsid shortcuts >/dev/null 2>&1
