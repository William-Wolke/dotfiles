# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
alias -- -='cd -'
alias ..='cd ../'
alias ...='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias _='sudo'
alias afind='ack -il'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias c='clear'
alias ccom='bash ~/Documents/edaider/misc-scripts/ChooseCommandUtility.sh'
alias cd='_omb_directories_cd'
alias cd..='cd ../'
alias cic='bind "set completion-ignore-case on"'
alias cp='cp -iv'
alias d='bm -d'
alias docex='bash ~/Documents/edaider/misc-scripts/DockerExecUtility.sh'
alias egrep='grep -E --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias fgrep='grep -F --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias fix_stty='stty sane'
alias fix_term='echo -e "\033c"'
alias g='bm -g'
alias ga='command git add'
alias gaa='command git add --all'
alias gam='command git am'
alias gama='command git am --abort'
alias gamc='command git am --continue'
alias gams='command git am --skip'
alias gamscp='command git am --show-current-patch'
alias gap='command git apply'
alias gapa='command git add --patch'
alias gapt='command git apply --3way'
alias gau='command git add --update'
alias gav='command git add --verbose'
alias gb='command git branch'
alias gbD='command git branch --delete --force'
alias gba='command git branch -a'
alias gbd='command git branch -d'
alias gbda='command git branch --no-color --merged | command grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch))\s*$)" | command xargs git branch --delete 2>/dev/null'
alias gbg='LANG=C command git branch -vv | grep ": gone\]"'
alias gbgD='LANG=C command git branch --no-color -vv | grep ": gone\]" | awk '\''{print $1}'\'' | command xargs git branch -D'
alias gbgd='LANG=C command git branch --no-color -vv | grep ": gone\]" | awk '\''{print $1}'\'' | command xargs git branch -d'
alias gbl='command git blame -b -w'
alias gbm='command git branch --move'
alias gbnm='command git branch --no-merged'
alias gbr='command git branch --remote'
alias gbs='command git bisect'
alias gbsb='command git bisect bad'
alias gbsc='command git branch --show-current'
alias gbsg='command git bisect good'
alias gbsn='command git bisect new'
alias gbso='command git bisect old'
alias gbsr='command git bisect reset'
alias gbss='command git bisect start'
alias gc='command git commit --verbose'
alias gc!='command git commit --verbose --amend'
alias gca='command git commit --verbose --all'
alias gca!='command git commit --verbose --all --amend'
alias gcam='command git commit --all --message'
alias gcan!='command git commit --verbose --all --no-edit --amend'
alias gcans!='command git commit --verbose --all --signoff --no-edit --amend'
alias gcas='command git commit --all --signoff'
alias gcasm='command git commit --all --signoff --message'
alias gcb='command git checkout -b'
alias gcd='command git checkout "$(git_develop_branch)"'
alias gcf='command git config --list'
alias gcheck='bash ~/Documents/edaider/misc-scripts/GitCheckoutUtility.sh'
alias gcl='command git clone --recursive'
alias gclean='command git clean -fd'
alias gcm='command git checkout "$(git_main_branch)"'
alias gcmsg='command git commit --message'
alias gcn!='command git commit --verbose --no-edit --amend'
alias gco='command git checkout'
alias gcor='command git checkout --recurse-submodules'
alias gcount='command git shortlog --summary --numbered'
alias gcp='command git cherry-pick'
alias gcpa='command git cherry-pick --abort'
alias gcpc='command git cherry-pick --continue'
alias gcps='command git cherry-pick -s'
alias gcs='command git commit --gpg-sign'
alias gcsm='command git commit --signoff --message'
alias gcss='command git commit --gpg-sign --signoff'
alias gcssm='command git commit --gpg-sign --signoff --message'
alias gd='command git diff'
alias gdca='command git diff --cached'
alias gdct='command git describe --tags `git rev-list --tags --max-count=1`'
alias gdcw='command git diff --cached --word-diff'
alias gds='command git diff --staged'
alias gdt='command git diff-tree --no-commit-id --name-only -r'
alias gdtool='command git difftool -d'
alias gdup='command git diff @{upstream}'
alias gdw='command git diff --word-diff'
alias gf='command git fetch'
alias gfa='command git fetch --all --prune'
alias gfg='command git ls-files | grep'
alias gfo='command git fetch origin'
alias gg='command git gui citool'
alias gga='command git gui citool --amend'
alias ggpull='command git pull origin "$(git_current_branch)"'
alias ggpur='ggu'
alias ggpush='command git push origin "$(git_current_branch)"'
alias ggsup='command git branch --set-upstream-to="origin/$(git_current_branch)"'
alias ghh='command git help'
alias gignore='command git update-index --assume-unchanged'
alias gignored='command git ls-files -v | grep "^[[:lower:]]"'
alias git-svn-dcommit-push='command git svn dcommit && command git push github "$(git_main_branch):svntrunk"'
alias gk='\gitk --all --branches'
alias gke='\gitk --all $(git log --walk-reflogs --pretty=%h)'
alias gl='command git pull'
alias glg='command git log --stat'
alias glgg='command git log --graph'
alias glgga='command git log --graph --decorate --all'
alias glgm='command git log --graph --max-count=10'
alias glgp='command git log --stat -p'
alias glo='command git log --oneline --decorate'
alias glod='command git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
alias glods='command git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'
alias glog='command git log --oneline --decorate --graph'
alias gloga='command git log --oneline --decorate --graph --all'
alias glol='command git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
alias glola='command git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
alias glols='command git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'
alias glp='_git_log_prettily'
alias gluc='command git pull upstream "$(git_current_branch)"'
alias glum='command git pull upstream "$(git_main_branch)"'
alias gm='command git merge'
alias gma='command git merge --abort'
alias gmom='command git merge "origin/$(git_main_branch)"'
alias gms='command git merge --squash'
alias gmt='command git mergetool --no-prompt'
alias gmtl='command git mergetool --no-prompt'
alias gmtlvim='command git mergetool --no-prompt --tool=vimdiff'
alias gmtvim='command git mergetool --no-prompt --tool=vimdiff'
alias gmum='command git merge "upstream/$(git_main_branch)"'
alias gp='command git push'
alias gpd='command git push --dry-run'
alias gpf='command git push --force-with-lease'
alias gpf!='command git push --force'
alias gpoat='command git push origin --all && command git push origin --tags'
alias gpod='command git push origin --delete'
alias gpr='command git pull --rebase'
alias gpristine='command git reset --hard && command git clean --force -dfx'
alias gpsup='command git push --set-upstream origin "$(git_current_branch)"'
alias gpsupf='command git push --set-upstream origin "$(git_current_branch)" --force-with-lease'
alias gpu='command git push upstream'
alias gpv='command git push --verbose'
alias gr='command git remote'
alias gra='command git remote add'
alias grb='command git rebase'
alias grba='command git rebase --abort'
alias grbc='command git rebase --continue'
alias grbd='command git rebase "$(git_develop_branch)"'
alias grbi='command git rebase --interactive'
alias grbm='command git rebase "$(git_main_branch)"'
alias grbo='command git rebase --onto'
alias grbom='command git rebase "origin/$(git_main_branch)"'
alias grbs='command git rebase --skip'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias grev='command git revert'
alias grh='command git reset'
alias grhh='command git reset --hard'
alias grhk='command git reset --keep'
alias grhs='command git reset --soft'
alias grm='command git rm'
alias grmc='command git rm --cached'
alias grmv='command git remote rename'
alias groh='command git reset "origin/$(git_current_branch)" --hard'
alias grrm='command git remote remove'
alias grs='command git restore'
alias grset='command git remote set-url'
alias grss='command git restore --source'
alias grst='command git restore --staged'
alias grt='cd $(command git rev-parse --show-toplevel || echo ".")'
alias gru='command git reset --'
alias grup='command git remote update'
alias grv='command git remote --verbose'
alias gsb='command git status --short --branch'
alias gsd='command git svn dcommit'
alias gsh='command git show'
alias gsi='command git submodule init'
alias gsps='command git show --pretty=short --show-signature'
alias gsr='command git svn rebase'
alias gss='command git status --short'
alias gst='command git status'
alias gsta='command git stash save'
alias gstaa='command git stash apply'
alias gstall='command git stash --all'
alias gstc='command git stash clear'
alias gstd='command git stash drop'
alias gstl='command git stash list'
alias gstp='command git stash pop'
alias gsts='command git stash show'
alias gstu='gsta --include-untracked'
alias gsu='command git submodule update'
alias gsw='command git switch'
alias gswc='command git switch --create'
alias gswd='command git switch "$(git_develop_branch)"'
alias gswm='command git switch "$(git_main_branch)"'
alias gta='command git tag --annotate'
alias gts='command git tag --sign'
alias gtv='command git tag | sort -V'
alias gunignore='command git update-index --no-assume-unchanged'
alias gunwip='command git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && command git reset HEAD~1'
alias gup='command git pull --rebase'
alias gupa='command git pull --rebase --autostash'
alias gupav='command git pull --rebase --autostash --verbose'
alias gupom='command git pull --rebase origin "$(git_main_branch)"'
alias gupomi='command git pull --rebase=interactive origin "$(git_main_branch)"'
alias gupv='command git pull --rebase --verbose'
alias gwch='command git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='command git add -A; command git rm $(git ls-files --deleted) 2> /dev/null; command git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
alias gwt='command git worktree'
alias gwta='command git worktree add'
alias gwtls='command git worktree list'
alias gwtmv='command git worktree move'
alias gwtrm='command git worktree remove'
alias l='ls -lha'
alias la='ls -lhA'
alias less='less -FSRXc'
alias lint='bash ~/Documents/edaider/misc-scripts/lint-all.sh'
alias ll='ls -lAFh'
alias ls='exa'
alias lsa='ls -lha'
alias md='mkdir -p'
alias mkdir='mkdir -pv'
alias mv='_omb_util_alias_init_mv'
alias nano='nano -W'
alias npmD='npm i -D '
alias npmE='PATH="$(npm bin)":"$PATH"'
alias npmI='npm init'
alias npmL='npm list'
alias npmL0='npm ls --depth=0'
alias npmO='npm outdated'
alias npmP='npm publish'
alias npmR='npm run'
alias npmS='npm i -S '
alias npmV='npm -v'
alias npmg='npm i -g '
alias npmst='npm start'
alias npmt='npm test'
alias p='bm -p'
alias path='echo -e ${PATH//:/\\n}'
alias please='sudo'
alias po='popd'
alias prettify='bash ~/Documents/edaider/misc-scripts/prettify-all.sh'
alias psqlcon='PGPASSWORD=postgres psql -d edaider -h localhost -p 5434 -U postgres'
alias rd='rmdir'
alias s='bm -a'
alias show_options='shopt'
alias src='source ~/.bashrc'
alias wget='wget -c'
/home/william/bashrc
declare -x COLORTERM="truecolor"
declare -x DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
declare -x DENO_INSTALL="/home/william/.deno"
declare -x DESKTOP_SESSION="ubuntu"
declare -x DISPLAY=":0"
declare -x DOTNET_BUNDLE_EXTRACT_BASE_DIR="/home/william/.cache/dotnet_bundle_extract"
declare -x GDMSESSION="ubuntu"
declare -x GNOME_DESKTOP_SESSION_ID="this-is-deprecated"
declare -x GNOME_SETUP_DISPLAY=":1"
declare -x GNOME_SHELL_SESSION_MODE="ubuntu"
declare -x GNOME_TERMINAL_SCREEN="/org/gnome/Terminal/screen/4784eae4_40e9_4a07_a90d_184624876c69"
declare -x GNOME_TERMINAL_SERVICE=":1.118"
declare -x GOPATH="/home/william/go"
declare -x GTK_MODULES="gail:atk-bridge"
declare -x HISTFILESIZE=""
declare -x HISTSIZE=""
declare -x HOME="/home/william"
declare -x IM_CONFIG_PHASE="1"
declare -x LANG="en_US.UTF-8"
declare -x LC_ADDRESS="sv_SE.UTF-8"
declare -x LC_CTYPE="en_US.UTF-8"
declare -x LC_IDENTIFICATION="sv_SE.UTF-8"
declare -x LC_MEASUREMENT="sv_SE.UTF-8"
declare -x LC_MONETARY="sv_SE.UTF-8"
declare -x LC_NAME="sv_SE.UTF-8"
declare -x LC_NUMERIC="sv_SE.UTF-8"
declare -x LC_PAPER="sv_SE.UTF-8"
declare -x LC_TELEPHONE="sv_SE.UTF-8"
declare -x LC_TIME="sv_SE.UTF-8"
declare -x LESS="-R"
declare -x LESSCLOSE="/usr/bin/lesspipe %s %s"
declare -x LESSOPEN="| /usr/bin/lesspipe %s"
declare -x LIBVIRT_DEFAULT_URI="qemu:///system"
declare -x LOGNAME="william"
declare -x LSCOLORS="Gxfxcxdxdxegedabagacad"
declare -x LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"
declare -x MYSQL_PS1="(\\u@\\h) [\\d]> "
declare -x NVM_BIN="/home/william/.nvm/versions/node/v19.6.0/bin"
declare -x NVM_CD_FLAGS=""
declare -x NVM_DIR="/home/william/.nvm"
declare -x NVM_INC="/home/william/.nvm/versions/node/v19.6.0/include/node"
declare -x OLDPWD="/home/william"
declare -x OSH="/home/william/.oh-my-bash"
declare -x PAGER="less"
declare -x PATH="/usr/local/go/bin:/usr/lib/postgresql/X.Y/bin/:/home/william/.local/bin:/home/william/.cargo/bin:/home/william/.dotnet/tools:/home/william/.deno/bin:/home/william/.nvm/versions/node/v19.6.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin:/home/william/.nvm/versions/node/v19.6.0/bin###-begin-npm-completion-###"
declare -x PWD="/home/william/dotfiles"
declare -x PYTHON_KEYRING_BACKEND="keyring.backends.null.Keyring"
declare -x QT_ACCESSIBILITY="1"
declare -x QT_IM_MODULE="ibus"
declare -x RUSTC_WRAPPER=""
declare -x SESSION_MANAGER="local/william-laptop:@/tmp/.ICE-unix/2774,unix/william-laptop:/tmp/.ICE-unix/2774"
declare -x SHELL="/bin/bash"
declare -x SHLVL="1"
declare -x SSH_AGENT_LAUNCHER="gnome-keyring"
declare -x SSH_AUTH_SOCK="/run/user/1000/keyring/ssh"
declare -x STARSHIP_SESSION_KEY="7660317171266820"
declare -x STARSHIP_SHELL="bash"
declare -x SYSTEMD_EXEC_PID="2949"
declare -x TERM="xterm-256color"
declare -x USER="william"
declare -x USERNAME="william"
declare -x VTE_VERSION="6800"
declare -x WAYLAND_DISPLAY="wayland-0"
declare -x XAUTHORITY="/run/user/1000/.mutter-Xwaylandauth.1GT1H2"
declare -x XDG_CONFIG_DIRS="/etc/xdg/xdg-ubuntu:/etc/xdg"
declare -x XDG_CURRENT_DESKTOP="ubuntu:GNOME"
declare -x XDG_DATA_DIRS="/usr/share/ubuntu:/home/william/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop"
declare -x XDG_MENU_PREFIX="gnome-"
declare -x XDG_RUNTIME_DIR="/run/user/1000"
declare -x XDG_SESSION_CLASS="user"
declare -x XDG_SESSION_DESKTOP="ubuntu"
declare -x XDG_SESSION_TYPE="wayland"
declare -x XMODIFIERS="@im=ibus"
/home/william/bashrc
BASH=/usr/bin/bash
BASHMARKS_SDIRS=/home/william/.sdirs
BASHOPTS=autocd:cdable_vars:cdspell:checkwinsize:cmdhist:complete_fullquote:dirspell:expand_aliases:extglob:extquote:force_fignore:globasciiranges:globstar:histappend:histreedit:histverify:interactive_comments:lithist:nocaseglob:progcomp:promptvars:sourcepath
BASH_ALIASES=()
BASH_ARGC=([0]="0")
BASH_ARGV=()
BASH_CMDS=()
BASH_COMPLETION_VERSINFO=([0]="2" [1]="11")
BASH_LINENO=()
BASH_REMATCH=()
BASH_SOURCE=()
BASH_VERSINFO=([0]="5" [1]="1" [2]="16" [3]="1" [4]="release" [5]="x86_64-pc-linux-gnu")
BASH_VERSION='5.1.16(1)-release'
BG=([049]=$'\E[48;5;049m' [048]=$'\E[48;5;048m' [043]=$'\E[48;5;043m' [042]=$'\E[48;5;042m' [041]=$'\E[48;5;041m' [040]=$'\E[48;5;040m' [047]=$'\E[48;5;047m' [046]=$'\E[48;5;046m' [045]=$'\E[48;5;045m' [044]=$'\E[48;5;044m' [249]=$'\E[48;5;249m' [248]=$'\E[48;5;248m' [241]=$'\E[48;5;241m' [240]=$'\E[48;5;240m' [243]=$'\E[48;5;243m' [242]=$'\E[48;5;242m' [245]=$'\E[48;5;245m' [244]=$'\E[48;5;244m' [247]=$'\E[48;5;247m' [246]=$'\E[48;5;246m' [111]=$'\E[48;5;111m' [110]=$'\E[48;5;110m' [038]=$'\E[48;5;038m' [113]=$'\E[48;5;113m' [039]=$'\E[48;5;039m' [112]=$'\E[48;5;112m' [115]=$'\E[48;5;115m' [114]=$'\E[48;5;114m' [117]=$'\E[48;5;117m' [116]=$'\E[48;5;116m' [032]=$'\E[48;5;032m' [119]=$'\E[48;5;119m' [033]=$'\E[48;5;033m' [118]=$'\E[48;5;118m' [030]=$'\E[48;5;030m' [031]=$'\E[48;5;031m' [036]=$'\E[48;5;036m' [037]=$'\E[48;5;037m' [034]=$'\E[48;5;034m' [035]=$'\E[48;5;035m' [098]=$'\E[48;5;098m' [099]=$'\E[48;5;099m' [094]=$'\E[48;5;094m' [095]=$'\E[48;5;095m' [096]=$'\E[48;5;096m' [097]=$'\E[48;5;097m' [090]=$'\E[48;5;090m' [091]=$'\E[48;5;091m' [092]=$'\E[48;5;092m' [093]=$'\E[48;5;093m' [148]=$'\E[48;5;148m' [149]=$'\E[48;5;149m' [142]=$'\E[48;5;142m' [143]=$'\E[48;5;143m' [140]=$'\E[48;5;140m' [141]=$'\E[48;5;141m' [146]=$'\E[48;5;146m' [147]=$'\E[48;5;147m' [144]=$'\E[48;5;144m' [145]=$'\E[48;5;145m' [014]=$'\E[48;5;014m' [015]=$'\E[48;5;015m' [016]=$'\E[48;5;016m' [017]=$'\E[48;5;017m' [010]=$'\E[48;5;010m' [011]=$'\E[48;5;011m' [012]=$'\E[48;5;012m' [013]=$'\E[48;5;013m' [018]=$'\E[48;5;018m' [019]=$'\E[48;5;019m' [212]=$'\E[48;5;212m' [213]=$'\E[48;5;213m' [139]=$'\E[48;5;139m' [210]=$'\E[48;5;210m' [138]=$'\E[48;5;138m' [211]=$'\E[48;5;211m' [216]=$'\E[48;5;216m' [217]=$'\E[48;5;217m' [214]=$'\E[48;5;214m' [215]=$'\E[48;5;215m' [133]=$'\E[48;5;133m' [132]=$'\E[48;5;132m' [131]=$'\E[48;5;131m' [218]=$'\E[48;5;218m' [130]=$'\E[48;5;130m' [219]=$'\E[48;5;219m' [137]=$'\E[48;5;137m' [136]=$'\E[48;5;136m' [135]=$'\E[48;5;135m' [134]=$'\E[48;5;134m' [078]=$'\E[48;5;078m' [079]=$'\E[48;5;079m' [076]=$'\E[48;5;076m' [077]=$'\E[48;5;077m' [074]=$'\E[48;5;074m' [075]=$'\E[48;5;075m' [072]=$'\E[48;5;072m' [073]=$'\E[48;5;073m' [070]=$'\E[48;5;070m' [071]=$'\E[48;5;071m' [238]=$'\E[48;5;238m' [239]=$'\E[48;5;239m' [234]=$'\E[48;5;234m' [235]=$'\E[48;5;235m' [236]=$'\E[48;5;236m' [237]=$'\E[48;5;237m' [230]=$'\E[48;5;230m' [231]=$'\E[48;5;231m' [232]=$'\E[48;5;232m' [233]=$'\E[48;5;233m' [164]=$'\E[48;5;164m' [165]=$'\E[48;5;165m' [166]=$'\E[48;5;166m' [167]=$'\E[48;5;167m' [029]=$'\E[48;5;029m' [160]=$'\E[48;5;160m' [028]=$'\E[48;5;028m' [161]=$'\E[48;5;161m' [162]=$'\E[48;5;162m' [163]=$'\E[48;5;163m' [025]=$'\E[48;5;025m' [024]=$'\E[48;5;024m' [027]=$'\E[48;5;027m' [026]=$'\E[48;5;026m' [021]=$'\E[48;5;021m' [168]=$'\E[48;5;168m' [020]=$'\E[48;5;020m' [169]=$'\E[48;5;169m' [023]=$'\E[48;5;023m' [022]=$'\E[48;5;022m' [186]=$'\E[48;5;186m' [187]=$'\E[48;5;187m' [184]=$'\E[48;5;184m' [185]=$'\E[48;5;185m' [182]=$'\E[48;5;182m' [183]=$'\E[48;5;183m' [089]=$'\E[48;5;089m' [180]=$'\E[48;5;180m' [088]=$'\E[48;5;088m' [181]=$'\E[48;5;181m' [087]=$'\E[48;5;087m' [086]=$'\E[48;5;086m' [085]=$'\E[48;5;085m' [084]=$'\E[48;5;084m' [083]=$'\E[48;5;083m' [082]=$'\E[48;5;082m' [081]=$'\E[48;5;081m' [188]=$'\E[48;5;188m' [080]=$'\E[48;5;080m' [189]=$'\E[48;5;189m' [007]=$'\E[48;5;007m' [006]=$'\E[48;5;006m' [005]=$'\E[48;5;005m' [004]=$'\E[48;5;004m' [003]=$'\E[48;5;003m' [002]=$'\E[48;5;002m' [001]=$'\E[48;5;001m' [000]=$'\E[48;5;000m' [009]=$'\E[48;5;009m' [008]=$'\E[48;5;008m' [205]=$'\E[48;5;205m' [204]=$'\E[48;5;204m' [207]=$'\E[48;5;207m' [206]=$'\E[48;5;206m' [201]=$'\E[48;5;201m' [200]=$'\E[48;5;200m' [108]=$'\E[48;5;108m' [203]=$'\E[48;5;203m' [109]=$'\E[48;5;109m' [202]=$'\E[48;5;202m' [106]=$'\E[48;5;106m' [107]=$'\E[48;5;107m' [104]=$'\E[48;5;104m' [105]=$'\E[48;5;105m' [102]=$'\E[48;5;102m' [209]=$'\E[48;5;209m' [103]=$'\E[48;5;103m' [208]=$'\E[48;5;208m' [100]=$'\E[48;5;100m' [101]=$'\E[48;5;101m' [159]=$'\E[48;5;159m' [158]=$'\E[48;5;158m' [155]=$'\E[48;5;155m' [154]=$'\E[48;5;154m' [157]=$'\E[48;5;157m' [156]=$'\E[48;5;156m' [151]=$'\E[48;5;151m' [150]=$'\E[48;5;150m' [153]=$'\E[48;5;153m' [152]=$'\E[48;5;152m' [058]=$'\E[48;5;058m' [059]=$'\E[48;5;059m' [050]=$'\E[48;5;050m' [051]=$'\E[48;5;051m' [052]=$'\E[48;5;052m' [053]=$'\E[48;5;053m' [054]=$'\E[48;5;054m' [055]=$'\E[48;5;055m' [056]=$'\E[48;5;056m' [057]=$'\E[48;5;057m' [254]=$'\E[48;5;254m' [255]=$'\E[48;5;255m' [252]=$'\E[48;5;252m' [253]=$'\E[48;5;253m' [250]=$'\E[48;5;250m' [251]=$'\E[48;5;251m' [229]=$'\E[48;5;229m' [228]=$'\E[48;5;228m' [227]=$'\E[48;5;227m' [226]=$'\E[48;5;226m' [225]=$'\E[48;5;225m' [224]=$'\E[48;5;224m' [223]=$'\E[48;5;223m' [222]=$'\E[48;5;222m' [221]=$'\E[48;5;221m' [220]=$'\E[48;5;220m' [177]=$'\E[48;5;177m' [176]=$'\E[48;5;176m' [175]=$'\E[48;5;175m' [174]=$'\E[48;5;174m' [173]=$'\E[48;5;173m' [172]=$'\E[48;5;172m' [171]=$'\E[48;5;171m' [170]=$'\E[48;5;170m' [179]=$'\E[48;5;179m' [178]=$'\E[48;5;178m' [199]=$'\E[48;5;199m' [198]=$'\E[48;5;198m' [191]=$'\E[48;5;191m' [190]=$'\E[48;5;190m' [193]=$'\E[48;5;193m' [192]=$'\E[48;5;192m' [195]=$'\E[48;5;195m' [194]=$'\E[48;5;194m' [197]=$'\E[48;5;197m' [196]=$'\E[48;5;196m' [061]=$'\E[48;5;061m' [060]=$'\E[48;5;060m' [063]=$'\E[48;5;063m' [062]=$'\E[48;5;062m' [065]=$'\E[48;5;065m' [064]=$'\E[48;5;064m' [067]=$'\E[48;5;067m' [066]=$'\E[48;5;066m' [069]=$'\E[48;5;069m' [068]=$'\E[48;5;068m' [128]=$'\E[48;5;128m' [129]=$'\E[48;5;129m' [120]=$'\E[48;5;120m' [121]=$'\E[48;5;121m' [122]=$'\E[48;5;122m' [123]=$'\E[48;5;123m' [124]=$'\E[48;5;124m' [125]=$'\E[48;5;125m' [126]=$'\E[48;5;126m' [127]=$'\E[48;5;127m' )
CDPATH=.
CHRUBY_THEME_PROMPT_PREFIX=' |'
CHRUBY_THEME_PROMPT_SUFFIX='|'
CLOCK_CHAR_THEME_PROMPT_PREFIX=
CLOCK_CHAR_THEME_PROMPT_SUFFIX=
CLOCK_THEME_PROMPT_PREFIX=
CLOCK_THEME_PROMPT_SUFFIX=
COLORTERM=truecolor
COLUMNS=254
COMP_WORDBREAKS=$' \t\n"\'><=;|&(:'
CONDAENV_THEME_PROMPT_PREFIX=' |'
CONDAENV_THEME_PROMPT_SUFFIX='|'
DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
DENO_INSTALL=/home/william/.deno
DESKTOP_SESSION=ubuntu
DIRSTACK=()
DISPLAY=:0
DOTNET_BUNDLE_EXTRACT_BASE_DIR=/home/william/.cache/dotnet_bundle_extract
EUID=1000
FG=([049]=$'\E[38;5;049m' [048]=$'\E[38;5;048m' [043]=$'\E[38;5;043m' [042]=$'\E[38;5;042m' [041]=$'\E[38;5;041m' [040]=$'\E[38;5;040m' [047]=$'\E[38;5;047m' [046]=$'\E[38;5;046m' [045]=$'\E[38;5;045m' [044]=$'\E[38;5;044m' [249]=$'\E[38;5;249m' [248]=$'\E[38;5;248m' [241]=$'\E[38;5;241m' [240]=$'\E[38;5;240m' [243]=$'\E[38;5;243m' [242]=$'\E[38;5;242m' [245]=$'\E[38;5;245m' [244]=$'\E[38;5;244m' [247]=$'\E[38;5;247m' [246]=$'\E[38;5;246m' [111]=$'\E[38;5;111m' [110]=$'\E[38;5;110m' [038]=$'\E[38;5;038m' [113]=$'\E[38;5;113m' [039]=$'\E[38;5;039m' [112]=$'\E[38;5;112m' [115]=$'\E[38;5;115m' [114]=$'\E[38;5;114m' [117]=$'\E[38;5;117m' [116]=$'\E[38;5;116m' [032]=$'\E[38;5;032m' [119]=$'\E[38;5;119m' [033]=$'\E[38;5;033m' [118]=$'\E[38;5;118m' [030]=$'\E[38;5;030m' [031]=$'\E[38;5;031m' [036]=$'\E[38;5;036m' [037]=$'\E[38;5;037m' [034]=$'\E[38;5;034m' [035]=$'\E[38;5;035m' [098]=$'\E[38;5;098m' [099]=$'\E[38;5;099m' [094]=$'\E[38;5;094m' [095]=$'\E[38;5;095m' [096]=$'\E[38;5;096m' [097]=$'\E[38;5;097m' [090]=$'\E[38;5;090m' [091]=$'\E[38;5;091m' [092]=$'\E[38;5;092m' [093]=$'\E[38;5;093m' [148]=$'\E[38;5;148m' [149]=$'\E[38;5;149m' [142]=$'\E[38;5;142m' [143]=$'\E[38;5;143m' [140]=$'\E[38;5;140m' [141]=$'\E[38;5;141m' [146]=$'\E[38;5;146m' [147]=$'\E[38;5;147m' [144]=$'\E[38;5;144m' [145]=$'\E[38;5;145m' [014]=$'\E[38;5;014m' [015]=$'\E[38;5;015m' [016]=$'\E[38;5;016m' [017]=$'\E[38;5;017m' [010]=$'\E[38;5;010m' [011]=$'\E[38;5;011m' [012]=$'\E[38;5;012m' [013]=$'\E[38;5;013m' [018]=$'\E[38;5;018m' [019]=$'\E[38;5;019m' [212]=$'\E[38;5;212m' [213]=$'\E[38;5;213m' [139]=$'\E[38;5;139m' [210]=$'\E[38;5;210m' [138]=$'\E[38;5;138m' [211]=$'\E[38;5;211m' [216]=$'\E[38;5;216m' [217]=$'\E[38;5;217m' [214]=$'\E[38;5;214m' [215]=$'\E[38;5;215m' [133]=$'\E[38;5;133m' [132]=$'\E[38;5;132m' [131]=$'\E[38;5;131m' [218]=$'\E[38;5;218m' [130]=$'\E[38;5;130m' [219]=$'\E[38;5;219m' [137]=$'\E[38;5;137m' [136]=$'\E[38;5;136m' [135]=$'\E[38;5;135m' [134]=$'\E[38;5;134m' [078]=$'\E[38;5;078m' [079]=$'\E[38;5;079m' [076]=$'\E[38;5;076m' [077]=$'\E[38;5;077m' [074]=$'\E[38;5;074m' [075]=$'\E[38;5;075m' [072]=$'\E[38;5;072m' [073]=$'\E[38;5;073m' [070]=$'\E[38;5;070m' [071]=$'\E[38;5;071m' [238]=$'\E[38;5;238m' [239]=$'\E[38;5;239m' [234]=$'\E[38;5;234m' [235]=$'\E[38;5;235m' [236]=$'\E[38;5;236m' [237]=$'\E[38;5;237m' [230]=$'\E[38;5;230m' [231]=$'\E[38;5;231m' [232]=$'\E[38;5;232m' [233]=$'\E[38;5;233m' [164]=$'\E[38;5;164m' [165]=$'\E[38;5;165m' [166]=$'\E[38;5;166m' [167]=$'\E[38;5;167m' [029]=$'\E[38;5;029m' [160]=$'\E[38;5;160m' [028]=$'\E[38;5;028m' [161]=$'\E[38;5;161m' [162]=$'\E[38;5;162m' [163]=$'\E[38;5;163m' [025]=$'\E[38;5;025m' [024]=$'\E[38;5;024m' [027]=$'\E[38;5;027m' [026]=$'\E[38;5;026m' [021]=$'\E[38;5;021m' [168]=$'\E[38;5;168m' [020]=$'\E[38;5;020m' [169]=$'\E[38;5;169m' [023]=$'\E[38;5;023m' [022]=$'\E[38;5;022m' [186]=$'\E[38;5;186m' [187]=$'\E[38;5;187m' [184]=$'\E[38;5;184m' [185]=$'\E[38;5;185m' [182]=$'\E[38;5;182m' [183]=$'\E[38;5;183m' [089]=$'\E[38;5;089m' [180]=$'\E[38;5;180m' [088]=$'\E[38;5;088m' [181]=$'\E[38;5;181m' [087]=$'\E[38;5;087m' [086]=$'\E[38;5;086m' [085]=$'\E[38;5;085m' [084]=$'\E[38;5;084m' [083]=$'\E[38;5;083m' [082]=$'\E[38;5;082m' [081]=$'\E[38;5;081m' [188]=$'\E[38;5;188m' [080]=$'\E[38;5;080m' [189]=$'\E[38;5;189m' [007]=$'\E[38;5;007m' [006]=$'\E[38;5;006m' [005]=$'\E[38;5;005m' [004]=$'\E[38;5;004m' [003]=$'\E[38;5;003m' [002]=$'\E[38;5;002m' [001]=$'\E[38;5;001m' [000]=$'\E[38;5;000m' [009]=$'\E[38;5;009m' [008]=$'\E[38;5;008m' [205]=$'\E[38;5;205m' [204]=$'\E[38;5;204m' [207]=$'\E[38;5;207m' [206]=$'\E[38;5;206m' [201]=$'\E[38;5;201m' [200]=$'\E[38;5;200m' [108]=$'\E[38;5;108m' [203]=$'\E[38;5;203m' [109]=$'\E[38;5;109m' [202]=$'\E[38;5;202m' [106]=$'\E[38;5;106m' [107]=$'\E[38;5;107m' [104]=$'\E[38;5;104m' [105]=$'\E[38;5;105m' [102]=$'\E[38;5;102m' [209]=$'\E[38;5;209m' [103]=$'\E[38;5;103m' [208]=$'\E[38;5;208m' [100]=$'\E[38;5;100m' [101]=$'\E[38;5;101m' [159]=$'\E[38;5;159m' [158]=$'\E[38;5;158m' [155]=$'\E[38;5;155m' [154]=$'\E[38;5;154m' [157]=$'\E[38;5;157m' [156]=$'\E[38;5;156m' [151]=$'\E[38;5;151m' [150]=$'\E[38;5;150m' [153]=$'\E[38;5;153m' [152]=$'\E[38;5;152m' [058]=$'\E[38;5;058m' [059]=$'\E[38;5;059m' [050]=$'\E[38;5;050m' [051]=$'\E[38;5;051m' [052]=$'\E[38;5;052m' [053]=$'\E[38;5;053m' [054]=$'\E[38;5;054m' [055]=$'\E[38;5;055m' [056]=$'\E[38;5;056m' [057]=$'\E[38;5;057m' [254]=$'\E[38;5;254m' [255]=$'\E[38;5;255m' [252]=$'\E[38;5;252m' [253]=$'\E[38;5;253m' [250]=$'\E[38;5;250m' [251]=$'\E[38;5;251m' [229]=$'\E[38;5;229m' [228]=$'\E[38;5;228m' [227]=$'\E[38;5;227m' [226]=$'\E[38;5;226m' [225]=$'\E[38;5;225m' [224]=$'\E[38;5;224m' [223]=$'\E[38;5;223m' [222]=$'\E[38;5;222m' [221]=$'\E[38;5;221m' [220]=$'\E[38;5;220m' [177]=$'\E[38;5;177m' [176]=$'\E[38;5;176m' [175]=$'\E[38;5;175m' [174]=$'\E[38;5;174m' [173]=$'\E[38;5;173m' [172]=$'\E[38;5;172m' [171]=$'\E[38;5;171m' [170]=$'\E[38;5;170m' [179]=$'\E[38;5;179m' [178]=$'\E[38;5;178m' [199]=$'\E[38;5;199m' [198]=$'\E[38;5;198m' [191]=$'\E[38;5;191m' [190]=$'\E[38;5;190m' [193]=$'\E[38;5;193m' [192]=$'\E[38;5;192m' [195]=$'\E[38;5;195m' [194]=$'\E[38;5;194m' [197]=$'\E[38;5;197m' [196]=$'\E[38;5;196m' [061]=$'\E[38;5;061m' [060]=$'\E[38;5;060m' [063]=$'\E[38;5;063m' [062]=$'\E[38;5;062m' [065]=$'\E[38;5;065m' [064]=$'\E[38;5;064m' [067]=$'\E[38;5;067m' [066]=$'\E[38;5;066m' [069]=$'\E[38;5;069m' [068]=$'\E[38;5;068m' [128]=$'\E[38;5;128m' [129]=$'\E[38;5;129m' [120]=$'\E[38;5;120m' [121]=$'\E[38;5;121m' [122]=$'\E[38;5;122m' [123]=$'\E[38;5;123m' [124]=$'\E[38;5;124m' [125]=$'\E[38;5;125m' [126]=$'\E[38;5;126m' [127]=$'\E[38;5;127m' )
FX=([reset]=$'\E[00m' [underline]=$'\E[04m' [no-underline]=$'\E[24m' [italic]=$'\E[03m' [no-blink]=$'\E[25m' [no-bold]=$'\E[22m' [bold]=$'\E[01m' [no-italic]=$'\E[23m' [blink]=$'\E[05m' [reverse]=$'\E[07m' [no-reverse]=$'\E[27m' )
GDMSESSION=ubuntu
GLOBIGNORE=
GNOME_DESKTOP_SESSION_ID=this-is-deprecated
GNOME_SETUP_DISPLAY=:1
GNOME_SHELL_SESSION_MODE=ubuntu
GNOME_TERMINAL_SCREEN=/org/gnome/Terminal/screen/4784eae4_40e9_4a07_a90d_184624876c69
GNOME_TERMINAL_SERVICE=:1.118
GOPATH=/home/william/go
GROUPS=()
GTK_MODULES=gail:atk-bridge
HISTCONTROL=erasedups:ignoreboth
HISTFILE=/home/william/.bash_history
HISTFILESIZE=
HISTIGNORE=exit:ls:bg:fg:history:clear
HISTSIZE=
HISTTIMEFORMAT='%F %T '
HOME=/home/william
HOSTNAME=william-laptop
HOSTTYPE=x86_64
IFS=$' \t\n'
IM_CONFIG_PHASE=1
LANG=en_US.UTF-8
LC_ADDRESS=sv_SE.UTF-8
LC_CTYPE=en_US.UTF-8
LC_IDENTIFICATION=sv_SE.UTF-8
LC_MEASUREMENT=sv_SE.UTF-8
LC_MONETARY=sv_SE.UTF-8
LC_NAME=sv_SE.UTF-8
LC_NUMERIC=sv_SE.UTF-8
LC_PAPER=sv_SE.UTF-8
LC_TELEPHONE=sv_SE.UTF-8
LC_TIME=sv_SE.UTF-8
LESS=-R
LESSCLOSE='/usr/bin/lesspipe %s %s'
LESSOPEN='| /usr/bin/lesspipe %s'
LIBVIRT_DEFAULT_URI=qemu:///system
LINES=60
LOGNAME=william
LSCOLORS=Gxfxcxdxdxegedabagacad
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'
MACHTYPE=x86_64-pc-linux-gnu
MAILCHECK=60
MO_ORIGINAL_COMMAND=/home/william/.oh-my-bash/lib/mo.sh
MYSQL_PS1='(\u@\h) [\d]> '
NVM_BIN=/home/william/.nvm/versions/node/v19.6.0/bin
NVM_CD_FLAGS=
NVM_DIR=/home/william/.nvm
NVM_INC=/home/william/.nvm/versions/node/v19.6.0/include/node
OLDPWD=/home/william
OMB_DIRECTORIES_CD_USE_PUSHD=false
OMB_USE_SUDO=true
OMB_VERSINFO=([0]="1" [1]="0" [2]="0" [3]="0" [4]="master" [5]="noarch")
OMB_VERSION='1.0.0(0)-master (noarch)'
OPTERR=1
OPTIND=1
OSH=/home/william/.oh-my-bash
OSH_CACHE_DIR=/home/william/.oh-my-bash/cache
OSH_CUSTOM=/home/william/.oh-my-bash/custom
OSH_SPECTRUM_TEXT='Arma virumque cano Troiae qui primus ab oris'
OSH_THEME=zork
OSTYPE=linux-gnu
PAGER=less
PATH=/usr/local/go/bin:/usr/lib/postgresql/X.Y/bin/:/home/william/.local/bin:/home/william/.cargo/bin:/home/william/.dotnet/tools:/home/william/.deno/bin:/home/william/.nvm/versions/node/v19.6.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin:/home/william/.nvm/versions/node/v19.6.0/bin###-begin-npm-completion-###
PIPESTATUS=([0]="0")
POST_1_7_2_GIT=_omb_git_post_1_7_2
PPID=4276
PREVIEW=less
PROMPT_COMMAND=([0]="starship_precmd")
PROMPT_DIRTRIM=2
PS1=$'\n\\[\E[1;36m\\]dotfiles\\[\E[0m\\] on \\[\E[1;35m\\] \\[\E[0m\\]\\[\E[1;35m\\]main\\[\E[0m\\] \n\\[\E[1;32m\\]➜\\[\E[0m\\] '
PS2=$'\\[\E[90m\\]∙\\[\E[0m\\] '
PS3='>> '
PS4='+ '
PWD=/home/william/dotfiles
PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
PYTHON_THEME_PROMPT_PREFIX=' |'
PYTHON_THEME_PROMPT_SUFFIX='|'
QT_ACCESSIBILITY=1
QT_IM_MODULE=ibus
RANDOM=21900
RBENV_THEME_PROMPT_PREFIX=' |'
RBENV_THEME_PROMPT_SUFFIX='|'
RBFU_THEME_PROMPT_PREFIX=' |'
RBFU_THEME_PROMPT_SUFFIX='|'
RUSTC_WRAPPER=
RVM_THEME_PROMPT_PREFIX=' |'
RVM_THEME_PROMPT_SUFFIX='|'
SCM_CHECK=true
SCM_GIT=git
SCM_GIT_AHEAD_CHAR=↑
SCM_GIT_BEHIND_CHAR=↓
SCM_GIT_CHAR='\[\e[32;1m\]±\[\e[0m\]'
SCM_GIT_DETACHED_CHAR=⌿
SCM_GIT_DISABLE_UNTRACKED_DIRTY=false
SCM_GIT_IGNORE_UNTRACKED=false
SCM_GIT_SHOW_CURRENT_USER=false
SCM_GIT_SHOW_DETAILS=true
SCM_GIT_SHOW_MINIMAL_INFO=false
SCM_GIT_SHOW_REMOTE_INFO=auto
SCM_GIT_STAGED_CHAR=S:
SCM_GIT_UNSTAGED_CHAR=U:
SCM_GIT_UNTRACKED_CHAR='?:'
SCM_HG=hg
SCM_HG_CHAR='\[\e[31;1m\]☿\[\e[0m\]'
SCM_NONE=NONE
SCM_NONE_CHAR=○
SCM_SVN=svn
SCM_SVN_CHAR='\[\e[36;1m\]⑆\[\e[0m\]'
SCM_THEME_BRANCH_GONE_PREFIX=' ⇢ '
SCM_THEME_BRANCH_PREFIX=
SCM_THEME_BRANCH_TRACK_PREFIX=' → '
SCM_THEME_CHAR_PREFIX=
SCM_THEME_CHAR_SUFFIX=
SCM_THEME_CURRENT_USER_PREFFIX=' ☺︎ '
SCM_THEME_CURRENT_USER_SUFFIX=
SCM_THEME_DETACHED_PREFIX=detached:
SCM_THEME_PROMPT_CLEAN=' \[\e[32;1m\]✓\[\e[0m\]'
SCM_THEME_PROMPT_DIRTY=' \[\e[31;1m\]✗\[\e[0m\]'
SCM_THEME_PROMPT_PREFIX=
SCM_THEME_PROMPT_SUFFIX=
SCM_THEME_TAG_PREFIX=tag:
SDIRS=BASHMARKS_SDIRS
SESSION_MANAGER=local/william-laptop:@/tmp/.ICE-unix/2774,unix/william-laptop:/tmp/.ICE-unix/2774
SHELL=/bin/bash
SHELLOPTS=braceexpand:emacs:hashall:histexpand:history:interactive-comments:monitor:noclobber
SHLVL=1
SHORT_HOST=
SSH_AGENT_LAUNCHER=gnome-keyring
SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
STARSHIP_CMD_STATUS=0
STARSHIP_DURATION=61
STARSHIP_END_TIME=1706860966605
STARSHIP_PIPE_STATUS=([0]="0")
STARSHIP_PREEXEC_READY=false
STARSHIP_SESSION_KEY=7660317171266820
STARSHIP_SHELL=bash
STARSHIP_START_TIME=1706861294854
SYSTEMD_EXEC_PID=2949
TERM=xterm-256color
THEME_BATTERY_PERCENTAGE_CHECK=true
THEME_PROMPT_HOST='\H'
THEME_SHOW_USER_HOST=false
TITLEBAR='\[\033]0;\w\007\]'
UID=1000
USER=william
USERNAME=william
USER_HOST_THEME_PROMPT_PREFIX=
USER_HOST_THEME_PROMPT_SUFFIX=
VIRTUALENV_THEME_PROMPT_PREFIX=' |'
VIRTUALENV_THEME_PROMPT_SUFFIX='|'
VTE_VERSION=6800
WAYLAND_DISPLAY=wayland-0
XAUTHORITY=/run/user/1000/.mutter-Xwaylandauth.1GT1H2
XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/etc/xdg
XDG_CURRENT_DESKTOP=ubuntu:GNOME
XDG_DATA_DIRS=/usr/share/ubuntu:/home/william/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop
XDG_MENU_PREFIX=gnome-
XDG_RUNTIME_DIR=/run/user/1000
XDG_SESSION_CLASS=user
XDG_SESSION_DESKTOP=ubuntu
XDG_SESSION_TYPE=wayland
XMODIFIERS=@im=ibus
_=export
_NC=$'\E(B\E[m'
_PRESERVED_PROMPT_COMMAND=_omb_util_prompt_command_hook
_RED=$'\E[31m'
__git_all_commands=
__git_am_inprogress_options='--skip --continue --resolved --abort --quit --show-current-patch'
__git_cherry_pick_inprogress_options='--continue --quit --abort --skip'
__git_cmds_with_parseopt_helper=
__git_color_moved_opts='no default plain blocks zebra dimmed-zebra'
__git_color_moved_ws_opts=$'no ignore-space-at-eol ignore-space-change\n\t\t\tignore-all-space allow-indentation-change'
__git_config_sections=
__git_config_vars=
__git_diff_algorithms='myers minimal patience histogram'
__git_diff_common_options=$'--stat --numstat --shortstat --summary\n\t\t\t--patch-with-stat --name-only --name-status --color\n\t\t\t--no-color --color-words --no-renames --check\n\t\t\t--color-moved --color-moved= --no-color-moved\n\t\t\t--color-moved-ws= --no-color-moved-ws\n\t\t\t--full-index --binary --abbrev --diff-filter=\n\t\t\t--find-copies-harder --ignore-cr-at-eol\n\t\t\t--text --ignore-space-at-eol --ignore-space-change\n\t\t\t--ignore-all-space --ignore-blank-lines --exit-code\n\t\t\t--quiet --ext-diff --no-ext-diff\n\t\t\t--no-prefix --src-prefix= --dst-prefix=\n\t\t\t--inter-hunk-context=\n\t\t\t--patience --histogram --minimal\n\t\t\t--raw --word-diff --word-diff-regex=\n\t\t\t--dirstat --dirstat= --dirstat-by-file\n\t\t\t--dirstat-by-file= --cumulative\n\t\t\t--diff-algorithm=\n\t\t\t--submodule --submodule= --ignore-submodules\n\t\t\t--indent-heuristic --no-indent-heuristic\n\t\t\t--textconv --no-textconv\n\t\t\t--patch --no-patch\n\t\t\t--anchored=\n'
__git_diff_difftool_options=$'--cached --staged --pickaxe-all --pickaxe-regex\n\t\t\t--base --ours --theirs --no-index --relative --merge-base\n\t\t\t--stat --numstat --shortstat --summary\n\t\t\t--patch-with-stat --name-only --name-status --color\n\t\t\t--no-color --color-words --no-renames --check\n\t\t\t--color-moved --color-moved= --no-color-moved\n\t\t\t--color-moved-ws= --no-color-moved-ws\n\t\t\t--full-index --binary --abbrev --diff-filter=\n\t\t\t--find-copies-harder --ignore-cr-at-eol\n\t\t\t--text --ignore-space-at-eol --ignore-space-change\n\t\t\t--ignore-all-space --ignore-blank-lines --exit-code\n\t\t\t--quiet --ext-diff --no-ext-diff\n\t\t\t--no-prefix --src-prefix= --dst-prefix=\n\t\t\t--inter-hunk-context=\n\t\t\t--patience --histogram --minimal\n\t\t\t--raw --word-diff --word-diff-regex=\n\t\t\t--dirstat --dirstat= --dirstat-by-file\n\t\t\t--dirstat-by-file= --cumulative\n\t\t\t--diff-algorithm=\n\t\t\t--submodule --submodule= --ignore-submodules\n\t\t\t--indent-heuristic --no-indent-heuristic\n\t\t\t--textconv --no-textconv\n\t\t\t--patch --no-patch\n\t\t\t--anchored=\n'
__git_diff_submodule_formats='diff log short'
__git_fetch_recurse_submodules='yes on-demand no'
__git_format_patch_extra_options=$'\n\t--full-index --not --all --no-prefix --src-prefix=\n\t--dst-prefix= --notes\n'
__git_log_common_options=$'\n\t--not --all\n\t--branches --tags --remotes\n\t--first-parent --merges --no-merges\n\t--max-count=\n\t--max-age= --since= --after=\n\t--min-age= --until= --before=\n\t--min-parents= --max-parents=\n\t--no-min-parents --no-max-parents\n'
__git_log_date_formats='relative iso8601 iso8601-strict rfc2822 short local default raw unix format:'
__git_log_gitk_options=$'\n\t--dense --sparse --full-history\n\t--simplify-merges --simplify-by-decoration\n\t--left-right --notes --no-notes\n'
__git_log_pretty_formats='oneline short medium full fuller reference email raw format: tformat: mboxrd'
__git_log_shortlog_options=$'\n\t--author= --committer= --grep=\n\t--all-match --invert-grep\n'
__git_merge_strategies=
__git_merge_strategy_options=$'ours theirs subtree subtree= patience\n\thistogram diff-algorithm= ignore-space-change ignore-all-space\n\tignore-space-at-eol renormalize no-renormalize no-renames\n\tfind-renames find-renames= rename-threshold='
__git_mergetools_common=$'diffuse diffmerge ecmerge emerge kdiff3 meld opendiff\n\t\t\ttkdiff vimdiff nvimdiff gvimdiff xxdiff araxis p4merge\n\t\t\tbc codecompare smerge\n'
__git_patchformat='mbox stgit stgit-series hg mboxrd'
__git_printf_supports_v=yes
__git_push_recurse_submodules='check on-demand only'
__git_quoted_cr='nowarn warn strip'
__git_rebase_inprogress_options='--continue --skip --abort --quit --show-current-patch'
__git_rebase_interactive_inprogress_options='--continue --skip --abort --quit --show-current-patch --edit-todo'
__git_ref_fieldlist='refname objecttype objectsize objectname upstream push HEAD symref'
__git_revert_inprogress_options='--continue --quit --abort --skip'
__git_send_email_confirm_options='always never auto cc compose'
__git_send_email_suppresscc_options='author self cc bodycc sob cccmd body all'
__git_sequencer_inprogress_options='--continue --quit --abort --skip'
__git_showcurrentpatch='diff raw'
__git_untracked_file_modes='all no normal'
__git_whitespacelist='nowarn warn error error-all fix'
_backup_glob='@(#*#|*@(~|.@(bak|orig|rej|swp|dpkg*|rpm@(orig|new|save))))'
_omb_bash_version=50116
_omb_cd_dirstack=([0]="/home/william/dotfiles" [1]="/home/william" [2]="/home/william/dotfiles/dotfiles")
_omb_deprecate_blue=$'\001\E[34m\002'
_omb_deprecate_const=()
_omb_deprecate_const_counter=()
_omb_deprecate_const_value=()
_omb_deprecate_declare=()
_omb_deprecate_declare_counter=()
_omb_deprecate_green=$'\001\E[32m\002'
_omb_deprecate_magenta=$'\001\E[35m\002'
_omb_deprecate_msg_please_use=$'Please use \'\E[1m\E[34m%s\E(B\E[m\'.'
_omb_deprecate_red=$'\001\E[31m\002'
_omb_deprecate_yellow=$'\001\E[33m\002'
_omb_git_post_1_7_2=
_omb_module_loaded=' lib:utils lib:base lib:bourne-shell lib:directories lib:functions lib:git lib:omb-prompt-colors lib:omb-deprecate lib:omb-prompt-base lib:grep lib:history lib:misc lib:mo lib:nvm lib:omb-completion lib:readlink lib:shopt lib:spectrum lib:spinner lib:theme-and-appearance plugin:git plugin:bashmarks plugin:npm plugin:nvm alias:general completion:git completion:composer completion:ssh theme:zork'
_omb_prompt_background_black='\[\e[40m\]'
_omb_prompt_background_blue='\[\e[104m\]'
_omb_prompt_background_brown='\[\e[41m\]'
_omb_prompt_background_cyan='\[\e[106m\]'
_omb_prompt_background_gray='\[\e[100m\]'
_omb_prompt_background_green='\[\e[42m\]'
_omb_prompt_background_lime='\[\e[102m\]'
_omb_prompt_background_magenta='\[\e[105m\]'
_omb_prompt_background_navy='\[\e[44m\]'
_omb_prompt_background_olive='\[\e[43m\]'
_omb_prompt_background_purple='\[\e[45m\]'
_omb_prompt_background_red='\[\e[101m\]'
_omb_prompt_background_silver='\[\e[47m\]'
_omb_prompt_background_teal='\[\e[46m\]'
_omb_prompt_background_white='\[\e[107m\]'
_omb_prompt_background_yellow='\[\e[103m\]'
_omb_prompt_black='\[\e[0;30m\]'
_omb_prompt_blue='\[\e[0;94m\]'
_omb_prompt_bold='\[\e[1m\]'
_omb_prompt_bold_black='\[\e[30;1m\]'
_omb_prompt_bold_blue='\[\e[94;1m\]'
_omb_prompt_bold_brown='\[\e[31;1m\]'
_omb_prompt_bold_cyan='\[\e[96;1m\]'
_omb_prompt_bold_gray='\[\e[90;1m\]'
_omb_prompt_bold_green='\[\e[32;1m\]'
_omb_prompt_bold_lime='\[\e[92;1m\]'
_omb_prompt_bold_magenta='\[\e[95;1m\]'
_omb_prompt_bold_navy='\[\e[34;1m\]'
_omb_prompt_bold_olive='\[\e[33;1m\]'
_omb_prompt_bold_purple='\[\e[35;1m\]'
_omb_prompt_bold_red='\[\e[91;1m\]'
_omb_prompt_bold_silver='\[\e[37;1m\]'
_omb_prompt_bold_teal='\[\e[36;1m\]'
_omb_prompt_bold_white='\[\e[97;1m\]'
_omb_prompt_bold_yellow='\[\e[93;1m\]'
_omb_prompt_brown='\[\e[0;31m\]'
_omb_prompt_cyan='\[\e[0;96m\]'
_omb_prompt_gray='\[\e[0;90m\]'
_omb_prompt_green='\[\e[0;32m\]'
_omb_prompt_lime='\[\e[0;92m\]'
_omb_prompt_magenta='\[\e[0;95m\]'
_omb_prompt_navy='\[\e[0;34m\]'
_omb_prompt_normal='\[\e[0m\]'
_omb_prompt_olive='\[\e[0;33m\]'
_omb_prompt_purple='\[\e[0;35m\]'
_omb_prompt_red='\[\e[0;91m\]'
_omb_prompt_reset_color='\[\e[39m\]'
_omb_prompt_silver='\[\e[0;37m\]'
_omb_prompt_teal='\[\e[0;36m\]'
_omb_prompt_underline_black='\[\e[30;4m\]'
_omb_prompt_underline_blue='\[\e[94;4m\]'
_omb_prompt_underline_brown='\[\e[31;4m\]'
_omb_prompt_underline_cyan='\[\e[96;4m\]'
_omb_prompt_underline_gray='\[\e[90;4m\]'
_omb_prompt_underline_green='\[\e[32;4m\]'
_omb_prompt_underline_lime='\[\e[92;4m\]'
_omb_prompt_underline_magenta='\[\e[95;4m\]'
_omb_prompt_underline_navy='\[\e[34;4m\]'
_omb_prompt_underline_olive='\[\e[33;4m\]'
_omb_prompt_underline_purple='\[\e[35;4m\]'
_omb_prompt_underline_red='\[\e[91;4m\]'
_omb_prompt_underline_silver='\[\e[37;4m\]'
_omb_prompt_underline_teal='\[\e[36;4m\]'
_omb_prompt_underline_white='\[\e[97;4m\]'
_omb_prompt_underline_yellow='\[\e[93;4m\]'
_omb_prompt_white='\[\e[0;97m\]'
_omb_prompt_yellow='\[\e[0;93m\]'
_omb_spectrum_bg=([049]=$'\E[48;5;049m' [048]=$'\E[48;5;048m' [043]=$'\E[48;5;043m' [042]=$'\E[48;5;042m' [041]=$'\E[48;5;041m' [040]=$'\E[48;5;040m' [047]=$'\E[48;5;047m' [046]=$'\E[48;5;046m' [045]=$'\E[48;5;045m' [044]=$'\E[48;5;044m' [249]=$'\E[48;5;249m' [248]=$'\E[48;5;248m' [241]=$'\E[48;5;241m' [240]=$'\E[48;5;240m' [243]=$'\E[48;5;243m' [242]=$'\E[48;5;242m' [245]=$'\E[48;5;245m' [244]=$'\E[48;5;244m' [247]=$'\E[48;5;247m' [246]=$'\E[48;5;246m' [111]=$'\E[48;5;111m' [110]=$'\E[48;5;110m' [113]=$'\E[48;5;113m' [038]=$'\E[48;5;038m' [112]=$'\E[48;5;112m' [039]=$'\E[48;5;039m' [115]=$'\E[48;5;115m' [114]=$'\E[48;5;114m' [117]=$'\E[48;5;117m' [116]=$'\E[48;5;116m' [119]=$'\E[48;5;119m' [032]=$'\E[48;5;032m' [118]=$'\E[48;5;118m' [033]=$'\E[48;5;033m' [030]=$'\E[48;5;030m' [031]=$'\E[48;5;031m' [036]=$'\E[48;5;036m' [037]=$'\E[48;5;037m' [034]=$'\E[48;5;034m' [035]=$'\E[48;5;035m' [098]=$'\E[48;5;098m' [099]=$'\E[48;5;099m' [094]=$'\E[48;5;094m' [095]=$'\E[48;5;095m' [096]=$'\E[48;5;096m' [097]=$'\E[48;5;097m' [090]=$'\E[48;5;090m' [091]=$'\E[48;5;091m' [092]=$'\E[48;5;092m' [093]=$'\E[48;5;093m' [148]=$'\E[48;5;148m' [149]=$'\E[48;5;149m' [142]=$'\E[48;5;142m' [143]=$'\E[48;5;143m' [140]=$'\E[48;5;140m' [141]=$'\E[48;5;141m' [146]=$'\E[48;5;146m' [147]=$'\E[48;5;147m' [144]=$'\E[48;5;144m' [145]=$'\E[48;5;145m' [014]=$'\E[48;5;014m' [015]=$'\E[48;5;015m' [016]=$'\E[48;5;016m' [017]=$'\E[48;5;017m' [010]=$'\E[48;5;010m' [011]=$'\E[48;5;011m' [012]=$'\E[48;5;012m' [013]=$'\E[48;5;013m' [018]=$'\E[48;5;018m' [019]=$'\E[48;5;019m' [212]=$'\E[48;5;212m' [213]=$'\E[48;5;213m' [210]=$'\E[48;5;210m' [139]=$'\E[48;5;139m' [211]=$'\E[48;5;211m' [138]=$'\E[48;5;138m' [216]=$'\E[48;5;216m' [217]=$'\E[48;5;217m' [214]=$'\E[48;5;214m' [215]=$'\E[48;5;215m' [133]=$'\E[48;5;133m' [132]=$'\E[48;5;132m' [218]=$'\E[48;5;218m' [131]=$'\E[48;5;131m' [219]=$'\E[48;5;219m' [130]=$'\E[48;5;130m' [137]=$'\E[48;5;137m' [136]=$'\E[48;5;136m' [135]=$'\E[48;5;135m' [134]=$'\E[48;5;134m' [078]=$'\E[48;5;078m' [079]=$'\E[48;5;079m' [076]=$'\E[48;5;076m' [077]=$'\E[48;5;077m' [074]=$'\E[48;5;074m' [075]=$'\E[48;5;075m' [072]=$'\E[48;5;072m' [073]=$'\E[48;5;073m' [070]=$'\E[48;5;070m' [071]=$'\E[48;5;071m' [238]=$'\E[48;5;238m' [239]=$'\E[48;5;239m' [234]=$'\E[48;5;234m' [235]=$'\E[48;5;235m' [236]=$'\E[48;5;236m' [237]=$'\E[48;5;237m' [230]=$'\E[48;5;230m' [231]=$'\E[48;5;231m' [232]=$'\E[48;5;232m' [233]=$'\E[48;5;233m' [164]=$'\E[48;5;164m' [165]=$'\E[48;5;165m' [166]=$'\E[48;5;166m' [167]=$'\E[48;5;167m' [160]=$'\E[48;5;160m' [029]=$'\E[48;5;029m' [161]=$'\E[48;5;161m' [028]=$'\E[48;5;028m' [162]=$'\E[48;5;162m' [163]=$'\E[48;5;163m' [025]=$'\E[48;5;025m' [024]=$'\E[48;5;024m' [027]=$'\E[48;5;027m' [026]=$'\E[48;5;026m' [168]=$'\E[48;5;168m' [021]=$'\E[48;5;021m' [169]=$'\E[48;5;169m' [020]=$'\E[48;5;020m' [023]=$'\E[48;5;023m' [022]=$'\E[48;5;022m' [186]=$'\E[48;5;186m' [187]=$'\E[48;5;187m' [184]=$'\E[48;5;184m' [185]=$'\E[48;5;185m' [182]=$'\E[48;5;182m' [183]=$'\E[48;5;183m' [180]=$'\E[48;5;180m' [089]=$'\E[48;5;089m' [181]=$'\E[48;5;181m' [088]=$'\E[48;5;088m' [087]=$'\E[48;5;087m' [086]=$'\E[48;5;086m' [085]=$'\E[48;5;085m' [084]=$'\E[48;5;084m' [083]=$'\E[48;5;083m' [082]=$'\E[48;5;082m' [188]=$'\E[48;5;188m' [081]=$'\E[48;5;081m' [189]=$'\E[48;5;189m' [080]=$'\E[48;5;080m' [007]=$'\E[48;5;007m' [006]=$'\E[48;5;006m' [005]=$'\E[48;5;005m' [004]=$'\E[48;5;004m' [003]=$'\E[48;5;003m' [002]=$'\E[48;5;002m' [001]=$'\E[48;5;001m' [000]=$'\E[48;5;000m' [009]=$'\E[48;5;009m' [008]=$'\E[48;5;008m' [205]=$'\E[48;5;205m' [204]=$'\E[48;5;204m' [207]=$'\E[48;5;207m' [206]=$'\E[48;5;206m' [201]=$'\E[48;5;201m' [200]=$'\E[48;5;200m' [203]=$'\E[48;5;203m' [108]=$'\E[48;5;108m' [202]=$'\E[48;5;202m' [109]=$'\E[48;5;109m' [106]=$'\E[48;5;106m' [107]=$'\E[48;5;107m' [104]=$'\E[48;5;104m' [105]=$'\E[48;5;105m' [209]=$'\E[48;5;209m' [102]=$'\E[48;5;102m' [208]=$'\E[48;5;208m' [103]=$'\E[48;5;103m' [100]=$'\E[48;5;100m' [101]=$'\E[48;5;101m' [159]=$'\E[48;5;159m' [158]=$'\E[48;5;158m' [155]=$'\E[48;5;155m' [154]=$'\E[48;5;154m' [157]=$'\E[48;5;157m' [156]=$'\E[48;5;156m' [151]=$'\E[48;5;151m' [150]=$'\E[48;5;150m' [153]=$'\E[48;5;153m' [152]=$'\E[48;5;152m' [058]=$'\E[48;5;058m' [059]=$'\E[48;5;059m' [050]=$'\E[48;5;050m' [051]=$'\E[48;5;051m' [052]=$'\E[48;5;052m' [053]=$'\E[48;5;053m' [054]=$'\E[48;5;054m' [055]=$'\E[48;5;055m' [056]=$'\E[48;5;056m' [057]=$'\E[48;5;057m' [254]=$'\E[48;5;254m' [255]=$'\E[48;5;255m' [252]=$'\E[48;5;252m' [253]=$'\E[48;5;253m' [250]=$'\E[48;5;250m' [251]=$'\E[48;5;251m' [229]=$'\E[48;5;229m' [228]=$'\E[48;5;228m' [227]=$'\E[48;5;227m' [226]=$'\E[48;5;226m' [225]=$'\E[48;5;225m' [224]=$'\E[48;5;224m' [223]=$'\E[48;5;223m' [222]=$'\E[48;5;222m' [221]=$'\E[48;5;221m' [220]=$'\E[48;5;220m' [177]=$'\E[48;5;177m' [176]=$'\E[48;5;176m' [175]=$'\E[48;5;175m' [174]=$'\E[48;5;174m' [173]=$'\E[48;5;173m' [172]=$'\E[48;5;172m' [171]=$'\E[48;5;171m' [170]=$'\E[48;5;170m' [179]=$'\E[48;5;179m' [178]=$'\E[48;5;178m' [199]=$'\E[48;5;199m' [198]=$'\E[48;5;198m' [191]=$'\E[48;5;191m' [190]=$'\E[48;5;190m' [193]=$'\E[48;5;193m' [192]=$'\E[48;5;192m' [195]=$'\E[48;5;195m' [194]=$'\E[48;5;194m' [197]=$'\E[48;5;197m' [196]=$'\E[48;5;196m' [061]=$'\E[48;5;061m' [060]=$'\E[48;5;060m' [063]=$'\E[48;5;063m' [062]=$'\E[48;5;062m' [065]=$'\E[48;5;065m' [064]=$'\E[48;5;064m' [067]=$'\E[48;5;067m' [066]=$'\E[48;5;066m' [069]=$'\E[48;5;069m' [068]=$'\E[48;5;068m' [128]=$'\E[48;5;128m' [129]=$'\E[48;5;129m' [120]=$'\E[48;5;120m' [121]=$'\E[48;5;121m' [122]=$'\E[48;5;122m' [123]=$'\E[48;5;123m' [124]=$'\E[48;5;124m' [125]=$'\E[48;5;125m' [126]=$'\E[48;5;126m' [127]=$'\E[48;5;127m' )
_omb_spectrum_fg=([049]=$'\E[38;5;049m' [048]=$'\E[38;5;048m' [043]=$'\E[38;5;043m' [042]=$'\E[38;5;042m' [041]=$'\E[38;5;041m' [040]=$'\E[38;5;040m' [047]=$'\E[38;5;047m' [046]=$'\E[38;5;046m' [045]=$'\E[38;5;045m' [044]=$'\E[38;5;044m' [249]=$'\E[38;5;249m' [248]=$'\E[38;5;248m' [241]=$'\E[38;5;241m' [240]=$'\E[38;5;240m' [243]=$'\E[38;5;243m' [242]=$'\E[38;5;242m' [245]=$'\E[38;5;245m' [244]=$'\E[38;5;244m' [247]=$'\E[38;5;247m' [246]=$'\E[38;5;246m' [111]=$'\E[38;5;111m' [110]=$'\E[38;5;110m' [113]=$'\E[38;5;113m' [038]=$'\E[38;5;038m' [112]=$'\E[38;5;112m' [039]=$'\E[38;5;039m' [115]=$'\E[38;5;115m' [114]=$'\E[38;5;114m' [117]=$'\E[38;5;117m' [116]=$'\E[38;5;116m' [119]=$'\E[38;5;119m' [032]=$'\E[38;5;032m' [118]=$'\E[38;5;118m' [033]=$'\E[38;5;033m' [030]=$'\E[38;5;030m' [031]=$'\E[38;5;031m' [036]=$'\E[38;5;036m' [037]=$'\E[38;5;037m' [034]=$'\E[38;5;034m' [035]=$'\E[38;5;035m' [098]=$'\E[38;5;098m' [099]=$'\E[38;5;099m' [094]=$'\E[38;5;094m' [095]=$'\E[38;5;095m' [096]=$'\E[38;5;096m' [097]=$'\E[38;5;097m' [090]=$'\E[38;5;090m' [091]=$'\E[38;5;091m' [092]=$'\E[38;5;092m' [093]=$'\E[38;5;093m' [148]=$'\E[38;5;148m' [149]=$'\E[38;5;149m' [142]=$'\E[38;5;142m' [143]=$'\E[38;5;143m' [140]=$'\E[38;5;140m' [141]=$'\E[38;5;141m' [146]=$'\E[38;5;146m' [147]=$'\E[38;5;147m' [144]=$'\E[38;5;144m' [145]=$'\E[38;5;145m' [014]=$'\E[38;5;014m' [015]=$'\E[38;5;015m' [016]=$'\E[38;5;016m' [017]=$'\E[38;5;017m' [010]=$'\E[38;5;010m' [011]=$'\E[38;5;011m' [012]=$'\E[38;5;012m' [013]=$'\E[38;5;013m' [018]=$'\E[38;5;018m' [019]=$'\E[38;5;019m' [212]=$'\E[38;5;212m' [213]=$'\E[38;5;213m' [210]=$'\E[38;5;210m' [139]=$'\E[38;5;139m' [211]=$'\E[38;5;211m' [138]=$'\E[38;5;138m' [216]=$'\E[38;5;216m' [217]=$'\E[38;5;217m' [214]=$'\E[38;5;214m' [215]=$'\E[38;5;215m' [133]=$'\E[38;5;133m' [132]=$'\E[38;5;132m' [218]=$'\E[38;5;218m' [131]=$'\E[38;5;131m' [219]=$'\E[38;5;219m' [130]=$'\E[38;5;130m' [137]=$'\E[38;5;137m' [136]=$'\E[38;5;136m' [135]=$'\E[38;5;135m' [134]=$'\E[38;5;134m' [078]=$'\E[38;5;078m' [079]=$'\E[38;5;079m' [076]=$'\E[38;5;076m' [077]=$'\E[38;5;077m' [074]=$'\E[38;5;074m' [075]=$'\E[38;5;075m' [072]=$'\E[38;5;072m' [073]=$'\E[38;5;073m' [070]=$'\E[38;5;070m' [071]=$'\E[38;5;071m' [238]=$'\E[38;5;238m' [239]=$'\E[38;5;239m' [234]=$'\E[38;5;234m' [235]=$'\E[38;5;235m' [236]=$'\E[38;5;236m' [237]=$'\E[38;5;237m' [230]=$'\E[38;5;230m' [231]=$'\E[38;5;231m' [232]=$'\E[38;5;232m' [233]=$'\E[38;5;233m' [164]=$'\E[38;5;164m' [165]=$'\E[38;5;165m' [166]=$'\E[38;5;166m' [167]=$'\E[38;5;167m' [160]=$'\E[38;5;160m' [029]=$'\E[38;5;029m' [161]=$'\E[38;5;161m' [028]=$'\E[38;5;028m' [162]=$'\E[38;5;162m' [163]=$'\E[38;5;163m' [025]=$'\E[38;5;025m' [024]=$'\E[38;5;024m' [027]=$'\E[38;5;027m' [026]=$'\E[38;5;026m' [168]=$'\E[38;5;168m' [021]=$'\E[38;5;021m' [169]=$'\E[38;5;169m' [020]=$'\E[38;5;020m' [023]=$'\E[38;5;023m' [022]=$'\E[38;5;022m' [186]=$'\E[38;5;186m' [187]=$'\E[38;5;187m' [184]=$'\E[38;5;184m' [185]=$'\E[38;5;185m' [182]=$'\E[38;5;182m' [183]=$'\E[38;5;183m' [180]=$'\E[38;5;180m' [089]=$'\E[38;5;089m' [181]=$'\E[38;5;181m' [088]=$'\E[38;5;088m' [087]=$'\E[38;5;087m' [086]=$'\E[38;5;086m' [085]=$'\E[38;5;085m' [084]=$'\E[38;5;084m' [083]=$'\E[38;5;083m' [082]=$'\E[38;5;082m' [188]=$'\E[38;5;188m' [081]=$'\E[38;5;081m' [189]=$'\E[38;5;189m' [080]=$'\E[38;5;080m' [007]=$'\E[38;5;007m' [006]=$'\E[38;5;006m' [005]=$'\E[38;5;005m' [004]=$'\E[38;5;004m' [003]=$'\E[38;5;003m' [002]=$'\E[38;5;002m' [001]=$'\E[38;5;001m' [000]=$'\E[38;5;000m' [009]=$'\E[38;5;009m' [008]=$'\E[38;5;008m' [205]=$'\E[38;5;205m' [204]=$'\E[38;5;204m' [207]=$'\E[38;5;207m' [206]=$'\E[38;5;206m' [201]=$'\E[38;5;201m' [200]=$'\E[38;5;200m' [203]=$'\E[38;5;203m' [108]=$'\E[38;5;108m' [202]=$'\E[38;5;202m' [109]=$'\E[38;5;109m' [106]=$'\E[38;5;106m' [107]=$'\E[38;5;107m' [104]=$'\E[38;5;104m' [105]=$'\E[38;5;105m' [209]=$'\E[38;5;209m' [102]=$'\E[38;5;102m' [208]=$'\E[38;5;208m' [103]=$'\E[38;5;103m' [100]=$'\E[38;5;100m' [101]=$'\E[38;5;101m' [159]=$'\E[38;5;159m' [158]=$'\E[38;5;158m' [155]=$'\E[38;5;155m' [154]=$'\E[38;5;154m' [157]=$'\E[38;5;157m' [156]=$'\E[38;5;156m' [151]=$'\E[38;5;151m' [150]=$'\E[38;5;150m' [153]=$'\E[38;5;153m' [152]=$'\E[38;5;152m' [058]=$'\E[38;5;058m' [059]=$'\E[38;5;059m' [050]=$'\E[38;5;050m' [051]=$'\E[38;5;051m' [052]=$'\E[38;5;052m' [053]=$'\E[38;5;053m' [054]=$'\E[38;5;054m' [055]=$'\E[38;5;055m' [056]=$'\E[38;5;056m' [057]=$'\E[38;5;057m' [254]=$'\E[38;5;254m' [255]=$'\E[38;5;255m' [252]=$'\E[38;5;252m' [253]=$'\E[38;5;253m' [250]=$'\E[38;5;250m' [251]=$'\E[38;5;251m' [229]=$'\E[38;5;229m' [228]=$'\E[38;5;228m' [227]=$'\E[38;5;227m' [226]=$'\E[38;5;226m' [225]=$'\E[38;5;225m' [224]=$'\E[38;5;224m' [223]=$'\E[38;5;223m' [222]=$'\E[38;5;222m' [221]=$'\E[38;5;221m' [220]=$'\E[38;5;220m' [177]=$'\E[38;5;177m' [176]=$'\E[38;5;176m' [175]=$'\E[38;5;175m' [174]=$'\E[38;5;174m' [173]=$'\E[38;5;173m' [172]=$'\E[38;5;172m' [171]=$'\E[38;5;171m' [170]=$'\E[38;5;170m' [179]=$'\E[38;5;179m' [178]=$'\E[38;5;178m' [199]=$'\E[38;5;199m' [198]=$'\E[38;5;198m' [191]=$'\E[38;5;191m' [190]=$'\E[38;5;190m' [193]=$'\E[38;5;193m' [192]=$'\E[38;5;192m' [195]=$'\E[38;5;195m' [194]=$'\E[38;5;194m' [197]=$'\E[38;5;197m' [196]=$'\E[38;5;196m' [061]=$'\E[38;5;061m' [060]=$'\E[38;5;060m' [063]=$'\E[38;5;063m' [062]=$'\E[38;5;062m' [065]=$'\E[38;5;065m' [064]=$'\E[38;5;064m' [067]=$'\E[38;5;067m' [066]=$'\E[38;5;066m' [069]=$'\E[38;5;069m' [068]=$'\E[38;5;068m' [128]=$'\E[38;5;128m' [129]=$'\E[38;5;129m' [120]=$'\E[38;5;120m' [121]=$'\E[38;5;121m' [122]=$'\E[38;5;122m' [123]=$'\E[38;5;123m' [124]=$'\E[38;5;124m' [125]=$'\E[38;5;125m' [126]=$'\E[38;5;126m' [127]=$'\E[38;5;127m' )
_omb_spectrum_fx=([reset]=$'\E[00m' [underline]=$'\E[04m' [no-underline]=$'\E[24m' [italic]=$'\E[03m' [no-blink]=$'\E[25m' [no-bold]=$'\E[22m' [bold]=$'\E[01m' [no-italic]=$'\E[23m' [blink]=$'\E[05m' [reverse]=$'\E[07m' [no-reverse]=$'\E[27m' )
_omb_term_background_black=$'\E[40m'
_omb_term_background_blue=$'\E[44m\E[104m'
_omb_term_background_brown=$'\E[41m'
_omb_term_background_cyan=$'\E[46m\E[106m'
_omb_term_background_gray=$'\E[40m\E[100m'
_omb_term_background_green=$'\E[42m'
_omb_term_background_lime=$'\E[42m\E[102m'
_omb_term_background_magenta=$'\E[45m\E[105m'
_omb_term_background_navy=$'\E[44m'
_omb_term_background_olive=$'\E[43m'
_omb_term_background_purple=$'\E[45m'
_omb_term_background_red=$'\E[41m\E[101m'
_omb_term_background_silver=$'\E[47m'
_omb_term_background_teal=$'\E[46m'
_omb_term_background_violet=$'\E[48;5;171m'
_omb_term_background_white=$'\E[47m\E[107m'
_omb_term_background_yellow=$'\E[43m\E[103m'
_omb_term_black=$'\E[30m'
_omb_term_blue=$'\E[94m'
_omb_term_bold=$'\E[1m'
_omb_term_bold_black=$'\E[1m\E[30m'
_omb_term_bold_blue=$'\E[1m\E[94m'
_omb_term_bold_brown=$'\E[1m\E[31m'
_omb_term_bold_cyan=$'\E[1m\E[96m'
_omb_term_bold_gray=$'\E[1m\E[90m'
_omb_term_bold_green=$'\E[1m\E[32m'
_omb_term_bold_lime=$'\E[1m\E[92m'
_omb_term_bold_magenta=$'\E[1m\E[95m'
_omb_term_bold_navy=$'\E[1m\E[34m'
_omb_term_bold_olive=$'\E[1m\E[33m'
_omb_term_bold_purple=$'\E[1m\E[35m'
_omb_term_bold_red=$'\E[1m\E[91m'
_omb_term_bold_silver=$'\E[1m\E[37m'
_omb_term_bold_teal=$'\E[1m\E[36m'
_omb_term_bold_violet=$'\E[1m\E[38;5;171m'
_omb_term_bold_white=$'\E[1m\E[97m'
_omb_term_bold_yellow=$'\E[1m\E[93m'
_omb_term_brown=$'\E[31m'
_omb_term_colors=256
_omb_term_cyan=$'\E[96m'
_omb_term_gray=$'\E[90m'
_omb_term_green=$'\E[32m'
_omb_term_lime=$'\E[92m'
_omb_term_magenta=$'\E[95m'
_omb_term_navy=$'\E[34m'
_omb_term_normal=$'\E[0m'
_omb_term_olive=$'\E[33m'
_omb_term_purple=$'\E[35m'
_omb_term_red=$'\E[91m'
_omb_term_reset=$'\E(B\E[m'
_omb_term_reset_color=$'\E[39m'
_omb_term_silver=$'\E[37m'
_omb_term_teal=$'\E[36m'
_omb_term_underline=$'\E[4m'
_omb_term_underline_black=$'\E[4m\E[30m'
_omb_term_underline_blue=$'\E[4m\E[94m'
_omb_term_underline_brown=$'\E[4m\E[31m'
_omb_term_underline_cyan=$'\E[4m\E[96m'
_omb_term_underline_gray=$'\E[4m\E[90m'
_omb_term_underline_green=$'\E[4m\E[32m'
_omb_term_underline_lime=$'\E[4m\E[92m'
_omb_term_underline_magenta=$'\E[4m\E[95m'
_omb_term_underline_navy=$'\E[4m\E[34m'
_omb_term_underline_olive=$'\E[4m\E[33m'
_omb_term_underline_purple=$'\E[4m\E[35m'
_omb_term_underline_red=$'\E[4m\E[91m'
_omb_term_underline_silver=$'\E[4m\E[37m'
_omb_term_underline_teal=$'\E[4m\E[36m'
_omb_term_underline_violet=$'\E[4m\E[38;5;171m'
_omb_term_underline_white=$'\E[4m\E[97m'
_omb_term_underline_yellow=$'\E[4m\E[93m'
_omb_term_violet=$'\E[38;5;171m'
_omb_term_white=$'\E[97m'
_omb_term_yellow=$'\E[93m'
_omb_util_original_PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
_omb_util_prompt_command=([0]="_omb_deprecate_const__sync" [1]="history -a" [2]="_omb_theme_PROMPT_COMMAND")
_omb_util_prompt_command_setup=1
_omb_util_readlink_visited_init='local -A visited=()'
_omb_util_unload_hook=([0]="PS1=\$_omb_util_original_PS1" [1]="_omb_util_prompt_command=()")
_omb_version=10000
_xspecs=([tex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [freeamp]="!*.@(mp3|og[ag]|pls|m3u)" [gqmpeg]="!*.@(mp3|og[ag]|pls|m3u)" [texi2html]="!*.texi*" [hbpp]="!*.@([Pp][Rr][Gg]|[Cc][Ll][Pp])" [lowriter]="!*.@(sxw|stw|sxg|sgl|doc?([mx])|dot?([mx])|rtf|txt|htm|html|?(f)odt|ott|odm|pdf)" [rpm2cpio]="!*.[rs]pm" [localc]="!*.@(sxc|stc|xls?([bmx])|xlw|xlt?([mx])|[ct]sv|?(f)ods|ots)" [hbrun]="!*.[Hh][Rr][Bb]" [vi]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [latex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [view]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [madplay]="!*.mp3" [compress]="*.Z" [pdfjadetex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [pbunzip2]="!*.?(t)bz?(2)" [lrunzip]="!*.lrz" [gunzip]="!*.@(Z|[gGd]z|t[ag]z)" [oowriter]="!*.@(sxw|stw|sxg|sgl|doc?([mx])|dot?([mx])|rtf|txt|htm|html|?(f)odt|ott|odm|pdf)" [epiphany]="!*.@(?([xX]|[sS])[hH][tT][mM]?([lL]))" [acroread]="!*.[pf]df" [znew]="*.Z" [kwrite]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [xemacs]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [gview]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [lzfgrep]="!*.@(tlz|lzma)" [lzless]="!*.@(tlz|lzma)" [cdiff]="!*.@(dif?(f)|?(d)patch)?(.@([gx]z|bz2|lzma))" [zipinfo]="!*.@(zip|[aegjswx]ar|exe|pk3|wsz|zargo|xpi|s[tx][cdiw]|sx[gm]|o[dt][tspgfc]|od[bm]|oxt|epub|apk|aab|ipa|do[ct][xm]|p[op]t[mx]|xl[st][xm]|pyz|whl)" [pdflatex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [portecle]="!@(*.@(ks|jks|jceks|p12|pfx|bks|ubr|gkr|cer|crt|cert|p7b|pkipath|pem|p10|csr|crl)|cacerts)" [modplugplay]="!*.@(669|abc|am[fs]|d[bs]m|dmf|far|it|mdl|m[eo]d|mid?(i)|mt[2m]|oct|okt?(a)|p[st]m|s[3t]m|ult|umx|wav|xm)" [lokalize]="!*.po" [lbzcat]="!*.?(t)bz?(2)" [qiv]="!*.@(gif|jp?(e)g|tif?(f)|png|p[bgp]m|bmp|x[bp]m|rle|rgb|pcx|fits|pm|svg)" [totem]="!*@(.@(mp?(e)g|MP?(E)G|wm[av]|WM[AV]|avi|AVI|asf|vob|VOB|bin|dat|divx|DIVX|vcd|ps|pes|fli|flv|FLV|fxm|FXM|viv|rm|ram|yuv|mov|MOV|qt|QT|web[am]|WEB[AM]|mp[234]|MP[234]|m?(p)4[av]|M?(P)4[AV]|mkv|MKV|og[agmvx]|OG[AGMVX]|t[ps]|T[PS]|m2t?(s)|M2T?(S)|mts|MTS|wav|WAV|flac|FLAC|asx|ASX|mng|MNG|srt|m[eo]d|M[EO]D|s[3t]m|S[3T]M|it|IT|xm|XM|iso|ISO)|+([0-9]).@(vdr|VDR))?(.@(crdownload|part))" [ps2pdfwr]="!*.@(?(e)ps|pdf)" [dvitype]="!*.dvi" [unpigz]="!*.@(Z|[gGdz]z|t[ag]z)" [mozilla]="!*.@(?([xX]|[sS])[hH][tT][mM]?([lL]))" [pdfunite]="!*.pdf" [gpdf]="!*.[pf]df" [texi2dvi]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [bunzip2]="!*.?(t)bz?(2)" [zathura]="!*.@(cb[rz7t]|djv?(u)|?(e)ps|pdf)" [kaffeine]="!*@(.@(mp?(e)g|MP?(E)G|wm[av]|WM[AV]|avi|AVI|asf|vob|VOB|bin|dat|divx|DIVX|vcd|ps|pes|fli|flv|FLV|fxm|FXM|viv|rm|ram|yuv|mov|MOV|qt|QT|web[am]|WEB[AM]|mp[234]|MP[234]|m?(p)4[av]|M?(P)4[AV]|mkv|MKV|og[agmvx]|OG[AGMVX]|t[ps]|T[PS]|m2t?(s)|M2T?(S)|mts|MTS|wav|WAV|flac|FLAC|asx|ASX|mng|MNG|srt|m[eo]d|M[EO]D|s[3t]m|S[3T]M|it|IT|xm|XM|iso|ISO)|+([0-9]).@(vdr|VDR))?(.@(crdownload|part))" [mpg123]="!*.mp3" [lzegrep]="!*.@(tlz|lzma)" [xv]="!*.@(gif|jp?(e)g?(2)|j2[ck]|jp[2f]|tif?(f)|png|p[bgp]m|bmp|x[bp]m|rle|rgb|pcx|fits|pm|?(e)ps)" [xdvi]="!*.@(dvi|DVI)?(.@(gz|Z|bz2))" [xfig]="!*.fig" [xpdf]="!*.@(pdf|fdf)?(.@(gz|GZ|bz2|BZ2|Z))" [oobase]="!*.odb" [xelatex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [gharbour]="!*.@([Pp][Rr][Gg]|[Cc][Ll][Pp])" [bzcat]="!*.?(t)bz?(2)" [dragon]="!*@(.@(mp?(e)g|MP?(E)G|wm[av]|WM[AV]|avi|AVI|asf|vob|VOB|bin|dat|divx|DIVX|vcd|ps|pes|fli|flv|FLV|fxm|FXM|viv|rm|ram|yuv|mov|MOV|qt|QT|web[am]|WEB[AM]|mp[234]|MP[234]|m?(p)4[av]|M?(P)4[AV]|mkv|MKV|og[agmvx]|OG[AGMVX]|t[ps]|T[PS]|m2t?(s)|M2T?(S)|mts|MTS|wav|WAV|flac|FLAC|asx|ASX|mng|MNG|srt|m[eo]d|M[EO]D|s[3t]m|S[3T]M|it|IT|xm|XM|iso|ISO)|+([0-9]).@(vdr|VDR))?(.@(crdownload|part))" [xanim]="!*.@(mpg|mpeg|avi|mov|qt)" [lualatex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [rgview]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [rvim]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [xetex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [lomath]="!*.@(sxm|smf|mml|odf)" [zcat]="!*.@(Z|[gGd]z|t[ag]z)" [lynx]="!*.@(?([xX]|[sS])[hH][tT][mM]?([lL]))" [uncompress]="!*.Z" [xzcat]="!*.@(?(t)xz|tlz|lzma)" [vim]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [loimpress]="!*.@(sxi|sti|pps?(x)|ppt?([mx])|pot?([mx])|?(f)odp|otp)" [dvipdf]="!*.dvi" [mpg321]="!*.mp3" [jadetex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [lobase]="!*.odb" [epdfview]="!*.pdf" [ps2pdf14]="!*.@(?(e)ps|pdf)" [ps2pdf13]="!*.@(?(e)ps|pdf)" [ps2pdf12]="!*.@(?(e)ps|pdf)" [poedit]="!*.po" [luatex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [kbabel]="!*.po" [bzme]="!*.@(zip|z|gz|tgz)" [dviselect]="!*.dvi" [realplay]="!*.@(rm?(j)|ra?(m)|smi?(l))" [kdvi]="!*.@(dvi|DVI)?(.@(gz|Z|bz2))" [elinks]="!*.@(?([xX]|[sS])[hH][tT][mM]?([lL]))" [kghostview]="!*.@(@(?(e)ps|?(E)PS|pdf|PDF)?(.gz|.GZ|.bz2|.BZ2|.Z))" [gtranslator]="!*.po" [unzip]="!*.@(zip|[aegjswx]ar|exe|pk3|wsz|zargo|xpi|s[tx][cdiw]|sx[gm]|o[dt][tspgfc]|od[bm]|oxt|epub|apk|aab|ipa|do[ct][xm]|p[op]t[mx]|xl[st][xm]|pyz|whl)" [ggv]="!*.@(@(?(e)ps|?(E)PS|pdf|PDF)?(.gz|.GZ|.bz2|.BZ2|.Z))" [oomath]="!*.@(sxm|smf|mml|odf)" [dvipdfmx]="!*.dvi" [makeinfo]="!*.texi*" [okular]="!*.@(okular|@(?(e|x)ps|?(E|X)PS|[pf]df|[PF]DF|dvi|DVI|cb[rz]|CB[RZ]|djv?(u)|DJV?(U)|dvi|DVI|gif|jp?(e)g|miff|tif?(f)|pn[gm]|p[bgp]m|bmp|xpm|ico|xwd|tga|pcx|GIF|JP?(E)G|MIFF|TIF?(F)|PN[GM]|P[BGP]M|BMP|XPM|ICO|XWD|TGA|PCX|epub|EPUB|odt|ODT|fb?(2)|FB?(2)|mobi|MOBI|g3|G3|chm|CHM)?(.?(gz|GZ|bz2|BZ2|xz|XZ)))" [sxemacs]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [aviplay]="!*.@(avi|asf|wmv)" [rgvim]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [dvipdfm]="!*.dvi" [ly2dvi]="!*.ly" [oodraw]="!*.@(sxd|std|sda|sdd|?(f)odg|otg)" [kpdf]="!*.@(?(e)ps|pdf)" [bibtex]="!*.aux" [netscape]="!*.@(?([xX]|[sS])[hH][tT][mM]?([lL]))" [emacs]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [rview]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [galeon]="!*.@(?([xX]|[sS])[hH][tT][mM]?([lL]))" [dillo]="!*.@(?([xX]|[sS])[hH][tT][mM]?([lL]))" [fbxine]="!*@(.@(mp?(e)g|MP?(E)G|wm[av]|WM[AV]|avi|AVI|asf|vob|VOB|bin|dat|divx|DIVX|vcd|ps|pes|fli|flv|FLV|fxm|FXM|viv|rm|ram|yuv|mov|MOV|qt|QT|web[am]|WEB[AM]|mp[234]|MP[234]|m?(p)4[av]|M?(P)4[AV]|mkv|MKV|og[agmvx]|OG[AGMVX]|t[ps]|T[PS]|m2t?(s)|M2T?(S)|mts|MTS|wav|WAV|flac|FLAC|asx|ASX|mng|MNG|srt|m[eo]d|M[EO]D|s[3t]m|S[3T]M|it|IT|xm|XM)|+([0-9]).@(vdr|VDR))?(.@(crdownload|part))" [oocalc]="!*.@(sxc|stc|xls?([bmx])|xlw|xlt?([mx])|[ct]sv|?(f)ods|ots)" [harbour]="!*.@([Pp][Rr][Gg]|[Cc][Ll][Pp])" [lodraw]="!*.@(sxd|std|sda|sdd|?(f)odg|otg)" [dvips]="!*.dvi" [ps2pdf]="!*.@(?(e)ps|pdf)" [kate]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [kid3-qt]="!*.@(mp[234c]|og[ag]|@(fl|a)ac|m4[abp]|spx|tta|w?(a)v|wma|aif?(f)|asf|ape)" [pdftex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [gvim]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [timidity]="!*.@(mid?(i)|rmi|rcp|[gr]36|g18|mod|xm|it|x3m|s[3t]m|kar)" [ogg123]="!*.@(og[ag]|m3u|flac|spx)" [lzgrep]="!*.@(tlz|lzma)" [ee]="!*.@(gif|jp?(e)g|miff|tif?(f)|pn[gm]|p[bgp]m|bmp|xpm|ico|xwd|tga|pcx)" [unlzma]="!*.@(tlz|lzma)" [lbunzip2]="!*.?(t)bz?(2)" [ooimpress]="!*.@(sxi|sti|pps?(x)|ppt?([mx])|pot?([mx])|?(f)odp|otp)" [xine]="!*@(.@(mp?(e)g|MP?(E)G|wm[av]|WM[AV]|avi|AVI|asf|vob|VOB|bin|dat|divx|DIVX|vcd|ps|pes|fli|flv|FLV|fxm|FXM|viv|rm|ram|yuv|mov|MOV|qt|QT|web[am]|WEB[AM]|mp[234]|MP[234]|m?(p)4[av]|M?(P)4[AV]|mkv|MKV|og[agmvx]|OG[AGMVX]|t[ps]|T[PS]|m2t?(s)|M2T?(S)|mts|MTS|wav|WAV|flac|FLAC|asx|ASX|mng|MNG|srt|m[eo]d|M[EO]D|s[3t]m|S[3T]M|it|IT|xm|XM)|+([0-9]).@(vdr|VDR))?(.@(crdownload|part))" [amaya]="!*.@(?([xX]|[sS])[hH][tT][mM]?([lL]))" [gv]="!*.@(@(?(e)ps|?(E)PS|pdf|PDF)?(.gz|.GZ|.bz2|.BZ2|.Z))" [kid3]="!*.@(mp[234c]|og[ag]|@(fl|a)ac|m4[abp]|spx|tta|w?(a)v|wma|aif?(f)|asf|ape)" [lilypond]="!*.ly" [modplug123]="!*.@(669|abc|am[fs]|d[bs]m|dmf|far|it|mdl|m[eo]d|mid?(i)|mt[2m]|oct|okt?(a)|p[st]m|s[3t]m|ult|umx|wav|xm)" [pbzcat]="!*.?(t)bz?(2)" [unxz]="!*.@(?(t)xz|tlz|lzma)" [playmidi]="!*.@(mid?(i)|cmf)" [lzcat]="!*.@(tlz|lzma)" [slitex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [aaxine]="!*@(.@(mp?(e)g|MP?(E)G|wm[av]|WM[AV]|avi|AVI|asf|vob|VOB|bin|dat|divx|DIVX|vcd|ps|pes|fli|flv|FLV|fxm|FXM|viv|rm|ram|yuv|mov|MOV|qt|QT|web[am]|WEB[AM]|mp[234]|MP[234]|m?(p)4[av]|M?(P)4[AV]|mkv|MKV|og[agmvx]|OG[AGMVX]|t[ps]|T[PS]|m2t?(s)|M2T?(S)|mts|MTS|wav|WAV|flac|FLAC|asx|ASX|mng|MNG|srt|m[eo]d|M[EO]D|s[3t]m|S[3T]M|it|IT|xm|XM)|+([0-9]).@(vdr|VDR))?(.@(crdownload|part))" [advi]="!*.dvi" [lzmore]="!*.@(tlz|lzma)" )
aliases=([0]="general")
background_black='\[\e[40m\]'
background_blue='\[\e[44m\]'
background_cyan='\[\e[46m\]'
background_green='\[\e[42m\]'
background_orange='\[\e[101m\]'
background_purple='\[\e[45m\]'
background_red='\[\e[41m\]'
background_white='\[\e[107m\]'
background_yellow='\[\e[43m\]'
black='\[\e[0;30m\]'
blue=$'\001\E[34m\002'
bold=$'\E[1m'
bold_black='\[\e[30;1m\]'
bold_blue='\[\e[34;1m\]'
bold_cyan='\[\e[36;1m\]'
bold_green='\[\e[32;1m\]'
bold_orange='\[\e[91;1m\]'
bold_purple='\[\e[35;1m\]'
bold_red='\[\e[31;1m\]'
bold_white='\[\e[97;1m\]'
bold_yellow='\[\e[33;1m\]'
completions=([0]="git" [1]="composer" [2]="ssh")
cyan='\[\e[0;36m\]'
dbg_trap=
echo_background_black=$'\E[40m'
echo_background_blue=$'\E[44m'
echo_background_cyan=$'\E[46m'
echo_background_green=$'\E[42m'
echo_background_orange=$'\E[41m\E[101m'
echo_background_purple=$'\E[45m'
echo_background_red=$'\E[41m'
echo_background_white=$'\E[47m\E[107m'
echo_background_yellow=$'\E[43m'
echo_black=$'\E[30m'
echo_blue=$'\E[34m'
echo_bold_black=$'\E[1m\E[30m'
echo_bold_blue=$'\E[1m\E[34m'
echo_bold_cyan=$'\E[1m\E[36m'
echo_bold_green=$'\E[1m\E[32m'
echo_bold_orange=$'\E[1m\E[91m'
echo_bold_purple=$'\E[1m\E[35m'
echo_bold_red=$'\E[1m\E[31m'
echo_bold_white=$'\E[1m\E[97m'
echo_bold_yellow=$'\E[1m\E[33m'
echo_cyan=$'\E[36m'
echo_green=$'\E[32m'
echo_normal=$'\E[0m'
echo_orange=$'\E[91m'
echo_purple=$'\E[35m'
echo_red=$'\E[31m'
echo_reset_color=$'\E[39m'
echo_underline_black=$'\E[4m\E[30m'
echo_underline_blue=$'\E[4m\E[34m'
echo_underline_cyan=$'\E[4m\E[36m'
echo_underline_green=$'\E[4m\E[32m'
echo_underline_orange=$'\E[4m\E[91m'
echo_underline_purple=$'\E[4m\E[35m'
echo_underline_red=$'\E[4m\E[31m'
echo_underline_white=$'\E[4m\E[97m'
echo_underline_yellow=$'\E[4m\E[33m'
echo_white=$'\E[97m'
echo_yellow=$'\E[33m'
green=$'\001\E[32m\002'
my_ps_host='\[\e[0;32m\]\h\[\e[0m\]'
my_ps_host_root='\[\e[0;32m\]\h\[\e[0m\]'
my_ps_root='\[\e[31;1m\]\u\[\e[0m\]'
my_ps_user='\[\e[32;1m\]\u\[\e[0m\]'
ncolors=256
normal='\[\e[0m\]'
orange='\[\e[0;91m\]'
plugins=([0]="git" [1]="bashmarks" [2]="npm" [3]="nvm")
purple=$'\001\E[35m\002'
red=$'\001\E[31m\002'
reset=$'\E(B\E[m'
reset_color='\[\e[39m\]'
tan=$'\E[33m'
underline=$'\E[4m'
underline_black='\[\e[30;4m\]'
underline_blue='\[\e[34;4m\]'
underline_cyan='\[\e[36;4m\]'
underline_green='\[\e[32;4m\]'
underline_orange='\[\e[91;4m\]'
underline_purple='\[\e[35;4m\]'
underline_red='\[\e[31;4m\]'
underline_white='\[\e[97;4m\]'
underline_yellow='\[\e[33;4m\]'
white='\[\e[0;97m\]'
yellow=$'\001\E[33m\002'
___git_complete () 
{ 
    local wrapper="__git_wrap${2}";
    eval "$wrapper () { __git_func_wrap $2 ; }";
    complete -o bashdefault -o default -o nospace -F $wrapper $1 2> /dev/null || complete -o default -o nospace -F $wrapper $1
}
__expand_tilde_by_ref () 
{ 
    if [[ ${!1-} == \~* ]]; then
        eval $1="$(printf ~%q "${!1#\~}")";
    fi
}
__get_cword_at_cursor_by_ref () 
{ 
    local cword words=();
    __reassemble_comp_words_by_ref "$1" words cword;
    local i cur="" index=$COMP_POINT lead=${COMP_LINE:0:COMP_POINT};
    if [[ $index -gt 0 && ( -n $lead && -n ${lead//[[:space:]]/} ) ]]; then
        cur=$COMP_LINE;
        for ((i = 0; i <= cword; ++i))
        do
            while [[ ${#cur} -ge ${#words[i]} && ${cur:0:${#words[i]}} != "${words[i]-}" ]]; do
                cur="${cur:1}";
                ((index > 0)) && ((index--));
            done;
            if ((i < cword)); then
                local old_size=${#cur};
                cur="${cur#"${words[i]}"}";
                local new_size=${#cur};
                ((index -= old_size - new_size));
            fi;
        done;
        [[ -n $cur && ! -n ${cur//[[:space:]]/} ]] && cur=;
        ((index < 0)) && index=0;
    fi;
    local "$2" "$3" "$4" && _upvars -a${#words[@]} $2 ${words+"${words[@]}"} -v $3 "$cword" -v $4 "${cur:0:index}"
}
__gh_debug () 
{ 
    if [[ -n ${BASH_COMP_DEBUG_FILE:-} ]]; then
        echo "$*" >> "${BASH_COMP_DEBUG_FILE}";
    fi
}
__gh_format_comp_descriptions () 
{ 
    local tab;
    tab=$(printf '\t');
    local comp="$1";
    local longest=$2;
    if [[ "$comp" == *$tab* ]]; then
        desc=${comp#*$tab};
        comp=${comp%%$tab*};
        maxdesclength=$(( COLUMNS - longest - 4 ));
        if [[ $maxdesclength -gt 8 ]]; then
            for ((i = ${#comp} ; i < longest ; i++))
            do
                comp+=" ";
            done;
        else
            maxdesclength=$(( COLUMNS - ${#comp} - 4 ));
        fi;
        if [ $maxdesclength -gt 0 ]; then
            if [ ${#desc} -gt $maxdesclength ]; then
                desc=${desc:0:$(( maxdesclength - 1 ))};
                desc+="…";
            fi;
            comp+="  ($desc)";
        fi;
    fi;
    printf "%q" "${comp}"
}
__gh_get_completion_results () 
{ 
    local requestComp lastParam lastChar args;
    args=("${words[@]:1}");
    requestComp="${words[0]} __complete ${args[*]}";
    lastParam=${words[$((${#words[@]}-1))]};
    lastChar=${lastParam:$((${#lastParam}-1)):1};
    __gh_debug "lastParam ${lastParam}, lastChar ${lastChar}";
    if [ -z "${cur}" ] && [ "${lastChar}" != "=" ]; then
        __gh_debug "Adding extra empty parameter";
        requestComp="${requestComp} ''";
    fi;
    if [[ "${cur}" == -*=* ]]; then
        cur="${cur#*=}";
    fi;
    __gh_debug "Calling ${requestComp}";
    out=$(eval "${requestComp}" 2>/dev/null);
    directive=${out##*:};
    out=${out%:*};
    if [ "${directive}" = "${out}" ]; then
        directive=0;
    fi;
    __gh_debug "The completion directive is: ${directive}";
    __gh_debug "The completions are: ${out[*]}"
}
__gh_handle_completion_types () 
{ 
    __gh_debug "__gh_handle_completion_types: COMP_TYPE is $COMP_TYPE";
    case $COMP_TYPE in 
        37 | 42)
            local tab comp;
            tab=$(printf '\t');
            while IFS='' read -r comp; do
                comp=${comp%%$tab*};
                comp=$(compgen -W "$comp" -- "$cur");
                if [ -n "$comp" ]; then
                    COMPREPLY+=("$comp");
                fi;
            done < <(printf "%s\n" "${out[@]}")
        ;;
        *)
            __gh_handle_standard_completion_case
        ;;
    esac
}
__gh_handle_special_char () 
{ 
    local comp="$1";
    local char=$2;
    if [[ "$comp" == *${char}* && "$COMP_WORDBREAKS" == *${char}* ]]; then
        local word=${comp%"${comp##*${char}}"};
        local idx=${#COMPREPLY[*]};
        while [[ $((--idx)) -ge 0 ]]; do
            COMPREPLY[$idx]=${COMPREPLY[$idx]#"$word"};
        done;
    fi
}
__gh_handle_standard_completion_case () 
{ 
    local tab comp;
    tab=$(printf '\t');
    local longest=0;
    while IFS='' read -r comp; do
        comp=${comp%%$tab*};
        comp=$(compgen -W "$comp" -- "$cur");
        if ((${#comp}>longest)); then
            longest=${#comp};
        fi;
    done < <(printf "%s\n" "${out[@]}");
    local completions=();
    while IFS='' read -r comp; do
        if [ -z "$comp" ]; then
            continue;
        fi;
        __gh_debug "Original comp: $comp";
        comp="$(__gh_format_comp_descriptions "$comp" "$longest")";
        __gh_debug "Final comp: $comp";
        completions+=("$comp");
    done < <(printf "%s\n" "${out[@]}");
    while IFS='' read -r comp; do
        COMPREPLY+=("$comp");
    done < <(compgen -W "${completions[*]}" -- "$cur");
    if [ ${#COMPREPLY[*]} -eq 1 ]; then
        __gh_debug "COMPREPLY[0]: ${COMPREPLY[0]}";
        comp="${COMPREPLY[0]%% *}";
        __gh_debug "Removed description from single completion, which is now: ${comp}";
        COMPREPLY=();
        COMPREPLY+=("$comp");
    fi
}
__gh_init_completion () 
{ 
    COMPREPLY=();
    _get_comp_words_by_ref "$@" cur prev words cword
}
__gh_process_completion_results () 
{ 
    local shellCompDirectiveError=1;
    local shellCompDirectiveNoSpace=2;
    local shellCompDirectiveNoFileComp=4;
    local shellCompDirectiveFilterFileExt=8;
    local shellCompDirectiveFilterDirs=16;
    if [ $((directive & shellCompDirectiveError)) -ne 0 ]; then
        __gh_debug "Received error from custom completion go code";
        return;
    else
        if [ $((directive & shellCompDirectiveNoSpace)) -ne 0 ]; then
            if [[ $(type -t compopt) = "builtin" ]]; then
                __gh_debug "Activating no space";
                compopt -o nospace;
            else
                __gh_debug "No space directive not supported in this version of bash";
            fi;
        fi;
        if [ $((directive & shellCompDirectiveNoFileComp)) -ne 0 ]; then
            if [[ $(type -t compopt) = "builtin" ]]; then
                __gh_debug "Activating no file completion";
                compopt +o default;
            else
                __gh_debug "No file completion directive not supported in this version of bash";
            fi;
        fi;
    fi;
    if [ $((directive & shellCompDirectiveFilterFileExt)) -ne 0 ]; then
        local fullFilter filter filteringCmd;
        for filter in ${out[*]};
        do
            fullFilter+="$filter|";
        done;
        filteringCmd="_filedir $fullFilter";
        __gh_debug "File filtering command: $filteringCmd";
        $filteringCmd;
    else
        if [ $((directive & shellCompDirectiveFilterDirs)) -ne 0 ]; then
            local subdir;
            subdir=$(printf "%s" "${out[0]}");
            if [ -n "$subdir" ]; then
                __gh_debug "Listing directories in $subdir";
                pushd "$subdir" > /dev/null 2>&1 && _filedir -d && popd > /dev/null 2>&1 || return;
            else
                __gh_debug "Listing directories in .";
                _filedir -d;
            fi;
        else
            __gh_handle_completion_types;
        fi;
    fi;
    __gh_handle_special_char "$cur" :;
    __gh_handle_special_char "$cur" =
}
__git () 
{ 
    git ${__git_C_args:+"${__git_C_args[@]}"} ${__git_dir:+--git-dir="$__git_dir"} "$@" 2> /dev/null
}
__git_aliased_command () 
{ 
    local cur=$1 last list= word cmdline;
    while [[ -n "$cur" ]]; do
        if [[ "$list" == *" $cur "* ]]; then
            return;
        fi;
        cmdline=$(__git config --get "alias.$cur");
        list=" $cur $list";
        last=$cur;
        cur=;
        for word in $cmdline;
        do
            case "$word" in 
                \!gitk | gitk)
                    cur="gitk";
                    break
                ;;
                \!*)
                    : shell command alias
                ;;
                -*)
                    : option
                ;;
                *=*)
                    : setting env
                ;;
                git)
                    : git itself
                ;;
                \(\))
                    : skip parens of shell function definition
                ;;
                {)
                    : skip start of shell helper function
                ;;
                :)
                    : skip null command
                ;;
                \'*)
                    : skip opening quote after sh -c
                ;;
                *)
                    cur="$word";
                    break
                ;;
            esac;
        done;
    done;
    cur=$last;
    if [[ "$cur" != "$1" ]]; then
        echo "$cur";
    fi
}
__git_checkout_default_dwim_mode () 
{ 
    local last_option dwim_opt="--dwim";
    if [ "${GIT_COMPLETION_CHECKOUT_NO_GUESS-}" = "1" ]; then
        dwim_opt="";
    fi;
    if [ -n "$(__git_find_on_cmdline "--no-track")" ]; then
        dwim_opt="";
    fi;
    if [ "$(__git config --type=bool checkout.guess)" = "false" ]; then
        dwim_opt="";
    fi;
    last_option="$(__git_find_last_on_cmdline "--guess --no-guess")";
    case "$last_option" in 
        --guess)
            dwim_opt="--dwim"
        ;;
        --no-guess)
            dwim_opt=""
        ;;
    esac;
    echo "$dwim_opt"
}
__git_complete () 
{ 
    local func;
    if __git_have_func $2; then
        func=$2;
    else
        if __git_have_func __$2_main; then
            func=__$2_main;
        else
            if __git_have_func _$2; then
                func=_$2;
            else
                echo "ERROR: could not find function '$2'" 1>&2;
                return 1;
            fi;
        fi;
    fi;
    ___git_complete $1 $func
}
__git_complete_command () 
{ 
    local command="$1";
    local completion_func="_git_${command//-/_}";
    if ! __git_have_func $completion_func && __git_have_func _completion_loader; then
        _completion_loader "git-$command";
    fi;
    if __git_have_func $completion_func; then
        $completion_func;
        return 0;
    else
        if __git_support_parseopt_helper "$command"; then
            __git_complete_common "$command";
            return 0;
        else
            return 1;
        fi;
    fi
}
__git_complete_common () 
{ 
    local command="$1";
    case "$cur" in 
        --*)
            __gitcomp_builtin "$command"
        ;;
    esac
}
__git_complete_config_variable_name () 
{ 
    local cur_="$cur" sfx;
    while test $# != 0; do
        case "$1" in 
            --cur=*)
                cur_="${1##--cur=}"
            ;;
            --sfx=*)
                sfx="${1##--sfx=}"
            ;;
            *)
                return 1
            ;;
        esac;
        shift;
    done;
    case "$cur_" in 
        branch.*.*)
            local pfx="${cur_%.*}.";
            cur_="${cur_##*.}";
            __gitcomp "remote pushRemote merge mergeOptions rebase" "$pfx" "$cur_" "$sfx";
            return
        ;;
        branch.*)
            local pfx="${cur_%.*}.";
            cur_="${cur_#*.}";
            __gitcomp_direct "$(__git_heads "$pfx" "$cur_" ".")";
            __gitcomp_nl_append 'autoSetupMerge
autoSetupRebase
' "$pfx" "$cur_" "${sfx- }";
            return
        ;;
        guitool.*.*)
            local pfx="${cur_%.*}.";
            cur_="${cur_##*.}";
            __gitcomp "
			argPrompt cmd confirm needsFile noConsole noRescan
			prompt revPrompt revUnmerged title
			" "$pfx" "$cur_" "$sfx";
            return
        ;;
        difftool.*.*)
            local pfx="${cur_%.*}.";
            cur_="${cur_##*.}";
            __gitcomp "cmd path" "$pfx" "$cur_" "$sfx";
            return
        ;;
        man.*.*)
            local pfx="${cur_%.*}.";
            cur_="${cur_##*.}";
            __gitcomp "cmd path" "$pfx" "$cur_" "$sfx";
            return
        ;;
        mergetool.*.*)
            local pfx="${cur_%.*}.";
            cur_="${cur_##*.}";
            __gitcomp "cmd path trustExitCode" "$pfx" "$cur_" "$sfx";
            return
        ;;
        pager.*)
            local pfx="${cur_%.*}.";
            cur_="${cur_#*.}";
            __git_compute_all_commands;
            __gitcomp_nl "$__git_all_commands" "$pfx" "$cur_" "${sfx- }";
            return
        ;;
        remote.*.*)
            local pfx="${cur_%.*}.";
            cur_="${cur_##*.}";
            __gitcomp "
			url proxy fetch push mirror skipDefaultUpdate
			receivepack uploadpack tagOpt pushurl
			" "$pfx" "$cur_" "$sfx";
            return
        ;;
        remote.*)
            local pfx="${cur_%.*}.";
            cur_="${cur_#*.}";
            __gitcomp_nl "$(__git_remotes)" "$pfx" "$cur_" ".";
            __gitcomp_nl_append "pushDefault" "$pfx" "$cur_" "${sfx- }";
            return
        ;;
        url.*.*)
            local pfx="${cur_%.*}.";
            cur_="${cur_##*.}";
            __gitcomp "insteadOf pushInsteadOf" "$pfx" "$cur_" "$sfx";
            return
        ;;
        *.*)
            __git_compute_config_vars;
            __gitcomp "$__git_config_vars" "" "$cur_" "$sfx"
        ;;
        *)
            __git_compute_config_sections;
            __gitcomp "$__git_config_sections" "" "$cur_" "."
        ;;
    esac
}
__git_complete_config_variable_name_and_value () 
{ 
    local cur_="$cur";
    while test $# != 0; do
        case "$1" in 
            --cur=*)
                cur_="${1##--cur=}"
            ;;
            *)
                return 1
            ;;
        esac;
        shift;
    done;
    case "$cur_" in 
        *=*)
            __git_complete_config_variable_value --varname="${cur_%%=*}" --cur="${cur_#*=}"
        ;;
        *)
            __git_complete_config_variable_name --cur="$cur_" --sfx='='
        ;;
    esac
}
__git_complete_config_variable_value () 
{ 
    local varname="$prev" cur_="$cur";
    while test $# != 0; do
        case "$1" in 
            --varname=*)
                varname="${1##--varname=}"
            ;;
            --cur=*)
                cur_="${1##--cur=}"
            ;;
            *)
                return 1
            ;;
        esac;
        shift;
    done;
    if [ "${BASH_VERSINFO[0]:-0}" -ge 4 ]; then
        varname="${varname,,}";
    else
        varname="$(echo "$varname" |tr A-Z a-z)";
    fi;
    case "$varname" in 
        branch.*.remote | branch.*.pushremote)
            __gitcomp_nl "$(__git_remotes)" "" "$cur_";
            return
        ;;
        branch.*.merge)
            __git_complete_refs --cur="$cur_";
            return
        ;;
        branch.*.rebase)
            __gitcomp "false true merges interactive" "" "$cur_";
            return
        ;;
        remote.pushdefault)
            __gitcomp_nl "$(__git_remotes)" "" "$cur_";
            return
        ;;
        remote.*.fetch)
            local remote="${varname#remote.}";
            remote="${remote%.fetch}";
            if [ -z "$cur_" ]; then
                __gitcomp_nl "refs/heads/" "" "" "";
                return;
            fi;
            __gitcomp_nl "$(__git_refs_remotes "$remote")" "" "$cur_";
            return
        ;;
        remote.*.push)
            local remote="${varname#remote.}";
            remote="${remote%.push}";
            __gitcomp_nl "$(__git for-each-ref 			--format='%(refname):%(refname)' refs/heads)" "" "$cur_";
            return
        ;;
        pull.twohead | pull.octopus)
            __git_compute_merge_strategies;
            __gitcomp "$__git_merge_strategies" "" "$cur_";
            return
        ;;
        color.pager)
            __gitcomp "false true" "" "$cur_";
            return
        ;;
        color.*.*)
            __gitcomp "
			normal black red green yellow blue magenta cyan white
			bold dim ul blink reverse
			" "" "$cur_";
            return
        ;;
        color.*)
            __gitcomp "false true always never auto" "" "$cur_";
            return
        ;;
        diff.submodule)
            __gitcomp "$__git_diff_submodule_formats" "" "$cur_";
            return
        ;;
        help.format)
            __gitcomp "man info web html" "" "$cur_";
            return
        ;;
        log.date)
            __gitcomp "$__git_log_date_formats" "" "$cur_";
            return
        ;;
        sendemail.aliasfiletype)
            __gitcomp "mutt mailrc pine elm gnus" "" "$cur_";
            return
        ;;
        sendemail.confirm)
            __gitcomp "$__git_send_email_confirm_options" "" "$cur_";
            return
        ;;
        sendemail.suppresscc)
            __gitcomp "$__git_send_email_suppresscc_options" "" "$cur_";
            return
        ;;
        sendemail.transferencoding)
            __gitcomp "7bit 8bit quoted-printable base64" "" "$cur_";
            return
        ;;
        *.*)
            return
        ;;
    esac
}
__git_complete_fetch_refspecs () 
{ 
    local i remote="$1" pfx="${2-}" cur_="${3-$cur}" sfx="${4- }";
    __gitcomp_direct "$(
		for i in $(__git_refs "$remote" "" "" "$cur_") ; do
			echo "$pfx$i:$i$sfx"
		done
		)"
}
__git_complete_file () 
{ 
    __git_complete_revlist_file
}
__git_complete_force_with_lease () 
{ 
    local cur_=$1;
    case "$cur_" in 
        --*=)

        ;;
        *:*)
            __git_complete_refs --cur="${cur_#*:}"
        ;;
        *)
            __git_complete_refs --cur="$cur_"
        ;;
    esac
}
__git_complete_index_file () 
{ 
    local dequoted_word pfx="" cur_;
    __git_dequote "$cur";
    case "$dequoted_word" in 
        ?*/*)
            pfx="${dequoted_word%/*}/";
            cur_="${dequoted_word##*/}"
        ;;
        *)
            cur_="$dequoted_word"
        ;;
    esac;
    __gitcomp_file_direct "$(__git_index_files "$1" "$pfx" "$cur_")"
}
__git_complete_refs () 
{ 
    local remote= dwim= pfx= cur_="$cur" sfx=" " mode="refs";
    while test $# != 0; do
        case "$1" in 
            --remote=*)
                remote="${1##--remote=}"
            ;;
            --dwim)
                dwim="yes"
            ;;
            --track)
                dwim="yes"
            ;;
            --pfx=*)
                pfx="${1##--pfx=}"
            ;;
            --cur=*)
                cur_="${1##--cur=}"
            ;;
            --sfx=*)
                sfx="${1##--sfx=}"
            ;;
            --mode=*)
                mode="${1##--mode=}"
            ;;
            *)
                return 1
            ;;
        esac;
        shift;
    done;
    case "$mode" in 
        refs)
            __gitcomp_direct "$(__git_refs "$remote" "" "$pfx" "$cur_" "$sfx")"
        ;;
        heads)
            __gitcomp_direct "$(__git_heads "$pfx" "$cur_" "$sfx")"
        ;;
        remote-heads)
            __gitcomp_direct "$(__git_remote_heads "$pfx" "$cur_" "$sfx")"
        ;;
        *)
            return 1
        ;;
    esac;
    if [ "$dwim" = "yes" ]; then
        __gitcomp_direct_append "$(__git_dwim_remote_heads "$pfx" "$cur_" "$sfx")";
    fi
}
__git_complete_remote_or_refspec () 
{ 
    local cur_="$cur" cmd="${words[__git_cmd_idx]}";
    local i c=$((__git_cmd_idx+1)) remote="" pfx="" lhs=1 no_complete_refspec=0;
    if [ "$cmd" = "remote" ]; then
        ((c++));
    fi;
    while [ $c -lt $cword ]; do
        i="${words[c]}";
        case "$i" in 
            --mirror)
                [ "$cmd" = "push" ] && no_complete_refspec=1
            ;;
            -d | --delete)
                [ "$cmd" = "push" ] && lhs=0
            ;;
            --all)
                case "$cmd" in 
                    push)
                        no_complete_refspec=1
                    ;;
                    fetch)
                        return
                    ;;
                    *)

                    ;;
                esac
            ;;
            --multiple)
                no_complete_refspec=1;
                break
            ;;
            -*)

            ;;
            *)
                remote="$i";
                break
            ;;
        esac;
        ((c++));
    done;
    if [ -z "$remote" ]; then
        __gitcomp_nl "$(__git_remotes)";
        return;
    fi;
    if [ $no_complete_refspec = 1 ]; then
        return;
    fi;
    [ "$remote" = "." ] && remote=;
    case "$cur_" in 
        *:*)
            case "$COMP_WORDBREAKS" in 
                *:*)
                    : great
                ;;
                *)
                    pfx="${cur_%%:*}:"
                ;;
            esac;
            cur_="${cur_#*:}";
            lhs=0
        ;;
        +*)
            pfx="+";
            cur_="${cur_#+}"
        ;;
    esac;
    case "$cmd" in 
        fetch)
            if [ $lhs = 1 ]; then
                __git_complete_fetch_refspecs "$remote" "$pfx" "$cur_";
            else
                __git_complete_refs --pfx="$pfx" --cur="$cur_";
            fi
        ;;
        pull | remote)
            if [ $lhs = 1 ]; then
                __git_complete_refs --remote="$remote" --pfx="$pfx" --cur="$cur_";
            else
                __git_complete_refs --pfx="$pfx" --cur="$cur_";
            fi
        ;;
        push)
            if [ $lhs = 1 ]; then
                __git_complete_refs --pfx="$pfx" --cur="$cur_";
            else
                __git_complete_refs --remote="$remote" --pfx="$pfx" --cur="$cur_";
            fi
        ;;
    esac
}
__git_complete_revlist () 
{ 
    __git_complete_revlist_file
}
__git_complete_revlist_file () 
{ 
    local dequoted_word pfx ls ref cur_="$cur";
    case "$cur_" in 
        *..?*:*)
            return
        ;;
        ?*:*)
            ref="${cur_%%:*}";
            cur_="${cur_#*:}";
            __git_dequote "$cur_";
            case "$dequoted_word" in 
                ?*/*)
                    pfx="${dequoted_word%/*}";
                    cur_="${dequoted_word##*/}";
                    ls="$ref:$pfx";
                    pfx="$pfx/"
                ;;
                *)
                    cur_="$dequoted_word";
                    ls="$ref"
                ;;
            esac;
            case "$COMP_WORDBREAKS" in 
                *:*)
                    : great
                ;;
                *)
                    pfx="$ref:$pfx"
                ;;
            esac;
            __gitcomp_file "$(__git ls-tree "$ls" 				| sed 's/^.*	//
				       s/$//')" "$pfx" "$cur_"
        ;;
        *...*)
            pfx="${cur_%...*}...";
            cur_="${cur_#*...}";
            __git_complete_refs --pfx="$pfx" --cur="$cur_"
        ;;
        *..*)
            pfx="${cur_%..*}..";
            cur_="${cur_#*..}";
            __git_complete_refs --pfx="$pfx" --cur="$cur_"
        ;;
        *)
            __git_complete_refs
        ;;
    esac
}
__git_complete_strategy () 
{ 
    __git_compute_merge_strategies;
    case "$prev" in 
        -s | --strategy)
            __gitcomp "$__git_merge_strategies";
            return 0
        ;;
        -X)
            __gitcomp "$__git_merge_strategy_options";
            return 0
        ;;
    esac;
    case "$cur" in 
        --strategy=*)
            __gitcomp "$__git_merge_strategies" "" "${cur##--strategy=}";
            return 0
        ;;
        --strategy-option=*)
            __gitcomp "$__git_merge_strategy_options" "" "${cur##--strategy-option=}";
            return 0
        ;;
    esac;
    return 1
}
__git_complete_symbol () 
{ 
    local tags=tags pfx="" cur_="${cur-}" sfx=" ";
    while test $# != 0; do
        case "$1" in 
            --tags=*)
                tags="${1##--tags=}"
            ;;
            --pfx=*)
                pfx="${1##--pfx=}"
            ;;
            --cur=*)
                cur_="${1##--cur=}"
            ;;
            --sfx=*)
                sfx="${1##--sfx=}"
            ;;
            *)
                return 1
            ;;
        esac;
        shift;
    done;
    if test -r "$tags"; then
        __gitcomp_direct "$(__git_match_ctag "$cur_" "$tags" "$pfx" "$sfx")";
    fi
}
__git_complete_worktree_paths () 
{ 
    local IFS='
';
    __gitcomp_nl "$(git worktree list --porcelain |
		sed -n -e '2,$ s/^worktree //p')"
}
__git_compute_all_commands () 
{ 
    test -n "$__git_all_commands" || __git_all_commands=$(__git --list-cmds=main,others,alias,nohelpers)
}
__git_compute_config_sections () 
{ 
    test -n "$__git_config_sections" || __git_config_sections="$(git help --config-sections-for-completion)"
}
__git_compute_config_vars () 
{ 
    test -n "$__git_config_vars" || __git_config_vars="$(git help --config-for-completion)"
}
__git_compute_merge_strategies () 
{ 
    test -n "$__git_merge_strategies" || __git_merge_strategies=$(__git_list_merge_strategies)
}
__git_config_get_set_variables () 
{ 
    local prevword word config_file= c=$cword;
    while [ $c -gt "$__git_cmd_idx" ]; do
        word="${words[c]}";
        case "$word" in 
            --system | --global | --local | --file=*)
                config_file="$word";
                break
            ;;
            -f | --file)
                config_file="$word $prevword";
                break
            ;;
        esac;
        prevword=$word;
        c=$((--c));
    done;
    __git config $config_file --name-only --list
}
__git_count_arguments () 
{ 
    local word i c=0;
    for ((i=$__git_cmd_idx; i < ${#words[@]}; i++))
    do
        word="${words[i]}";
        case "$word" in 
            --)
                ((c = 0))
            ;;
            "$1")
                ((c = 0))
            ;;
            ?*)
                ((c++))
            ;;
        esac;
    done;
    printf "%d" $c
}
__git_dequote () 
{ 
    local rest="$1" len ch;
    dequoted_word="";
    while test -n "$rest"; do
        len=${#dequoted_word};
        dequoted_word="$dequoted_word${rest%%[\\\'\"]*}";
        rest="${rest:$((${#dequoted_word}-$len))}";
        case "${rest:0:1}" in 
            \\)
                ch="${rest:1:1}";
                case "$ch" in 
                    '
')

                    ;;
                    *)
                        dequoted_word="$dequoted_word$ch"
                    ;;
                esac;
                rest="${rest:2}"
            ;;
            \')
                rest="${rest:1}";
                len=${#dequoted_word};
                dequoted_word="$dequoted_word${rest%%\'*}";
                rest="${rest:$((${#dequoted_word}-$len+1))}"
            ;;
            \")
                rest="${rest:1}";
                while test -n "$rest"; do
                    len=${#dequoted_word};
                    dequoted_word="$dequoted_word${rest%%[\\\"]*}";
                    rest="${rest:$((${#dequoted_word}-$len))}";
                    case "${rest:0:1}" in 
                        \\)
                            ch="${rest:1:1}";
                            case "$ch" in 
                                \" | \\ | \$ | \`)
                                    dequoted_word="$dequoted_word$ch"
                                ;;
                                '
')

                                ;;
                                *)
                                    dequoted_word="$dequoted_word\\$ch"
                                ;;
                            esac;
                            rest="${rest:2}"
                        ;;
                        \")
                            rest="${rest:1}";
                            break
                        ;;
                    esac;
                done
            ;;
        esac;
    done
}
__git_dwim_remote_heads () 
{ 
    local pfx="${1-}" cur_="${2-}" sfx="${3-}";
    local fer_pfx="${pfx//\%/%%}";
    __git for-each-ref --format="$fer_pfx%(refname:strip=3)$sfx" --sort="refname:strip=3" "refs/remotes/*/$cur_*" "refs/remotes/*/$cur_*/**" | uniq -u
}
__git_eread () 
{ 
    test -r "$1" && IFS='
' read "$2" < "$1"
}
__git_find_last_on_cmdline () 
{ 
    local word c=$cword show_idx;
    while test $# -gt 1; do
        case "$1" in 
            --show-idx)
                show_idx=y
            ;;
            *)
                return 1
            ;;
        esac;
        shift;
    done;
    local wordlist="$1";
    while [ $c -gt "$__git_cmd_idx" ]; do
        ((c--));
        for word in $wordlist;
        do
            if [ "$word" = "${words[c]}" ]; then
                if [ -n "$show_idx" ]; then
                    echo "$c $word";
                else
                    echo "$word";
                fi;
                return;
            fi;
        done;
    done
}
__git_find_on_cmdline () 
{ 
    local word c="$__git_cmd_idx" show_idx;
    while test $# -gt 1; do
        case "$1" in 
            --show-idx)
                show_idx=y
            ;;
            *)
                return 1
            ;;
        esac;
        shift;
    done;
    local wordlist="$1";
    while [ $c -lt $cword ]; do
        for word in $wordlist;
        do
            if [ "$word" = "${words[c]}" ]; then
                if [ -n "${show_idx-}" ]; then
                    echo "$c $word";
                else
                    echo "$word";
                fi;
                return;
            fi;
        done;
        ((c++));
    done
}
__git_find_repo_path () 
{ 
    if [ -n "${__git_repo_path-}" ]; then
        return;
    fi;
    if [ -n "${__git_C_args-}" ]; then
        __git_repo_path="$(git "${__git_C_args[@]}" 			${__git_dir:+--git-dir="$__git_dir"} 			rev-parse --absolute-git-dir 2>/dev/null)";
    else
        if [ -n "${__git_dir-}" ]; then
            test -d "$__git_dir" && __git_repo_path="$__git_dir";
        else
            if [ -n "${GIT_DIR-}" ]; then
                test -d "$GIT_DIR" && __git_repo_path="$GIT_DIR";
            else
                if [ -d .git ]; then
                    __git_repo_path=.git;
                else
                    __git_repo_path="$(git rev-parse --git-dir 2>/dev/null)";
                fi;
            fi;
        fi;
    fi
}
__git_func_wrap () 
{ 
    local cur words cword prev;
    local __git_cmd_idx=0;
    _get_comp_words_by_ref -n =: cur words cword prev;
    $1
}
__git_get_config_variables () 
{ 
    local section="$1" i IFS='
';
    for i in $(__git config --name-only --get-regexp "^$section\..*");
    do
        echo "${i#$section.}";
    done
}
__git_get_option_value () 
{ 
    local c short_opt long_opt val;
    local result= values config_key word;
    short_opt="$1";
    long_opt="$2";
    values="$3";
    config_key="$4";
    ((c = $cword - 1));
    while [ $c -ge 0 ]; do
        word="${words[c]}";
        for val in $values;
        do
            if [ "$short_opt$val" = "$word" ] || [ "$long_opt$val" = "$word" ]; then
                result="$val";
                break 2;
            fi;
        done;
        ((c--));
    done;
    if [ -n "$config_key" ] && [ -z "$result" ]; then
        result="$(__git config "$config_key")";
    fi;
    echo "$result"
}
__git_has_doubledash () 
{ 
    local c=1;
    while [ $c -lt $cword ]; do
        if [ "--" = "${words[c]}" ]; then
            return 0;
        fi;
        ((c++));
    done;
    return 1
}
__git_have_func () 
{ 
    declare -f -- "$1" > /dev/null 2>&1
}
__git_heads () 
{ 
    local pfx="${1-}" cur_="${2-}" sfx="${3-}";
    __git for-each-ref --format="${pfx//\%/%%}%(refname:strip=2)$sfx" "refs/heads/$cur_*" "refs/heads/$cur_*/**"
}
__git_index_files () 
{ 
    local root="$2" match="$3";
    __git_ls_files_helper "$root" "$1" "${match:-?}" | awk -F / -v pfx="${2//\\/\\\\}" '{
		paths[$1] = 1
	}
	END {
		for (p in paths) {
			if (substr(p, 1, 1) != "\"") {
				# No special characters, easy!
				print pfx p
				continue
			}

			# The path is quoted.
			p = dequote(p)
			if (p == "")
				continue

			# Even when a directory name itself does not contain
			# any special characters, it will still be quoted if
			# any of its (stripped) trailing path components do.
			# Because of this we may have seen the same directory
			# both quoted and unquoted.
			if (p in paths)
				# We have seen the same directory unquoted,
				# skip it.
				continue
			else
				print pfx p
		}
	}
	function dequote(p,    bs_idx, out, esc, esc_idx, dec) {
		# Skip opening double quote.
		p = substr(p, 2)

		# Interpret backslash escape sequences.
		while ((bs_idx = index(p, "\\")) != 0) {
			out = out substr(p, 1, bs_idx - 1)
			esc = substr(p, bs_idx + 1, 1)
			p = substr(p, bs_idx + 2)

			if ((esc_idx = index("abtvfr\"\\", esc)) != 0) {
				# C-style one-character escape sequence.
				out = out substr("\a\b\t\v\f\r\"\\",
						 esc_idx, 1)
			} else if (esc == "n") {
				# Uh-oh, a newline character.
				# We cannot reliably put a pathname
				# containing a newline into COMPREPLY,
				# and the newline would create a mess.
				# Skip this path.
				return ""
			} else {
				# Must be a \nnn octal value, then.
				dec = esc             * 64 + \
				      substr(p, 1, 1) * 8  + \
				      substr(p, 2, 1)
				out = out sprintf("%c", dec)
				p = substr(p, 3)
			}
		}
		# Drop closing double quote, if there is one.
		# (There is not any if this is a directory, as it was
		# already stripped with the trailing path components.)
		if (substr(p, length(p), 1) == "\"")
			out = out substr(p, 1, length(p) - 1)
		else
			out = out p

		return out
	}'
}
__git_is_configured_remote () 
{ 
    local remote;
    for remote in $(__git_remotes);
    do
        if [ "$remote" = "$1" ]; then
            return 0;
        fi;
    done;
    return 1
}
__git_list_merge_strategies () 
{ 
    LANG=C LC_ALL=C git merge -s help 2>&1 | sed -n -e '/[Aa]vailable strategies are: /,/^$/{
		s/\.$//
		s/.*://
		s/^[ 	]*//
		s/[ 	]*$//
		p
	}'
}
__git_ls_files_helper () 
{ 
    if [ "$2" = "--committable" ]; then
        __git -C "$1" -c core.quotePath=false diff-index --name-only --relative HEAD -- "${3//\\/\\\\}*";
    else
        __git -C "$1" -c core.quotePath=false ls-files --exclude-standard $2 -- "${3//\\/\\\\}*";
    fi
}
__git_main () 
{ 
    local i c=1 command __git_dir __git_repo_path;
    local __git_C_args C_args_count=0;
    local __git_cmd_idx;
    while [ $c -lt $cword ]; do
        i="${words[c]}";
        case "$i" in 
            --git-dir=*)
                __git_dir="${i#--git-dir=}"
            ;;
            --git-dir)
                ((c++));
                __git_dir="${words[c]}"
            ;;
            --bare)
                __git_dir="."
            ;;
            --help)
                command="help";
                break
            ;;
            -c | --work-tree | --namespace)
                ((c++))
            ;;
            -C)
                __git_C_args[C_args_count++]=-C;
                ((c++));
                __git_C_args[C_args_count++]="${words[c]}"
            ;;
            -*)

            ;;
            *)
                command="$i";
                __git_cmd_idx="$c";
                break
            ;;
        esac;
        ((c++));
    done;
    if [ -z "${command-}" ]; then
        case "$prev" in 
            --git-dir | -C | --work-tree)
                return
            ;;
            -c)
                __git_complete_config_variable_name_and_value;
                return
            ;;
            --namespace)
                return
            ;;
        esac;
        case "$cur" in 
            --*)
                __gitcomp "
			--paginate
			--no-pager
			--git-dir=
			--bare
			--version
			--exec-path
			--exec-path=
			--html-path
			--man-path
			--info-path
			--work-tree=
			--namespace=
			--no-replace-objects
			--help
			"
            ;;
            *)
                if test -n "${GIT_TESTING_PORCELAIN_COMMAND_LIST-}"; then
                    __gitcomp "$GIT_TESTING_PORCELAIN_COMMAND_LIST";
                else
                    __gitcomp "$(__git --list-cmds=list-mainporcelain,others,nohelpers,alias,list-complete,config)";
                fi
            ;;
        esac;
        return;
    fi;
    __git_complete_command "$command" && return;
    local expansion=$(__git_aliased_command "$command");
    if [ -n "$expansion" ]; then
        words[1]=$expansion;
        __git_complete_command "$expansion";
    fi
}
__git_match_ctag () 
{ 
    awk -v pfx="${3-}" -v sfx="${4-}" "
		/^${1//\//\\/}/ { print pfx \$1 sfx }
		" "$2"
}
__git_pretty_aliases () 
{ 
    __git_get_config_variables "pretty"
}
__git_ps1 () 
{ 
    local exit=$?;
    local pcmode=no;
    local detached=no;
    local ps1pc_start='\u@\h:\w ';
    local ps1pc_end='\$ ';
    local printf_format=' (%s)';
    case "$#" in 
        2 | 3)
            pcmode=yes;
            ps1pc_start="$1";
            ps1pc_end="$2";
            printf_format="${3:-$printf_format}";
            PS1="$ps1pc_start$ps1pc_end"
        ;;
        0 | 1)
            printf_format="${1:-$printf_format}"
        ;;
        *)
            return $exit
        ;;
    esac;
    local ps1_expanded=yes;
    [ -z "${ZSH_VERSION-}" ] || [[ -o PROMPT_SUBST ]] || ps1_expanded=no;
    [ -z "${BASH_VERSION-}" ] || shopt -q promptvars || ps1_expanded=no;
    local repo_info rev_parse_exit_code;
    repo_info="$(git rev-parse --git-dir --is-inside-git-dir 		--is-bare-repository --is-inside-work-tree 		--short HEAD 2>/dev/null)";
    rev_parse_exit_code="$?";
    if [ -z "$repo_info" ]; then
        return $exit;
    fi;
    local short_sha="";
    if [ "$rev_parse_exit_code" = "0" ]; then
        short_sha="${repo_info##*
}";
        repo_info="${repo_info%
*}";
    fi;
    local inside_worktree="${repo_info##*
}";
    repo_info="${repo_info%
*}";
    local bare_repo="${repo_info##*
}";
    repo_info="${repo_info%
*}";
    local inside_gitdir="${repo_info##*
}";
    local g="${repo_info%
*}";
    if [ "true" = "$inside_worktree" ] && [ -n "${GIT_PS1_HIDE_IF_PWD_IGNORED-}" ] && [ "$(git config --bool bash.hideIfPwdIgnored)" != "false" ] && git check-ignore -q .; then
        return $exit;
    fi;
    local sparse="";
    if [ -z "${GIT_PS1_COMPRESSSPARSESTATE-}" ] && [ -z "${GIT_PS1_OMITSPARSESTATE-}" ] && [ "$(git config --bool core.sparseCheckout)" = "true" ]; then
        sparse="|SPARSE";
    fi;
    local r="";
    local b="";
    local step="";
    local total="";
    if [ -d "$g/rebase-merge" ]; then
        __git_eread "$g/rebase-merge/head-name" b;
        __git_eread "$g/rebase-merge/msgnum" step;
        __git_eread "$g/rebase-merge/end" total;
        r="|REBASE";
    else
        if [ -d "$g/rebase-apply" ]; then
            __git_eread "$g/rebase-apply/next" step;
            __git_eread "$g/rebase-apply/last" total;
            if [ -f "$g/rebase-apply/rebasing" ]; then
                __git_eread "$g/rebase-apply/head-name" b;
                r="|REBASE";
            else
                if [ -f "$g/rebase-apply/applying" ]; then
                    r="|AM";
                else
                    r="|AM/REBASE";
                fi;
            fi;
        else
            if [ -f "$g/MERGE_HEAD" ]; then
                r="|MERGING";
            else
                if __git_sequencer_status; then
                    :;
                else
                    if [ -f "$g/BISECT_LOG" ]; then
                        r="|BISECTING";
                    fi;
                fi;
            fi;
        fi;
        if [ -n "$b" ]; then
            :;
        else
            if [ -h "$g/HEAD" ]; then
                b="$(git symbolic-ref HEAD 2>/dev/null)";
            else
                local head="";
                if ! __git_eread "$g/HEAD" head; then
                    return $exit;
                fi;
                b="${head#ref: }";
                if [ "$head" = "$b" ]; then
                    detached=yes;
                    b="$(
				case "${GIT_PS1_DESCRIBE_STYLE-}" in
				(contains)
					git describe --contains HEAD ;;
				(branch)
					git describe --contains --all HEAD ;;
				(tag)
					git describe --tags HEAD ;;
				(describe)
					git describe HEAD ;;
				(* | default)
					git describe --tags --exact-match HEAD ;;
				esac 2>/dev/null)" || b="$short_sha...";
                    b="($b)";
                fi;
            fi;
        fi;
    fi;
    if [ -n "$step" ] && [ -n "$total" ]; then
        r="$r $step/$total";
    fi;
    local w="";
    local i="";
    local s="";
    local u="";
    local h="";
    local c="";
    local p="";
    if [ "true" = "$inside_gitdir" ]; then
        if [ "true" = "$bare_repo" ]; then
            c="BARE:";
        else
            b="GIT_DIR!";
        fi;
    else
        if [ "true" = "$inside_worktree" ]; then
            if [ -n "${GIT_PS1_SHOWDIRTYSTATE-}" ] && [ "$(git config --bool bash.showDirtyState)" != "false" ]; then
                git diff --no-ext-diff --quiet || w="*";
                git diff --no-ext-diff --cached --quiet || i="+";
                if [ -z "$short_sha" ] && [ -z "$i" ]; then
                    i="#";
                fi;
            fi;
            if [ -n "${GIT_PS1_SHOWSTASHSTATE-}" ] && git rev-parse --verify --quiet refs/stash > /dev/null; then
                s="$";
            fi;
            if [ -n "${GIT_PS1_SHOWUNTRACKEDFILES-}" ] && [ "$(git config --bool bash.showUntrackedFiles)" != "false" ] && git ls-files --others --exclude-standard --directory --no-empty-directory --error-unmatch -- ':/*' > /dev/null 2> /dev/null; then
                u="%${ZSH_VERSION+%}";
            fi;
            if [ -n "${GIT_PS1_COMPRESSSPARSESTATE-}" ] && [ "$(git config --bool core.sparseCheckout)" = "true" ]; then
                h="?";
            fi;
            if [ -n "${GIT_PS1_SHOWUPSTREAM-}" ]; then
                __git_ps1_show_upstream;
            fi;
        fi;
    fi;
    local z="${GIT_PS1_STATESEPARATOR-" "}";
    if [ -n "${GIT_PS1_SHOWCOLORHINTS-}" ]; then
        if [ $pcmode = yes ] || [ -n "${ZSH_VERSION-}" ]; then
            __git_ps1_colorize_gitstring;
        fi;
    fi;
    b=${b##refs/heads/};
    if [ $pcmode = yes ] && [ $ps1_expanded = yes ]; then
        __git_ps1_branch_name=$b;
        b="\${__git_ps1_branch_name}";
    fi;
    local f="$h$w$i$s$u";
    local gitstring="$c$b${f:+$z$f}${sparse}$r$p";
    if [ $pcmode = yes ]; then
        if [ "${__git_printf_supports_v-}" != yes ]; then
            gitstring=$(printf -- "$printf_format" "$gitstring");
        else
            printf -v gitstring -- "$printf_format" "$gitstring";
        fi;
        PS1="$ps1pc_start$gitstring$ps1pc_end";
    else
        printf -- "$printf_format" "$gitstring";
    fi;
    return $exit
}
__git_ps1_colorize_gitstring () 
{ 
    if [[ -n ${ZSH_VERSION-} ]]; then
        local c_red='%F{red}';
        local c_green='%F{green}';
        local c_lblue='%F{blue}';
        local c_clear='%f';
    else
        local c_red='\[\e[31m\]';
        local c_green='\[\e[32m\]';
        local c_lblue='\[\e[1;34m\]';
        local c_clear='\[\e[0m\]';
    fi;
    local bad_color=$c_red;
    local ok_color=$c_green;
    local flags_color="$c_lblue";
    local branch_color="";
    if [ $detached = no ]; then
        branch_color="$ok_color";
    else
        branch_color="$bad_color";
    fi;
    c="$branch_color$c";
    z="$c_clear$z";
    if [ "$w" = "*" ]; then
        w="$bad_color$w";
    fi;
    if [ -n "$i" ]; then
        i="$ok_color$i";
    fi;
    if [ -n "$s" ]; then
        s="$flags_color$s";
    fi;
    if [ -n "$u" ]; then
        u="$bad_color$u";
    fi;
    r="$c_clear$r"
}
__git_ps1_show_upstream () 
{ 
    local key value;
    local svn_remote svn_url_pattern count n;
    local upstream=git legacy="" verbose="" name="";
    svn_remote=();
    local output="$(git config -z --get-regexp '^(svn-remote\..*\.url|bash\.showupstream)$' 2>/dev/null | tr '\0\n' '\n ')";
    while read -r key value; do
        case "$key" in 
            bash.showupstream)
                GIT_PS1_SHOWUPSTREAM="$value";
                if [[ -z "${GIT_PS1_SHOWUPSTREAM}" ]]; then
                    p="";
                    return;
                fi
            ;;
            svn-remote.*.url)
                svn_remote[$((${#svn_remote[@]} + 1))]="$value";
                svn_url_pattern="$svn_url_pattern\\|$value";
                upstream=svn+git
            ;;
        esac;
    done <<< "$output";
    local option;
    for option in ${GIT_PS1_SHOWUPSTREAM};
    do
        case "$option" in 
            git | svn)
                upstream="$option"
            ;;
            verbose)
                verbose=1
            ;;
            legacy)
                legacy=1
            ;;
            name)
                name=1
            ;;
        esac;
    done;
    case "$upstream" in 
        git)
            upstream="@{upstream}"
        ;;
        svn*)
            local -a svn_upstream;
            svn_upstream=($(git log --first-parent -1 					--grep="^git-svn-id: \(${svn_url_pattern#??}\)" 2>/dev/null));
            if [[ 0 -ne ${#svn_upstream[@]} ]]; then
                svn_upstream=${svn_upstream[${#svn_upstream[@]} - 2]};
                svn_upstream=${svn_upstream%@*};
                local n_stop="${#svn_remote[@]}";
                for ((n=1; n <= n_stop; n++))
                do
                    svn_upstream=${svn_upstream#${svn_remote[$n]}};
                done;
                if [[ -z "$svn_upstream" ]]; then
                    upstream=${GIT_SVN_ID:-git-svn};
                else
                    upstream=${svn_upstream#/};
                fi;
            else
                if [[ "svn+git" = "$upstream" ]]; then
                    upstream="@{upstream}";
                fi;
            fi
        ;;
    esac;
    if [[ -z "$legacy" ]]; then
        count="$(git rev-list --count --left-right 				"$upstream"...HEAD 2>/dev/null)";
    else
        local commits;
        if commits="$(git rev-list --left-right "$upstream"...HEAD 2>/dev/null)"; then
            local commit behind=0 ahead=0;
            for commit in $commits;
            do
                case "$commit" in 
                    "<"*)
                        ((behind++))
                    ;;
                    *)
                        ((ahead++))
                    ;;
                esac;
            done;
            count="$behind	$ahead";
        else
            count="";
        fi;
    fi;
    if [[ -z "$verbose" ]]; then
        case "$count" in 
            "")
                p=""
            ;;
            "0	0")
                p="="
            ;;
            "0	"*)
                p=">"
            ;;
            *"	0")
                p="<"
            ;;
            *)
                p="<>"
            ;;
        esac;
    else
        case "$count" in 
            "")
                p=""
            ;;
            "0	0")
                p=" u="
            ;;
            "0	"*)
                p=" u+${count#0	}"
            ;;
            *"	0")
                p=" u-${count%	0}"
            ;;
            *)
                p=" u+${count#*	}-${count%	*}"
            ;;
        esac;
        if [[ -n "$count" && -n "$name" ]]; then
            __git_ps1_upstream_name=$(git rev-parse 				--abbrev-ref "$upstream" 2>/dev/null);
            if [ $pcmode = yes ] && [ $ps1_expanded = yes ]; then
                p="$p \${__git_ps1_upstream_name}";
            else
                p="$p ${__git_ps1_upstream_name}";
                unset __git_ps1_upstream_name;
            fi;
        fi;
    fi
}
__git_reassemble_comp_words_by_ref () 
{ 
    local exclude i j first;
    exclude="${1//[^$COMP_WORDBREAKS]}";
    cword_=$COMP_CWORD;
    if [ -z "$exclude" ]; then
        words_=("${COMP_WORDS[@]}");
        return;
    fi;
    for ((i=0, j=0; i < ${#COMP_WORDS[@]}; i++, j++))
    do
        first=t;
        while [ $i -gt 0 ] && [ -n "${COMP_WORDS[$i]}" ] && [ "${COMP_WORDS[$i]//[^$exclude]}" = "${COMP_WORDS[$i]}" ]; do
            if [ $j -ge 2 ] && [ -n "$first" ]; then
                ((j--));
            fi;
            first=;
            words_[$j]=${words_[j]}${COMP_WORDS[i]};
            if [ $i = $COMP_CWORD ]; then
                cword_=$j;
            fi;
            if (($i < ${#COMP_WORDS[@]} - 1)); then
                ((i++));
            else
                return;
            fi;
        done;
        words_[$j]=${words_[j]}${COMP_WORDS[i]};
        if [ $i = $COMP_CWORD ]; then
            cword_=$j;
        fi;
    done
}
__git_refs () 
{ 
    local i hash dir track="${2-}";
    local list_refs_from=path remote="${1-}";
    local format refs;
    local pfx="${3-}" cur_="${4-$cur}" sfx="${5-}";
    local match="${4-}";
    local fer_pfx="${pfx//\%/%%}";
    __git_find_repo_path;
    dir="$__git_repo_path";
    if [ -z "$remote" ]; then
        if [ -z "$dir" ]; then
            return;
        fi;
    else
        if __git_is_configured_remote "$remote"; then
            list_refs_from=remote;
        else
            if [ -d "$remote/.git" ]; then
                dir="$remote/.git";
            else
                if [ -d "$remote" ]; then
                    dir="$remote";
                else
                    list_refs_from=url;
                fi;
            fi;
        fi;
    fi;
    if [ "$list_refs_from" = path ]; then
        if [[ "$cur_" == ^* ]]; then
            pfx="$pfx^";
            fer_pfx="$fer_pfx^";
            cur_=${cur_#^};
            match=${match#^};
        fi;
        case "$cur_" in 
            refs | refs/*)
                format="refname";
                refs=("$match*" "$match*/**");
                track=""
            ;;
            *)
                for i in HEAD FETCH_HEAD ORIG_HEAD MERGE_HEAD REBASE_HEAD CHERRY_PICK_HEAD;
                do
                    case "$i" in 
                        $match*)
                            if [ -e "$dir/$i" ]; then
                                echo "$pfx$i$sfx";
                            fi
                        ;;
                    esac;
                done;
                format="refname:strip=2";
                refs=("refs/tags/$match*" "refs/tags/$match*/**" "refs/heads/$match*" "refs/heads/$match*/**" "refs/remotes/$match*" "refs/remotes/$match*/**")
            ;;
        esac;
        __git_dir="$dir" __git for-each-ref --format="$fer_pfx%($format)$sfx" "${refs[@]}";
        if [ -n "$track" ]; then
            __git_dwim_remote_heads "$pfx" "$match" "$sfx";
        fi;
        return;
    fi;
    case "$cur_" in 
        refs | refs/*)
            __git ls-remote "$remote" "$match*" | while read -r hash i; do
                case "$i" in 
                    *^{})

                    ;;
                    *)
                        echo "$pfx$i$sfx"
                    ;;
                esac;
            done
        ;;
        *)
            if [ "$list_refs_from" = remote ]; then
                case "HEAD" in 
                    $match*)
                        echo "${pfx}HEAD$sfx"
                    ;;
                esac;
                __git for-each-ref --format="$fer_pfx%(refname:strip=3)$sfx" "refs/remotes/$remote/$match*" "refs/remotes/$remote/$match*/**";
            else
                local query_symref;
                case "HEAD" in 
                    $match*)
                        query_symref="HEAD"
                    ;;
                esac;
                __git ls-remote "$remote" $query_symref "refs/tags/$match*" "refs/heads/$match*" "refs/remotes/$match*" | while read -r hash i; do
                    case "$i" in 
                        *^{})

                        ;;
                        refs/*)
                            echo "$pfx${i#refs/*/}$sfx"
                        ;;
                        *)
                            echo "$pfx$i$sfx"
                        ;;
                    esac;
                done;
            fi
        ;;
    esac
}
__git_refs2 () 
{ 
    local i;
    for i in $(__git_refs "$1");
    do
        echo "$i:$i";
    done
}
__git_refs_remotes () 
{ 
    local i hash;
    __git ls-remote "$1" 'refs/heads/*' | while read -r hash i; do
        echo "$i:refs/remotes/$1/${i#refs/heads/}";
    done
}
__git_remote_heads () 
{ 
    local pfx="${1-}" cur_="${2-}" sfx="${3-}";
    __git for-each-ref --format="${pfx//\%/%%}%(refname:strip=2)$sfx" "refs/remotes/$cur_*" "refs/remotes/$cur_*/**"
}
__git_remotes () 
{ 
    __git_find_repo_path;
    test -d "$__git_repo_path/remotes" && _omb_util_alias_init_ls -1 "$__git_repo_path/remotes";
    __git remote
}
__git_sequencer_status () 
{ 
    local todo;
    if test -f "$g/CHERRY_PICK_HEAD"; then
        r="|CHERRY-PICKING";
        return 0;
    else
        if test -f "$g/REVERT_HEAD"; then
            r="|REVERTING";
            return 0;
        else
            if __git_eread "$g/sequencer/todo" todo; then
                case "$todo" in 
                    p[\ \	] | pick[\ \	]*)
                        r="|CHERRY-PICKING";
                        return 0
                    ;;
                    revert[\ \	]*)
                        r="|REVERTING";
                        return 0
                    ;;
                esac;
            fi;
        fi;
    fi;
    return 1
}
__git_support_parseopt_helper () 
{ 
    test -n "$__git_cmds_with_parseopt_helper" || __git_cmds_with_parseopt_helper="$(__git --list-cmds=parseopt)";
    case " $__git_cmds_with_parseopt_helper " in 
        *" $1 "*)
            return 0
        ;;
        *)
            return 1
        ;;
    esac
}
__git_tags () 
{ 
    local pfx="${1-}" cur_="${2-}" sfx="${3-}";
    __git for-each-ref --format="${pfx//\%/%%}%(refname:strip=2)$sfx" "refs/tags/$cur_*" "refs/tags/$cur_*/**"
}
__git_wrap__git_main () 
{ 
    __git_func_wrap __git_main
}
__git_wrap__gitk_main () 
{ 
    __git_func_wrap __gitk_main
}
__gitcomp () 
{ 
    local cur_="${3-$cur}";
    case "$cur_" in 
        *=)

        ;;
        --no-*)
            local c i=0 IFS=' 	
';
            for c in $1;
            do
                if [[ $c == "--" ]]; then
                    continue;
                fi;
                c="$c${4-}";
                if [[ $c == "$cur_"* ]]; then
                    case $c in 
                        --*= | *.)

                        ;;
                        *)
                            c="$c "
                        ;;
                    esac;
                    COMPREPLY[i++]="${2-}$c";
                fi;
            done
        ;;
        *)
            local c i=0 IFS=' 	
';
            for c in $1;
            do
                if [[ $c == "--" ]]; then
                    c="--no-...${4-}";
                    if [[ $c == "$cur_"* ]]; then
                        COMPREPLY[i++]="${2-}$c ";
                    fi;
                    break;
                fi;
                c="$c${4-}";
                if [[ $c == "$cur_"* ]]; then
                    case $c in 
                        *= | *.)

                        ;;
                        *)
                            c="$c "
                        ;;
                    esac;
                    COMPREPLY[i++]="${2-}$c";
                fi;
            done
        ;;
    esac
}
__gitcomp_builtin () 
{ 
    local cmd="$1";
    local incl="${2-}";
    local excl="${3-}";
    local var=__gitcomp_builtin_"${cmd//-/_}";
    local options;
    eval "options=\${$var-}";
    if [ -z "$options" ]; then
        local completion_helper;
        if [ "${GIT_COMPLETION_SHOW_ALL-}" = "1" ]; then
            completion_helper="--git-completion-helper-all";
        else
            completion_helper="--git-completion-helper";
        fi;
        options=" $incl $(__git ${cmd/_/ } $completion_helper) " || return;
        for i in $excl;
        do
            options="${options/ $i / }";
        done;
        eval "$var=\"$options\"";
    fi;
    __gitcomp "$options"
}
__gitcomp_direct () 
{ 
    local IFS='
';
    COMPREPLY=($1)
}
__gitcomp_direct_append () 
{ 
    local IFS='
';
    COMPREPLY+=($1)
}
__gitcomp_file () 
{ 
    local IFS='
';
    __gitcompadd "$1" "${2-}" "${3-$cur}" "";
    compopt -o filenames +o nospace 2> /dev/null || compgen -f /non-existing-dir/ > /dev/null || true
}
__gitcomp_file_direct () 
{ 
    local IFS='
';
    COMPREPLY=($1);
    compopt -o filenames +o nospace 2> /dev/null || compgen -f /non-existing-dir/ > /dev/null || true
}
__gitcomp_nl () 
{ 
    COMPREPLY=();
    __gitcomp_nl_append "$@"
}
__gitcomp_nl_append () 
{ 
    local IFS='
';
    __gitcompappend "$1" "${2-}" "${3-$cur}" "${4- }"
}
__gitcompadd () 
{ 
    COMPREPLY=();
    __gitcompappend "$@"
}
__gitcompappend () 
{ 
    local x i=${#COMPREPLY[@]};
    for x in $1;
    do
        if [[ "$x" == "$3"* ]]; then
            COMPREPLY[i++]="$2$x$4";
        fi;
    done
}
__gitdir () 
{ 
    if [ -z "${1-}" ]; then
        __git_find_repo_path || return 1;
        echo "$__git_repo_path";
    else
        if [ -d "$1/.git" ]; then
            echo "$1/.git";
        else
            echo "$1";
        fi;
    fi
}
__gitk_main () 
{ 
    __git_has_doubledash && return;
    local __git_repo_path;
    __git_find_repo_path;
    local merge="";
    if [ -f "$__git_repo_path/MERGE_HEAD" ]; then
        merge="--merge";
    fi;
    case "$cur" in 
        --*)
            __gitcomp "
			$__git_log_common_options
			$__git_log_gitk_options
			$merge
			";
            return
        ;;
    esac;
    __git_complete_revlist
}
__gum_contains_word () 
{ 
    local w word=$1;
    shift;
    for w in "$@";
    do
        [[ $w = "$word" ]] && return;
    done;
    return 1
}
__gum_debug () 
{ 
    if [[ -n ${BASH_COMP_DEBUG_FILE:-} ]]; then
        echo "$*" >> "${BASH_COMP_DEBUG_FILE}";
    fi
}
__gum_handle_command () 
{ 
    __gum_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}";
    local next_command;
    if [[ -n ${last_command} ]]; then
        next_command="_${last_command}_${words[c]//:/__}";
    else
        if [[ $c -eq 0 ]]; then
            next_command="_gum_root_command";
        else
            next_command="_${words[c]//:/__}";
        fi;
    fi;
    c=$((c+1));
    __gum_debug "${FUNCNAME[0]}: looking for ${next_command}";
    declare -F "$next_command" > /dev/null && $next_command
}
__gum_handle_filename_extension_flag () 
{ 
    local ext="$1";
    _filedir "@(${ext})"
}
__gum_handle_flag () 
{ 
    __gum_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}";
    local flagname=${words[c]};
    local flagvalue="";
    if [[ ${words[c]} == *"="* ]]; then
        flagvalue=${flagname#*=};
        flagname=${flagname%=*};
        flagname="${flagname}=";
    fi;
    __gum_debug "${FUNCNAME[0]}: looking for ${flagname}";
    if __gum_contains_word "${flagname}" "${must_have_one_flag[@]}"; then
        must_have_one_flag=();
    fi;
    if __gum_contains_word "${flagname}" "${local_nonpersistent_flags[@]}"; then
        commands=();
    fi;
    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
        if [ -n "${flagvalue}" ]; then
            flaghash[${flagname}]=${flagvalue};
        else
            if [ -n "${words[ $((c+1)) ]}" ]; then
                flaghash[${flagname}]=${words[ $((c+1)) ]};
            else
                flaghash[${flagname}]="true";
            fi;
        fi;
    fi;
    if [[ ${words[c]} != *"="* ]] && __gum_contains_word "${words[c]}" "${two_word_flags[@]}"; then
        __gum_debug "${FUNCNAME[0]}: found a flag ${words[c]}, skip the next argument";
        c=$((c+1));
        if [[ $c -eq $cword ]]; then
            commands=();
        fi;
    fi;
    c=$((c+1))
}
__gum_handle_go_custom_completion () 
{ 
    __gum_debug "${FUNCNAME[0]}: cur is ${cur}, words[*] is ${words[*]}, #words[@] is ${#words[@]}";
    local shellCompDirectiveError=1;
    local shellCompDirectiveNoSpace=2;
    local shellCompDirectiveNoFileComp=4;
    local shellCompDirectiveFilterFileExt=8;
    local shellCompDirectiveFilterDirs=16;
    local out requestComp lastParam lastChar comp directive args;
    args=("${words[@]:1}");
    requestComp="GUM_ACTIVE_HELP=0 ${words[0]} completion completeNoDesc ${args[*]}";
    lastParam=${words[$((${#words[@]}-1))]};
    lastChar=${lastParam:$((${#lastParam}-1)):1};
    __gum_debug "${FUNCNAME[0]}: lastParam ${lastParam}, lastChar ${lastChar}";
    if [ -z "${cur}" ] && [ "${lastChar}" != "=" ]; then
        __gum_debug "${FUNCNAME[0]}: Adding extra empty parameter";
        requestComp="${requestComp} \"\"";
    fi;
    __gum_debug "${FUNCNAME[0]}: calling ${requestComp}";
    out=$(eval "${requestComp}" 2>/dev/null);
    directive=${out##*:};
    out=${out%:*};
    if [ "${directive}" = "${out}" ]; then
        directive=0;
    fi;
    __gum_debug "${FUNCNAME[0]}: the completion directive is: ${directive}";
    __gum_debug "${FUNCNAME[0]}: the completions are: ${out}";
    if [ $((directive & shellCompDirectiveError)) -ne 0 ]; then
        __gum_debug "${FUNCNAME[0]}: received error from custom completion go code";
        return;
    else
        if [ $((directive & shellCompDirectiveNoSpace)) -ne 0 ]; then
            if [[ $(type -t compopt) = "builtin" ]]; then
                __gum_debug "${FUNCNAME[0]}: activating no space";
                compopt -o nospace;
            fi;
        fi;
        if [ $((directive & shellCompDirectiveNoFileComp)) -ne 0 ]; then
            if [[ $(type -t compopt) = "builtin" ]]; then
                __gum_debug "${FUNCNAME[0]}: activating no file completion";
                compopt +o default;
            fi;
        fi;
    fi;
    if [ $((directive & shellCompDirectiveFilterFileExt)) -ne 0 ]; then
        local fullFilter filter filteringCmd;
        for filter in ${out};
        do
            fullFilter+="$filter|";
        done;
        filteringCmd="_filedir $fullFilter";
        __gum_debug "File filtering command: $filteringCmd";
        $filteringCmd;
    else
        if [ $((directive & shellCompDirectiveFilterDirs)) -ne 0 ]; then
            local subdir;
            subdir=$(printf "%s" "${out}");
            if [ -n "$subdir" ]; then
                __gum_debug "Listing directories in $subdir";
                __gum_handle_subdirs_in_dir_flag "$subdir";
            else
                __gum_debug "Listing directories in .";
                _filedir -d;
            fi;
        else
            while IFS='' read -r comp; do
                COMPREPLY+=("$comp");
            done < <(compgen -W "${out}" -- "$cur");
        fi;
    fi
}
__gum_handle_noun () 
{ 
    __gum_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}";
    if __gum_contains_word "${words[c]}" "${must_have_one_noun[@]}"; then
        must_have_one_noun=();
    else
        if __gum_contains_word "${words[c]}" "${noun_aliases[@]}"; then
            must_have_one_noun=();
        fi;
    fi;
    nouns+=("${words[c]}");
    c=$((c+1))
}
__gum_handle_reply () 
{ 
    __gum_debug "${FUNCNAME[0]}";
    local comp;
    case $cur in 
        -*)
            if [[ $(type -t compopt) = "builtin" ]]; then
                compopt -o nospace;
            fi;
            local allflags;
            if [ ${#must_have_one_flag[@]} -ne 0 ]; then
                allflags=("${must_have_one_flag[@]}");
            else
                allflags=("${flags[*]} ${two_word_flags[*]}");
            fi;
            while IFS='' read -r comp; do
                COMPREPLY+=("$comp");
            done < <(compgen -W "${allflags[*]}" -- "$cur");
            if [[ $(type -t compopt) = "builtin" ]]; then
                [[ "${COMPREPLY[0]}" == *= ]] || compopt +o nospace;
            fi;
            if [[ $cur == *=* ]]; then
                if [[ $(type -t compopt) = "builtin" ]]; then
                    compopt +o nospace;
                fi;
                local index flag;
                flag="${cur%=*}";
                __gum_index_of_word "${flag}" "${flags_with_completion[@]}";
                COMPREPLY=();
                if [[ ${index} -ge 0 ]]; then
                    PREFIX="";
                    cur="${cur#*=}";
                    ${flags_completion[${index}]};
                    if [ -n "${ZSH_VERSION:-}" ]; then
                        eval "COMPREPLY=( \"\${COMPREPLY[@]/#/${flag}=}\" )";
                    fi;
                fi;
            fi;
            if [[ -z "${flag_parsing_disabled}" ]]; then
                return 0;
            fi
        ;;
    esac;
    local index;
    __gum_index_of_word "${prev}" "${flags_with_completion[@]}";
    if [[ ${index} -ge 0 ]]; then
        ${flags_completion[${index}]};
        return;
    fi;
    if [[ ${cur} != "${words[cword]}" ]]; then
        return;
    fi;
    local completions;
    completions=("${commands[@]}");
    if [[ ${#must_have_one_noun[@]} -ne 0 ]]; then
        completions+=("${must_have_one_noun[@]}");
    else
        if [[ -n "${has_completion_function}" ]]; then
            __gum_handle_go_custom_completion;
        fi;
    fi;
    if [[ ${#must_have_one_flag[@]} -ne 0 ]]; then
        completions+=("${must_have_one_flag[@]}");
    fi;
    while IFS='' read -r comp; do
        COMPREPLY+=("$comp");
    done < <(compgen -W "${completions[*]}" -- "$cur");
    if [[ ${#COMPREPLY[@]} -eq 0 && ${#noun_aliases[@]} -gt 0 && ${#must_have_one_noun[@]} -ne 0 ]]; then
        while IFS='' read -r comp; do
            COMPREPLY+=("$comp");
        done < <(compgen -W "${noun_aliases[*]}" -- "$cur");
    fi;
    if [[ ${#COMPREPLY[@]} -eq 0 ]]; then
        if declare -F __gum_custom_func > /dev/null; then
            __gum_custom_func;
        else
            declare -F __custom_func > /dev/null && __custom_func;
        fi;
    fi;
    if declare -F __ltrim_colon_completions > /dev/null; then
        __ltrim_colon_completions "$cur";
    fi;
    if [[ "${#COMPREPLY[@]}" -eq "1" ]] && [[ $(type -t compopt) = "builtin" ]] && [[ "${COMPREPLY[0]}" == --*= ]]; then
        compopt -o nospace;
    fi
}
__gum_handle_subdirs_in_dir_flag () 
{ 
    local dir="$1";
    pushd "${dir}" > /dev/null 2>&1 && _filedir -d && popd > /dev/null 2>&1 || return
}
__gum_handle_word () 
{ 
    if [[ $c -ge $cword ]]; then
        __gum_handle_reply;
        return;
    fi;
    __gum_debug "${FUNCNAME[0]}: c is $c words[c] is ${words[c]}";
    if [[ "${words[c]}" == -* ]]; then
        __gum_handle_flag;
    else
        if __gum_contains_word "${words[c]}" "${commands[@]}"; then
            __gum_handle_command;
        else
            if [[ $c -eq 0 ]]; then
                __gum_handle_command;
            else
                if __gum_contains_word "${words[c]}" "${command_aliases[@]}"; then
                    if [[ -z "${BASH_VERSION:-}" || "${BASH_VERSINFO[0]:-}" -gt 3 ]]; then
                        words[c]=${aliashash[${words[c]}]};
                        __gum_handle_command;
                    else
                        __gum_handle_noun;
                    fi;
                else
                    __gum_handle_noun;
                fi;
            fi;
        fi;
    fi;
    __gum_handle_word
}
__gum_index_of_word () 
{ 
    local w word=$1;
    shift;
    index=0;
    for w in "$@";
    do
        [[ $w = "$word" ]] && return;
        index=$((index+1));
    done;
    index=-1
}
__gum_init_completion () 
{ 
    COMPREPLY=();
    _get_comp_words_by_ref "$@" cur prev words cword
}
__kubectl_debug () 
{ 
    if [[ -n ${BASH_COMP_DEBUG_FILE-} ]]; then
        echo "$*" >> "${BASH_COMP_DEBUG_FILE}";
    fi
}
__kubectl_extract_activeHelp () 
{ 
    local activeHelpMarker="_activeHelp_ ";
    local endIndex=${#activeHelpMarker};
    while IFS='' read -r comp; do
        if [[ ${comp:0:endIndex} == $activeHelpMarker ]]; then
            comp=${comp:endIndex};
            __kubectl_debug "ActiveHelp found: $comp";
            if [[ -n $comp ]]; then
                activeHelp+=("$comp");
            fi;
        else
            completions+=("$comp");
        fi;
    done <<< "${out}"
}
__kubectl_format_comp_descriptions () 
{ 
    local tab='	';
    local comp desc maxdesclength;
    local longest=$1;
    local i ci;
    for ci in ${!COMPREPLY[*]};
    do
        comp=${COMPREPLY[ci]};
        if [[ "$comp" == *$tab* ]]; then
            __kubectl_debug "Original comp: $comp";
            desc=${comp#*$tab};
            comp=${comp%%$tab*};
            maxdesclength=$(( COLUMNS - longest - 4 ));
            if ((maxdesclength > 8)); then
                for ((i = ${#comp} ; i < longest ; i++))
                do
                    comp+=" ";
                done;
            else
                maxdesclength=$(( COLUMNS - ${#comp} - 4 ));
            fi;
            if ((maxdesclength > 0)); then
                if ((${#desc} > maxdesclength)); then
                    desc=${desc:0:$(( maxdesclength - 1 ))};
                    desc+="…";
                fi;
                comp+="  ($desc)";
            fi;
            COMPREPLY[ci]=$comp;
            __kubectl_debug "Final comp: $comp";
        fi;
    done
}
__kubectl_get_completion_results () 
{ 
    local requestComp lastParam lastChar args;
    args=("${words[@]:1}");
    requestComp="${words[0]} __complete ${args[*]}";
    lastParam=${words[$((${#words[@]}-1))]};
    lastChar=${lastParam:$((${#lastParam}-1)):1};
    __kubectl_debug "lastParam ${lastParam}, lastChar ${lastChar}";
    if [[ -z ${cur} && ${lastChar} != = ]]; then
        __kubectl_debug "Adding extra empty parameter";
        requestComp="${requestComp} ''";
    fi;
    if [[ ${cur} == -*=* ]]; then
        cur="${cur#*=}";
    fi;
    __kubectl_debug "Calling ${requestComp}";
    out=$(eval "${requestComp}" 2>/dev/null);
    directive=${out##*:};
    out=${out%:*};
    if [[ ${directive} == "${out}" ]]; then
        directive=0;
    fi;
    __kubectl_debug "The completion directive is: ${directive}";
    __kubectl_debug "The completions are: ${out}"
}
__kubectl_handle_completion_types () 
{ 
    __kubectl_debug "__kubectl_handle_completion_types: COMP_TYPE is $COMP_TYPE";
    case $COMP_TYPE in 
        37 | 42)
            local tab='	' comp;
            while IFS='' read -r comp; do
                [[ -z $comp ]] && continue;
                comp=${comp%%$tab*};
                if [[ $comp == "$cur"* ]]; then
                    COMPREPLY+=("$comp");
                fi;
            done < <(printf "%s\n" "${completions[@]}")
        ;;
        *)
            __kubectl_handle_standard_completion_case
        ;;
    esac
}
__kubectl_handle_special_char () 
{ 
    local comp="$1";
    local char=$2;
    if [[ "$comp" == *${char}* && "$COMP_WORDBREAKS" == *${char}* ]]; then
        local word=${comp%"${comp##*${char}}"};
        local idx=${#COMPREPLY[*]};
        while ((--idx >= 0)); do
            COMPREPLY[idx]=${COMPREPLY[idx]#"$word"};
        done;
    fi
}
__kubectl_handle_standard_completion_case () 
{ 
    local tab='	' comp;
    if [[ "${completions[*]}" != *$tab* ]]; then
        IFS='
' read -ra COMPREPLY -d '' < <(compgen -W "${completions[*]}" -- "$cur");
        return 0;
    fi;
    local longest=0;
    local compline;
    while IFS='' read -r compline; do
        [[ -z $compline ]] && continue;
        comp=${compline%%$tab*};
        [[ $comp == "$cur"* ]] || continue;
        COMPREPLY+=("$compline");
        if ((${#comp}>longest)); then
            longest=${#comp};
        fi;
    done < <(printf "%s\n" "${completions[@]}");
    if ((${#COMPREPLY[*]} == 1)); then
        __kubectl_debug "COMPREPLY[0]: ${COMPREPLY[0]}";
        comp="${COMPREPLY[0]%%$tab*}";
        __kubectl_debug "Removed description from single completion, which is now: ${comp}";
        COMPREPLY[0]=$comp;
    else
        __kubectl_format_comp_descriptions $longest;
    fi
}
__kubectl_init_completion () 
{ 
    COMPREPLY=();
    _get_comp_words_by_ref "$@" cur prev words cword
}
__kubectl_process_completion_results () 
{ 
    local shellCompDirectiveError=1;
    local shellCompDirectiveNoSpace=2;
    local shellCompDirectiveNoFileComp=4;
    local shellCompDirectiveFilterFileExt=8;
    local shellCompDirectiveFilterDirs=16;
    local shellCompDirectiveKeepOrder=32;
    if (((directive & shellCompDirectiveError) != 0)); then
        __kubectl_debug "Received error from custom completion go code";
        return;
    else
        if (((directive & shellCompDirectiveNoSpace) != 0)); then
            if [[ $(type -t compopt) == builtin ]]; then
                __kubectl_debug "Activating no space";
                compopt -o nospace;
            else
                __kubectl_debug "No space directive not supported in this version of bash";
            fi;
        fi;
        if (((directive & shellCompDirectiveKeepOrder) != 0)); then
            if [[ $(type -t compopt) == builtin ]]; then
                if [[ ${BASH_VERSINFO[0]} -lt 4 || ( ${BASH_VERSINFO[0]} -eq 4 && ${BASH_VERSINFO[1]} -lt 4 ) ]]; then
                    __kubectl_debug "No sort directive not supported in this version of bash";
                else
                    __kubectl_debug "Activating keep order";
                    compopt -o nosort;
                fi;
            else
                __kubectl_debug "No sort directive not supported in this version of bash";
            fi;
        fi;
        if (((directive & shellCompDirectiveNoFileComp) != 0)); then
            if [[ $(type -t compopt) == builtin ]]; then
                __kubectl_debug "Activating no file completion";
                compopt +o default;
            else
                __kubectl_debug "No file completion directive not supported in this version of bash";
            fi;
        fi;
    fi;
    local completions=();
    local activeHelp=();
    __kubectl_extract_activeHelp;
    if (((directive & shellCompDirectiveFilterFileExt) != 0)); then
        local fullFilter filter filteringCmd;
        for filter in ${completions[*]};
        do
            fullFilter+="$filter|";
        done;
        filteringCmd="_filedir $fullFilter";
        __kubectl_debug "File filtering command: $filteringCmd";
        $filteringCmd;
    else
        if (((directive & shellCompDirectiveFilterDirs) != 0)); then
            local subdir;
            subdir=${completions[0]};
            if [[ -n $subdir ]]; then
                __kubectl_debug "Listing directories in $subdir";
                pushd "$subdir" > /dev/null 2>&1 && _filedir -d && popd > /dev/null 2>&1 || return;
            else
                __kubectl_debug "Listing directories in .";
                _filedir -d;
            fi;
        else
            __kubectl_handle_completion_types;
        fi;
    fi;
    __kubectl_handle_special_char "$cur" :;
    __kubectl_handle_special_char "$cur" =;
    if ((${#activeHelp[*]} != 0)); then
        printf "\n";
        printf "%s\n" "${activeHelp[@]}";
        printf "\n";
        if ( x=${PS1@P} ) 2> /dev/null; then
            printf "%s" "${PS1@P}${COMP_LINE[@]}";
        else
            printf "%s" "${COMP_LINE[@]}";
        fi;
    fi
}
__load_completion () 
{ 
    local -a dirs=(${BASH_COMPLETION_USER_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/bash-completion}/completions);
    local ifs=$IFS IFS=: dir cmd="${1##*/}" compfile;
    [[ -n $cmd ]] || return 1;
    for dir in ${XDG_DATA_DIRS:-/usr/local/share:/usr/share};
    do
        dirs+=($dir/bash-completion/completions);
    done;
    IFS=$ifs;
    if [[ $BASH_SOURCE == */* ]]; then
        dirs+=("${BASH_SOURCE%/*}/completions");
    else
        dirs+=(./completions);
    fi;
    local backslash=;
    if [[ $cmd == \\* ]]; then
        cmd="${cmd:1}";
        $(complete -p "$cmd" 2>/dev/null || echo false) "\\$cmd" && return 0;
        backslash=\\;
    fi;
    for dir in "${dirs[@]}";
    do
        [[ -d $dir ]] || continue;
        for compfile in "$cmd" "$cmd.bash" "_$cmd";
        do
            compfile="$dir/$compfile";
            if [[ -f $compfile ]] && . "$compfile" &> /dev/null; then
                [[ -n $backslash ]] && $(complete -p "$cmd") "\\$cmd";
                return 0;
            fi;
        done;
    done;
    [[ -v _xspecs[$cmd] ]] && complete -F _filedir_xspec "$cmd" "$backslash$cmd" && return 0;
    return 1
}
__ltrim_colon_completions () 
{ 
    if [[ $1 == *:* && $COMP_WORDBREAKS == *:* ]]; then
        local colon_word=${1%"${1##*:}"};
        local i=${#COMPREPLY[*]};
        while ((i-- > 0)); do
            COMPREPLY[i]=${COMPREPLY[i]#"$colon_word"};
        done;
    fi
}
__my_rvm_ruby_version () 
{ 
    local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}');
    [ "$gemset" != "" ] && gemset="@$gemset";
    local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}');
    local full="$version$gemset";
    [ "$full" != "" ] && echo "[$full]"
}
__nvm () 
{ 
    declare previous_word;
    previous_word="${COMP_WORDS[COMP_CWORD - 1]}";
    case "${previous_word}" in 
        use | run | exec | ls | list | uninstall)
            __nvm_installed_nodes
        ;;
        alias | unalias)
            __nvm_alias
        ;;
        *)
            __nvm_commands
        ;;
    esac;
    return 0
}
__nvm_alias () 
{ 
    __nvm_generate_completion "$(__nvm_aliases)"
}
__nvm_aliases () 
{ 
    declare aliases;
    aliases="";
    if [ -d "${NVM_DIR}/alias" ]; then
        aliases="$(command cd "${NVM_DIR}/alias" && command find "${PWD}" -type f | command sed "s:${PWD}/::")";
    fi;
    echo "${aliases} node stable unstable iojs"
}
__nvm_commands () 
{ 
    declare current_word;
    declare command;
    current_word="${COMP_WORDS[COMP_CWORD]}";
    COMMANDS='
    help install uninstall use run exec
    alias unalias reinstall-packages
    current list ls list-remote ls-remote
    install-latest-npm
    cache deactivate unload
    version version-remote which';
    if [ ${#COMP_WORDS[@]} == 4 ]; then
        command="${COMP_WORDS[COMP_CWORD - 2]}";
        case "${command}" in 
            alias)
                __nvm_installed_nodes
            ;;
        esac;
    else
        case "${current_word}" in 
            -*)
                __nvm_options
            ;;
            *)
                __nvm_generate_completion "${COMMANDS}"
            ;;
        esac;
    fi
}
__nvm_generate_completion () 
{ 
    declare current_word;
    current_word="${COMP_WORDS[COMP_CWORD]}";
    COMPREPLY=($(compgen -W "$1" -- "${current_word}"));
    return 0
}
__nvm_installed_nodes () 
{ 
    __nvm_generate_completion "$(nvm_ls) $(__nvm_aliases)"
}
__nvm_options () 
{ 
    OPTIONS='';
    __nvm_generate_completion "${OPTIONS}"
}
__parse_options () 
{ 
    local option option2 i IFS=' 	
,/|';
    option=;
    local -a array=($1);
    for i in "${array[@]}";
    do
        case "$i" in 
            ---*)
                break
            ;;
            --?*)
                option=$i;
                break
            ;;
            -?*)
                [[ -n $option ]] || option=$i
            ;;
            *)
                break
            ;;
        esac;
    done;
    [[ -n $option ]] || return 0;
    IFS=' 	
';
    if [[ $option =~ (\[((no|dont)-?)\]). ]]; then
        option2=${option/"${BASH_REMATCH[1]}"/};
        option2=${option2%%[<{().[]*};
        printf '%s\n' "${option2/=*/=}";
        option=${option/"${BASH_REMATCH[1]}"/"${BASH_REMATCH[2]}"};
    fi;
    option=${option%%[<{().[]*};
    printf '%s\n' "${option/=*/=}"
}
__reassemble_comp_words_by_ref () 
{ 
    local exclude i j line ref;
    if [[ -n $1 ]]; then
        exclude="[${1//[^$COMP_WORDBREAKS]/}]";
    fi;
    printf -v "$3" %s "$COMP_CWORD";
    if [[ -v exclude ]]; then
        line=$COMP_LINE;
        for ((i = 0, j = 0; i < ${#COMP_WORDS[@]}; i++, j++))
        do
            while [[ $i -gt 0 && ${COMP_WORDS[i]} == +($exclude) ]]; do
                [[ $line != [[:blank:]]* ]] && ((j >= 2)) && ((j--));
                ref="$2[$j]";
                printf -v "$ref" %s "${!ref-}${COMP_WORDS[i]}";
                ((i == COMP_CWORD)) && printf -v "$3" %s "$j";
                line=${line#*"${COMP_WORDS[i]}"};
                [[ $line == [[:blank:]]* ]] && ((j++));
                ((i < ${#COMP_WORDS[@]} - 1)) && ((i++)) || break 2;
            done;
            ref="$2[$j]";
            printf -v "$ref" %s "${!ref-}${COMP_WORDS[i]}";
            line=${line#*"${COMP_WORDS[i]}"};
            ((i == COMP_CWORD)) && printf -v "$3" %s "$j";
        done;
        ((i == COMP_CWORD)) && printf -v "$3" %s "$j";
    else
        for i in "${!COMP_WORDS[@]}";
        do
            printf -v "$2[i]" %s "${COMP_WORDS[i]}";
        done;
    fi
}
__start_gh () 
{ 
    local cur prev words cword split;
    COMPREPLY=();
    if declare -F _init_completion > /dev/null 2>&1; then
        _init_completion -n "=:" || return;
    else
        __gh_init_completion -n "=:" || return;
    fi;
    __gh_debug;
    __gh_debug "========= starting completion logic ==========";
    __gh_debug "cur is ${cur}, words[*] is ${words[*]}, #words[@] is ${#words[@]}, cword is $cword";
    words=("${words[@]:0:$cword+1}");
    __gh_debug "Truncated words[*]: ${words[*]},";
    local out directive;
    __gh_get_completion_results;
    __gh_process_completion_results
}
__start_gum () 
{ 
    local cur prev words cword split;
    declare -A flaghash 2> /dev/null || :;
    declare -A aliashash 2> /dev/null || :;
    if declare -F _init_completion > /dev/null 2>&1; then
        _init_completion -s || return;
    else
        __gum_init_completion -n "=" || return;
    fi;
    local c=0;
    local flag_parsing_disabled=;
    local flags=();
    local two_word_flags=();
    local local_nonpersistent_flags=();
    local flags_with_completion=();
    local flags_completion=();
    local commands=("gum");
    local command_aliases=();
    local must_have_one_flag=();
    local must_have_one_noun=();
    local has_completion_function="";
    local last_command="";
    local nouns=();
    local noun_aliases=();
    __gum_handle_word
}
__start_kubectl () 
{ 
    local cur prev words cword split;
    COMPREPLY=();
    if declare -F _init_completion > /dev/null 2>&1; then
        _init_completion -n =: || return;
    else
        __kubectl_init_completion -n =: || return;
    fi;
    __kubectl_debug;
    __kubectl_debug "========= starting completion logic ==========";
    __kubectl_debug "cur is ${cur}, words[*] is ${words[*]}, #words[@] is ${#words[@]}, cword is $cword";
    words=("${words[@]:0:$cword+1}");
    __kubectl_debug "Truncated words[*]: ${words[*]},";
    local out directive;
    __kubectl_get_completion_results;
    __kubectl_process_completion_results
}
_alacritty () 
{ 
    local i cur prev opts cmd;
    COMPREPLY=();
    cur="${COMP_WORDS[COMP_CWORD]}";
    prev="${COMP_WORDS[COMP_CWORD-1]}";
    cmd="";
    opts="";
    for i in ${COMP_WORDS[@]};
    do
        case "${cmd},${i}" in 
            ",$1")
                cmd="alacritty"
            ;;
            alacritty,help)
                cmd="alacritty__help"
            ;;
            alacritty,msg)
                cmd="alacritty__msg"
            ;;
            alacritty__help,help)
                cmd="alacritty__help__help"
            ;;
            alacritty__help,msg)
                cmd="alacritty__help__msg"
            ;;
            alacritty__help__msg,config)
                cmd="alacritty__help__msg__config"
            ;;
            alacritty__help__msg,create-window)
                cmd="alacritty__help__msg__create__window"
            ;;
            alacritty__msg,config)
                cmd="alacritty__msg__config"
            ;;
            alacritty__msg,create-window)
                cmd="alacritty__msg__create__window"
            ;;
            alacritty__msg,help)
                cmd="alacritty__msg__help"
            ;;
            alacritty__msg__help,config)
                cmd="alacritty__msg__help__config"
            ;;
            alacritty__msg__help,create-window)
                cmd="alacritty__msg__help__create__window"
            ;;
            alacritty__msg__help,help)
                cmd="alacritty__msg__help__help"
            ;;
            *)

            ;;
        esac;
    done;
    case "${cmd}" in 
        alacritty)
            opts="-q -v -o -e -T -h -V --print-events --ref-test --embed --config-file --socket --option --working-directory --hold --command --title --class --help --version msg help";
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]]; then
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
                return 0;
            fi;
            case "${prev}" in 
                --embed)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                --config-file)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                --socket)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                --option)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                --working-directory)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                --command)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                -e)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                --title)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                -T)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                --class)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                *)
                    COMPREPLY=()
                ;;
            esac;
            COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
            return 0
        ;;
        alacritty__help)
            opts="msg help";
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
                return 0;
            fi;
            case "${prev}" in 
                *)
                    COMPREPLY=()
                ;;
            esac;
            COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
            return 0
        ;;
        alacritty__help__help)
            opts="";
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
                return 0;
            fi;
            case "${prev}" in 
                *)
                    COMPREPLY=()
                ;;
            esac;
            COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
            return 0
        ;;
        alacritty__help__msg)
            opts="create-window config";
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
                return 0;
            fi;
            case "${prev}" in 
                *)
                    COMPREPLY=()
                ;;
            esac;
            COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
            return 0
        ;;
        alacritty__help__msg__config)
            opts="";
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
                return 0;
            fi;
            case "${prev}" in 
                *)
                    COMPREPLY=()
                ;;
            esac;
            COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
            return 0
        ;;
        alacritty__help__msg__create__window)
            opts="";
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
                return 0;
            fi;
            case "${prev}" in 
                *)
                    COMPREPLY=()
                ;;
            esac;
            COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
            return 0
        ;;
        alacritty__msg)
            opts="-s -h --socket --help create-window config help";
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
                return 0;
            fi;
            case "${prev}" in 
                --socket)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                -s)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                *)
                    COMPREPLY=()
                ;;
            esac;
            COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
            return 0
        ;;
        alacritty__msg__config)
            opts="-w -r -h --window-id --reset --help <CONFIG_OPTIONS>...";
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
                return 0;
            fi;
            case "${prev}" in 
                --window-id)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                *)
                    COMPREPLY=()
                ;;
            esac;
            COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
            return 0
        ;;
        alacritty__msg__create__window)
            opts="-e -T -h --working-directory --hold --command --title --class --help";
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
                return 0;
            fi;
            case "${prev}" in 
                --working-directory)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                --command)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                -e)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                --title)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                -T)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                --class)
                    COMPREPLY=($(compgen -f "${cur}"));
                    return 0
                ;;
                *)
                    COMPREPLY=()
                ;;
            esac;
            COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
            return 0
        ;;
        alacritty__msg__help)
            opts="create-window config help";
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
                return 0;
            fi;
            case "${prev}" in 
                *)
                    COMPREPLY=()
                ;;
            esac;
            COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
            return 0
        ;;
        alacritty__msg__help__config)
            opts="";
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
                return 0;
            fi;
            case "${prev}" in 
                *)
                    COMPREPLY=()
                ;;
            esac;
            COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
            return 0
        ;;
        alacritty__msg__help__create__window)
            opts="";
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
                return 0;
            fi;
            case "${prev}" in 
                *)
                    COMPREPLY=()
                ;;
            esac;
            COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
            return 0
        ;;
        alacritty__msg__help__help)
            opts="";
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
                return 0;
            fi;
            case "${prev}" in 
                *)
                    COMPREPLY=()
                ;;
            esac;
            COMPREPLY=($(compgen -W "${opts}" -- "${cur}"));
            return 0
        ;;
    esac
}
_allowed_groups () 
{ 
    if _complete_as_root; then
        local IFS='
';
        COMPREPLY=($(compgen -g -- "$1"));
    else
        local IFS='
 ';
        COMPREPLY=($(compgen -W             "$(id -Gn 2>/dev/null || groups 2>/dev/null)" -- "$1"));
    fi
}
_allowed_users () 
{ 
    if _complete_as_root; then
        local IFS='
';
        COMPREPLY=($(compgen -u -- "${1:-$cur}"));
    else
        local IFS='
 ';
        COMPREPLY=($(compgen -W             "$(id -un 2>/dev/null || whoami 2>/dev/null)" -- "${1:-$cur}"));
    fi
}
_apport-bug () 
{ 
    local cur dashoptions prev param;
    COMPREPLY=();
    cur=`_get_cword`;
    prev=${COMP_WORDS[COMP_CWORD-1]};
    dashoptions='-h --help --save -v --version --tag -w --window';
    case "$prev" in 
        ubuntu-bug | apport-bug)
            case "$cur" in 
                -*)
                    COMPREPLY=($( compgen -W "$dashoptions" -- $cur ))
                ;;
                *)
                    _apport_parameterless
                ;;
            esac
        ;;
        --save)
            COMPREPLY=($( compgen -o default -G "$cur*" ))
        ;;
        -w | --window)
            dashoptions="--save --tag";
            COMPREPLY=($( compgen -W "$dashoptions" -- $cur ))
        ;;
        -h | --help | -v | --version | --tag)
            return 0
        ;;
        *)
            dashoptions="--tag";
            if ! [[ "${COMP_WORDS[*]}" =~ .*--save.* ]]; then
                dashoptions="--save $dashoptions";
            fi;
            if ! [[ "${COMP_WORDS[*]}" =~ .*--window.* || "${COMP_WORDS[*]}" =~ .*\ -w\ .* ]]; then
                dashoptions="-w --window $dashoptions";
            fi;
            case "$cur" in 
                -*)
                    COMPREPLY=($( compgen -W "$dashoptions" -- $cur ))
                ;;
                *)
                    _apport_parameterless
                ;;
            esac
        ;;
    esac
}
_apport-cli () 
{ 
    local cur dashoptions prev param;
    COMPREPLY=();
    cur=`_get_cword`;
    prev=${COMP_WORDS[COMP_CWORD-1]};
    dashoptions='-h --help -f --file-bug -u --update-bug -s --symptom \
                 -c --crash-file --save -v --version --tag -w --window';
    case "$prev" in 
        apport-cli)
            case "$cur" in 
                -*)
                    COMPREPLY=($( compgen -W "$dashoptions" -- $cur ))
                ;;
                *)
                    _apport_parameterless
                ;;
            esac
        ;;
        -f | --file-bug)
            param="-P --pid -p --package -s --symptom";
            COMPREPLY=($( compgen -W "$param $(_apport_symptoms)" -- $cur))
        ;;
        -s | --symptom)
            COMPREPLY=($( compgen -W "$(_apport_symptoms)" -- $cur))
        ;;
        --save)
            COMPREPLY=($( compgen -o default -G "$cur*" ))
        ;;
        -c | --crash-file)
            COMPREPLY=($( compgen -G "${cur}*.apport"
                       compgen -G "${cur}*.crash" ))
        ;;
        -w | --window)
            dashoptions="--save --tag";
            COMPREPLY=($( compgen -W "$dashoptions" -- $cur ))
        ;;
        -h | --help | -v | --version | --tag)
            return 0
        ;;
        *)
            dashoptions='--tag';
            if ! [[ "${COMP_WORDS[*]}" =~ .*--save.* ]]; then
                dashoptions="--save $dashoptions";
            fi;
            if ! [[ "${COMP_WORDS[*]}" =~ .*--window.* || "${COMP_WORDS[*]}" =~ .*\ -w\ .* ]]; then
                dashoptions="-w --window $dashoptions";
            fi;
            if ! [[ "${COMP_WORDS[*]}" =~ .*--symptom.* || "${COMP_WORDS[*]}" =~ .*\ -s\ .* ]]; then
                dashoptions="-s --symptom $dashoptions";
            fi;
            if ! [[ "${COMP_WORDS[*]}" =~ .*--update.* || "${COMP_WORDS[*]}" =~ .*\ -u\ .* ]]; then
                dashoptions="-u --update $dashoptions";
            fi;
            if ! [[ "${COMP_WORDS[*]}" =~ .*--file-bug.* || "${COMP_WORDS[*]}" =~ .*\ -f\ .* ]]; then
                dashoptions="-f --file-bug $dashoptions";
            fi;
            if ! [[ "${COMP_WORDS[*]}" =~ .*--crash-file.* || "${COMP_WORDS[*]}" =~ .*\ -c\ .* ]]; then
                dashoptions="-c --crash-file $dashoptions";
            fi;
            case "$cur" in 
                -*)
                    COMPREPLY=($( compgen -W "$dashoptions" -- $cur ))
                ;;
                *)
                    _apport_parameterless
                ;;
            esac
        ;;
    esac
}
_apport-collect () 
{ 
    local cur prev;
    COMPREPLY=();
    cur=`_get_cword`;
    prev=${COMP_WORDS[COMP_CWORD-1]};
    case "$prev" in 
        apport-collect)
            COMPREPLY=($( compgen -W "-p --package --tag" -- $cur))
        ;;
        -p | --package)
            COMPREPLY=($( apt-cache pkgnames $cur 2> /dev/null ))
        ;;
        --tag)
            return 0
        ;;
        *)
            if [[ "${COMP_WORDS[*]}" =~ .*\ -p.* || "${COMP_WORDS[*]}" =~ .*--package.* ]]; then
                COMPREPLY=($( compgen -W "--tag" -- $cur));
            else
                COMPREPLY=($( compgen -W "-p --package --tag" -- $cur));
            fi
        ;;
    esac
}
_apport-unpack () 
{ 
    local cur prev;
    COMPREPLY=();
    cur=`_get_cword`;
    prev=${COMP_WORDS[COMP_CWORD-1]};
    case "$prev" in 
        apport-unpack)
            COMPREPLY=($( compgen -G "${cur}*.apport"
                       compgen -G "${cur}*.crash" ))
        ;;
    esac
}
_apport_parameterless () 
{ 
    local param;
    param="$dashoptions            $( apt-cache pkgnames $cur 2> /dev/null )            $( command ps axo pid | sed 1d )            $( _apport_symptoms )            $( compgen -G "${cur}*" )";
    COMPREPLY=($( compgen -W "$param" -- $cur))
}
_apport_symptoms () 
{ 
    local syms;
    if [ -r /usr/share/apport/symptoms ]; then
        for FILE in $(ls /usr/share/apport/symptoms);
        do
            if [[ ! "$FILE" =~ ^_.* && -n $(egrep "^def run\s*\(.*\):" /usr/share/apport/symptoms/$FILE) ]]; then
                syms="$syms ${FILE%.py}";
            fi;
        done;
    fi;
    echo $syms
}
_apt () 
{ 
    local sourcesdir="/etc/apt/sources.list.d";
    local cur prev words cword;
    _init_completion || return;
    local GENERIC_APT_GET_OPTIONS='
        -d --download-only
        -y --assume-yes
        --assume-no
        -u --show-upgraded
        -m --ignore-missing
        -t --target-release
        --download
        --fix-missing
        --ignore-hold
        --upgrade
        --only-upgrade
        --allow-change-held-packages
        --allow-remove-essential
        --allow-downgrades
        --print-uris
        --trivial-only
        --remove
        --arch-only
        --allow-unauthenticated
        --allow-insecure-repositories
        --install-recommends
        --install-suggests
        --no-install-recommends
        --no-install-suggests
        --fix-policy
    ';
    local COMMANDS=("list" "search" "show" "showsrc" "install" "reinstall" "remove" "purge" "autoremove" "autopurge" "update" "upgrade" "full-upgrade" "dist-upgrade" "edit-sources" "help" "source" "build-dep" "clean" "autoclean" "download" "changelog" "moo" "depends" "rdepends" "policy");
    local command i;
    for ((i=1; i < ${#words[@]}; i++ ))
    do
        if [[ " ${COMMANDS[*]} " == *" ${words[i]} "* ]]; then
            command=${words[i]};
            break;
        fi;
    done;
    case $prev in 
        -t | --target-release)
            COMPREPLY=($( compgen -W "$(apt-cache policy | grep -Eo 'a=[^,]*|n=[^,]*' | cut -f2- -d= | sort -u)" -- "$cur" ));
            return 0
        ;;
    esac;
    if [[ $cur == -* || ( -v command && $cword -le $i ) ]]; then
        case ${command-} in 
            install | reinstall | remove | purge | upgrade | dist-upgrade | full-upgrade | autoremove | autopurge)
                COMPREPLY=($( compgen -W '--show-progress
                  --fix-broken --purge --verbose-versions --auto-remove
                  -s --simulate --dry-run
                  --download
                  --fix-missing
                  --fix-policy
                  --ignore-hold
                  --force-yes
                  --trivial-only
                  --reinstall --solver
                  -t --target-release'"$GENERIC_APT_GET_OPTIONS" -- "$cur" ));
                return 0
            ;;
            update)
                COMPREPLY=($( compgen -W '--list-cleanup
                  --print-uris
                  --allow-insecure-repositories
                  ' -- "$cur" ));
                return 0
            ;;
            list)
                COMPREPLY=($( compgen -W '--installed --upgradable 
                  --manual-installed
                  -v --verbose
                  -a --all-versions
                  -t --target-release
                  ' -- "$cur" ));
                return 0
            ;;
            show)
                COMPREPLY=($( compgen -W '-a --all-versions
                  ' -- "$cur" ));
                return 0
            ;;
            depends | rdepends)
                COMPREPLY=($( compgen -W '-i
                    --important
                    --installed
                    --pre-depends
                    --depends
                    --recommends
                    --suggests
                    --replaces
                    --breaks
                    --conflicts
                    --enhances
                    --recurse
                    --implicit' -- "$cur" ));
                return 0
            ;;
            search)
                COMPREPLY=($( compgen -W '
                    -n --names-only
                    -f --full' -- "$cur" ));
                return 0
            ;;
            showsrc)
                COMPREPLY=($( compgen -W '
                    --only-source' -- "$cur" ));
                return 0
            ;;
            source)
                COMPREPLY=($( compgen -W '
                    -s --simulate --dry-run
                    -b --compile --build
                    -P --build-profiles
                    --diff-only --debian-only
                    --tar-only
                    --dsc-only
                    -t --target-release
                    '"$GENERIC_APT_GET_OPTIONS" -- "$cur" ));
                return 0
            ;;
            build-dep)
                COMPREPLY=($( compgen -W '
                    -a --host-architecture
                    -s --simulate --dry-run
                    -P --build-profiles
                    -t --target-release
                    --purge --solver
                    '"$GENERIC_APT_GET_OPTIONS" -- "$cur" ));
                return 0
            ;;
            moo)
                COMPREPLY=($( compgen -W '
                    --color
                    ' -- "$cur" ));
                return 0
            ;;
            clean | autoclean)
                COMPREPLY=($( compgen -W '
                    -s --simulate --dry-run
                    ' -- "$cur" ));
                return 0
            ;;
        esac;
        return;
    fi;
    if [[ -v command ]]; then
        case $command in 
            remove | purge | autoremove | autopurge)
                if [[ -f /etc/debian_version ]]; then
                    COMPREPLY=($(                         _xfunc dpkg _comp_dpkg_installed_packages $cur ));
                else
                    _xfunc rpm _rpm_installed_packages;
                fi;
                return 0
            ;;
            show | list | download | changelog | depends | rdepends)
                COMPREPLY=($( apt-cache --no-generate pkgnames "$cur"                     2> /dev/null ));
                return 0
            ;;
            install | reinstall)
                if [[ "$cur" == .* || "$cur" == /* || "$cur" == ~* ]]; then
                    _filedir "deb";
                else
                    COMPREPLY=($( apt-cache --no-generate pkgnames "$cur"                         2> /dev/null ));
                fi;
                return 0
            ;;
            source | build-dep | showsrc | policy)
                if [[ "$command" == build-dep && ( "$cur" == .* || "$cur" == /* || "$cur" == ~* ) ]]; then
                    _filedir "dsc";
                else
                    COMPREPLY=($( apt-cache --no-generate pkgnames "$cur"                         2> /dev/null ) $( apt-cache dumpavail |                         command grep "^Source: $cur" | sort -u | cut -f2 -d" " ));
                fi;
                return 0
            ;;
            edit-sources)
                COMPREPLY=($( compgen -W '$( command ls $sourcesdir )'                     -- "$cur" ));
                return 0
            ;;
            moo)
                COMPREPLY=($( compgen -W 'moo'                     -- "$cur" ));
                return 0
            ;;
        esac;
    else
        COMPREPLY=($( compgen -W '${COMMANDS[@]}' -- "$cur" ));
    fi;
    return 0
}
_available_interfaces () 
{ 
    local PATH=$PATH:/sbin;
    COMPREPLY=($({
        if [[ ${1:-} == -w ]]; then
            iwconfig
        elif [[ ${1:-} == -a ]]; then
            ifconfig || ip link show up
        else
            ifconfig -a || ip link show
        fi
    } 2>/dev/null | awk         '/^[^ \t]/ { if ($1 ~ /^[0-9]+:/) { print $2 } else { print $1 } }'));
    COMPREPLY=($(compgen -W '${COMPREPLY[@]/%[[:punct:]]/}' -- "$cur"))
}
_bashcomp_try_faketty () 
{ 
    if type unbuffer &> /dev/null; then
        unbuffer -p "$@";
    else
        if script --version 2>&1 | command grep -qF util-linux; then
            script -qaefc "$*" /dev/null;
        else
            "$@";
        fi;
    fi
}
_bashmarks_comp_cmd_bm () 
{ 
    COMPREPLY=();
    if ((COMP_CWORD == 1)) || { 
        ((COMP_CWORD >= 2)) && [[ ${COMP_WORDS[1]} == -[gpd] ]]
    }; then
        local cur=${COMP_WORDS[COMP_CWORD]};
        COMPREPLY=($(compgen -W '$(_bashmarks_list_names)' -- "$cur"));
    fi;
    return 0
}
_bashmarks_compzsh_cmd_bm () 
{ 
    reply=($(_bashmarks_list_names))
}
_bashmarks_delete () 
{ 
    if _bashmarks_is_valid_bookmark_name "$@"; then
        _bashmarks_purge_line "$BASHMARKS_SDIRS" "export DIR_$1=";
        unset "DIR_$1";
    fi
}
_bashmarks_goto () 
{ 
    source "$BASHMARKS_SDIRS";
    local target_varname=DIR_$1;
    local target=${!target_varname-};
    if [[ -d $target ]]; then
        _omb_directories_cd "$target";
    else
        if [[ ! -n $target ]]; then
            printf '%s\n' "${_omb_term_brown}WARNING: '${1}' bashmark does not exist${_omb_term_reset}";
        else
            printf '%s\n' "${_omb_term_brown}WARNING: '${target}' does not exist${_omb_term_reset}";
        fi;
    fi
}
_bashmarks_is_valid_bookmark_name () 
{ 
    local exit_message="";
    if [[ ! -n $1 ]]; then
        exit_message="bookmark name required";
        echo "$exit_message" 1>&2;
        return 1;
    else
        if [[ $1 == *[!A-Za-z0-9_]* ]]; then
            exit_message="bookmark name is not valid";
            echo "$exit_message" 1>&2;
            return 1;
        fi;
    fi
}
_bashmarks_list () 
{ 
    source "$BASHMARKS_SDIRS";
    env | sort | awk '/^DIR_.+/{split(substr($0,5),parts,"="); printf("\033[0;33m%-20s\033[0m %s\n", parts[1], parts[2]);}'
}
_bashmarks_list_names () 
{ 
    source "$BASHMARKS_SDIRS";
    env | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} "^DIR_" | cut -c5- | sort | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} "^.*=" | cut -f1 -d "="
}
_bashmarks_print () 
{ 
    source "$BASHMARKS_SDIRS";
    echo "$(eval $(echo echo $(echo \$DIR_$1)))"
}
_bashmarks_purge_line () 
{ 
    if [[ -s $1 ]]; then
        t=$(mktemp -t bashmarks.XXXXXX) || exit 1;
        trap "/bin/rm -f -- '$t'" EXIT;
        sed "/$2/d" "$1" >| "$t";
        /bin/mv "$t" "$1";
        /bin/rm -f -- "$t";
        trap - EXIT;
    fi
}
_bashmarks_save () 
{ 
    if _bashmarks_is_valid_bookmark_name "$@"; then
        _bashmarks_purge_line "$BASHMARKS_SDIRS" "export DIR_$1=";
        CURDIR=$(echo $PWD| sed "s#^$HOME#\$HOME#g");
        echo "export DIR_$1=\"$CURDIR\"" >> "$BASHMARKS_SDIRS";
    fi
}
_bashmarks_usage () 
{ 
    echo 'USAGE:';
    echo "bm -h                   - Prints this usage info";
    echo 'bm -a <bookmark_name>   - Saves the current directory as "bookmark_name"';
    echo 'bm [-g] <bookmark_name> - Goes (cd) to the directory associated with "bookmark_name"';
    echo 'bm -p <bookmark_name>   - Prints the directory associated with "bookmark_name"';
    echo 'bm -d <bookmark_name>   - Deletes the bookmark';
    echo 'bm -l                   - Lists all available bookmarks'
}
_bookmark_name_valid () 
{ 
    _bashmarks_is_valid_bookmark_name "$@"
}
_brainy_setter () 
{ 
    _omb_theme_PROMPT_COMMAND "$@"
}
_cd () 
{ 
    local cur prev words cword;
    _init_completion || return;
    local IFS='
' i j k;
    compopt -o filenames;
    if [[ -z ${CDPATH:-} || $cur == ?(.)?(.)/* ]]; then
        _filedir -d;
        return;
    fi;
    local -r mark_dirs=$(_rl_enabled mark-directories && echo y);
    local -r mark_symdirs=$(_rl_enabled mark-symlinked-directories && echo y);
    for i in ${CDPATH//:/'
'};
    do
        k="${#COMPREPLY[@]}";
        for j in $(compgen -d -- $i/$cur);
        do
            if [[ ( -n $mark_symdirs && -L $j || -n $mark_dirs && ! -L $j ) && ! -d ${j#$i/} ]]; then
                j+="/";
            fi;
            COMPREPLY[k++]=${j#$i/};
        done;
    done;
    _filedir -d;
    if ((${#COMPREPLY[@]} == 1)); then
        i=${COMPREPLY[0]};
        if [[ $i == "$cur" && $i != "*/" ]]; then
            COMPREPLY[0]="${i}/";
        fi;
    fi;
    return
}
_cd_devices () 
{ 
    COMPREPLY+=($(compgen -f -d -X "!*/?([amrs])cd*" -- "${cur:-/dev/}"))
}
_command () 
{ 
    local offset i;
    offset=1;
    for ((i = 1; i <= COMP_CWORD; i++))
    do
        if [[ ${COMP_WORDS[i]} != -* ]]; then
            offset=$i;
            break;
        fi;
    done;
    _command_offset $offset
}
_command_offset () 
{ 
    local word_offset=$1 i j;
    for ((i = 0; i < word_offset; i++))
    do
        for ((j = 0; j <= ${#COMP_LINE}; j++))
        do
            [[ $COMP_LINE == "${COMP_WORDS[i]}"* ]] && break;
            COMP_LINE=${COMP_LINE:1};
            ((COMP_POINT--));
        done;
        COMP_LINE=${COMP_LINE#"${COMP_WORDS[i]}"};
        ((COMP_POINT -= ${#COMP_WORDS[i]}));
    done;
    for ((i = 0; i <= COMP_CWORD - word_offset; i++))
    do
        COMP_WORDS[i]=${COMP_WORDS[i + word_offset]};
    done;
    for ((i; i <= COMP_CWORD; i++))
    do
        unset 'COMP_WORDS[i]';
    done;
    ((COMP_CWORD -= word_offset));
    COMPREPLY=();
    local cur;
    _get_comp_words_by_ref cur;
    if ((COMP_CWORD == 0)); then
        local IFS='
';
        compopt -o filenames;
        COMPREPLY=($(compgen -d -c -- "$cur"));
    else
        local cmd=${COMP_WORDS[0]} compcmd=${COMP_WORDS[0]};
        local cspec=$(complete -p $cmd 2>/dev/null);
        if [[ ! -n $cspec && $cmd == */* ]]; then
            cspec=$(complete -p ${cmd##*/} 2>/dev/null);
            [[ -n $cspec ]] && compcmd=${cmd##*/};
        fi;
        if [[ ! -n $cspec ]]; then
            compcmd=${cmd##*/};
            _completion_loader $compcmd;
            cspec=$(complete -p $compcmd 2>/dev/null);
        fi;
        if [[ -n $cspec ]]; then
            if [[ ${cspec#* -F } != "$cspec" ]]; then
                local func=${cspec#*-F };
                func=${func%% *};
                if ((${#COMP_WORDS[@]} >= 2)); then
                    $func $cmd "${COMP_WORDS[-1]}" "${COMP_WORDS[-2]}";
                else
                    $func $cmd "${COMP_WORDS[-1]}";
                fi;
                local opt;
                while [[ $cspec == *" -o "* ]]; do
                    cspec=${cspec#*-o };
                    opt=${cspec%% *};
                    compopt -o $opt;
                    cspec=${cspec#$opt};
                done;
            else
                cspec=${cspec#complete};
                cspec=${cspec%%$compcmd};
                COMPREPLY=($(eval compgen "$cspec" -- '$cur'));
            fi;
        else
            if ((${#COMPREPLY[@]} == 0)); then
                _minimal;
            fi;
        fi;
    fi
}
_comp () 
{ 
    _bashmarks_comp_cmd_bm "$@"
}
_complete_as_root () 
{ 
    [[ $EUID -eq 0 || -n ${root_command:-} ]]
}
_completion_loader () 
{ 
    local cmd="${1:-_EmptycmD_}";
    __load_completion "$cmd" && return 124;
    complete -F _minimal -- "$cmd" && return 124
}
_composer () 
{ 
    local cur script coms opts com;
    COMPREPLY=();
    _get_comp_words_by_ref -n : cur words;
    if [[ $(type -t ${words[0]}) == "alias" ]]; then
        script=$(alias ${words[0]} | sed -E "s/alias ${words[0]}='(.*)'/\1/");
    else
        script=${words[0]};
    fi;
    for word in ${words[@]:1};
    do
        if [[ $word != -* ]]; then
            com=$word;
            break;
        fi;
    done;
    if [[ ${cur} == --* ]]; then
        opts="--help --quiet --verbose --version --ansi --no-ansi --no-interaction --profile --no-plugins --working-dir";
        case "$com" in 
            about)
                opts="${opts} "
            ;;
            archive)
                opts="${opts} --format --dir --file"
            ;;
            browse)
                opts="${opts} --homepage --show"
            ;;
            clear-cache)
                opts="${opts} "
            ;;
            config)
                opts="${opts} --global --editor --auth --unset --list --file --absolute"
            ;;
            create-project)
                opts="${opts} --stability --prefer-source --prefer-dist --repository --repository-url --dev --no-dev --no-custom-installers --no-scripts --no-progress --no-secure-http --keep-vcs --no-install --ignore-platform-reqs"
            ;;
            depends)
                opts="${opts} --recursive --tree"
            ;;
            diagnose)
                opts="${opts} "
            ;;
            dump-autoload)
                opts="${opts} --no-scripts --optimize --classmap-authoritative --apcu --no-dev"
            ;;
            exec)
                opts="${opts} --list"
            ;;
            global)
                opts="${opts} "
            ;;
            help)
                opts="${opts} --xml --format --raw"
            ;;
            init)
                opts="${opts} --name --description --author --type --homepage --require --require-dev --stability --license --repository"
            ;;
            install)
                opts="${opts} --prefer-source --prefer-dist --dry-run --dev --no-dev --no-custom-installers --no-autoloader --no-scripts --no-progress --no-suggest --optimize-autoloader --classmap-authoritative --apcu-autoloader --ignore-platform-reqs"
            ;;
            licenses)
                opts="${opts} --format --no-dev"
            ;;
            list)
                opts="${opts} --xml --raw --format"
            ;;
            outdated)
                opts="${opts} --outdated --all --direct --strict"
            ;;
            prohibits)
                opts="${opts} --recursive --tree"
            ;;
            remove)
                opts="${opts} --dev --no-progress --no-update --no-scripts --update-no-dev --update-with-dependencies --no-update-with-dependencies --ignore-platform-reqs --optimize-autoloader --classmap-authoritative --apcu-autoloader"
            ;;
            require)
                opts="${opts} --dev --prefer-source --prefer-dist --no-progress --no-suggest --no-update --no-scripts --update-no-dev --update-with-dependencies --ignore-platform-reqs --prefer-stable --prefer-lowest --sort-packages --optimize-autoloader --classmap-authoritative --apcu-autoloader"
            ;;
            run-script)
                opts="${opts} --timeout --dev --no-dev --list"
            ;;
            search)
                opts="${opts} --only-name --type"
            ;;
            self-update)
                opts="${opts} --rollback --clean-backups --no-progress --update-keys --stable --preview --snapshot"
            ;;
            show)
                opts="${opts} --all --installed --platform --available --self --name-only --path --tree --latest --outdated --minor-only --direct --strict"
            ;;
            status)
                opts="${opts} "
            ;;
            suggests)
                opts="${opts} --by-package --by-suggestion --no-dev"
            ;;
            update)
                opts="${opts} --prefer-source --prefer-dist --dry-run --dev --no-dev --lock --no-custom-installers --no-autoloader --no-scripts --no-progress --no-suggest --with-dependencies --optimize-autoloader --classmap-authoritative --apcu-autoloader --ignore-platform-reqs --prefer-stable --prefer-lowest --interactive --root-reqs"
            ;;
            validate)
                opts="${opts} --no-check-all --no-check-lock --no-check-publish --with-dependencies --strict"
            ;;
        esac;
        COMPREPLY=($(compgen -W "${opts}" -- ${cur}));
        __ltrim_colon_completions "$cur";
        return 0;
    fi;
    if [[ $cur == $com ]]; then
        coms="about archive browse clear-cache config create-project depends diagnose dump-autoload exec global help init install licenses list outdated prohibits remove require run-script search self-update show status suggests update validate";
        COMPREPLY=($(compgen -W "${coms}" -- ${cur}));
        __ltrim_colon_completions "$cur";
        return 0;
    fi
}
_compzsh () 
{ 
    _bashmarks_compzsh_cmd_bm "$@"
}
_configured_interfaces () 
{ 
    if [[ -f /etc/debian_version ]]; then
        COMPREPLY=($(compgen -W "$(command sed -ne 's|^iface \([^ ]\{1,\}\).*$|\1|p'             /etc/network/interfaces /etc/network/interfaces.d/* 2>/dev/null)"             -- "$cur"));
    else
        if [[ -f /etc/SuSE-release ]]; then
            COMPREPLY=($(compgen -W "$(printf '%s\n'             /etc/sysconfig/network/ifcfg-* |
            command sed -ne 's|.*ifcfg-\([^*].*\)$|\1|p')" -- "$cur"));
        else
            if [[ -f /etc/pld-release ]]; then
                COMPREPLY=($(compgen -W "$(command ls -B             /etc/sysconfig/interfaces |
            command sed -ne 's|.*ifcfg-\([^*].*\)$|\1|p')" -- "$cur"));
            else
                COMPREPLY=($(compgen -W "$(printf '%s\n'             /etc/sysconfig/network-scripts/ifcfg-* |
            command sed -ne 's|.*ifcfg-\([^*].*\)$|\1|p')" -- "$cur"));
            fi;
        fi;
    fi
}
_count_args () 
{ 
    local i cword words;
    __reassemble_comp_words_by_ref "${1-}" words cword;
    args=1;
    for ((i = 1; i < cword; i++))
    do
        if [[ ${words[i]} != -* && ${words[i - 1]} != ${2-} || ${words[i]} == ${3-} ]]; then
            ((args++));
        fi;
    done
}
_delete_bookmark () 
{ 
    _bashmarks_delete "$@"
}
_dvd_devices () 
{ 
    COMPREPLY+=($(compgen -f -d -X "!*/?(r)dvd*" -- "${cur:-/dev/}"))
}
_echo_usage () 
{ 
    _bashmarks_usage "$@"
}
_expand () 
{ 
    case ${cur-} in 
        ~*/*)
            __expand_tilde_by_ref cur
        ;;
        ~*)
            _tilde "$cur" || eval COMPREPLY[0]="$(printf ~%q "${COMPREPLY[0]#\~}")";
            return ${#COMPREPLY[@]}
        ;;
    esac
}
_filedir () 
{ 
    local IFS='
';
    _tilde "${cur-}" || return;
    local -a toks;
    local reset arg=${1-};
    if [[ $arg == -d ]]; then
        reset=$(shopt -po noglob);
        set -o noglob;
        toks=($(compgen -d -- "${cur-}"));
        IFS=' ';
        $reset;
        IFS='
';
    else
        local quoted;
        _quote_readline_by_ref "${cur-}" quoted;
        local xspec=${arg:+"!*.@($arg|${arg^^})"} plusdirs=();
        local opts=(-f -X "$xspec");
        [[ -n $xspec ]] && plusdirs=(-o plusdirs);
        [[ -n ${COMP_FILEDIR_FALLBACK-} || -z ${plusdirs-} ]] || opts+=("${plusdirs[@]}");
        reset=$(shopt -po noglob);
        set -o noglob;
        toks+=($(compgen "${opts[@]}" -- $quoted));
        IFS=' ';
        $reset;
        IFS='
';
        [[ -n ${COMP_FILEDIR_FALLBACK-} && -n $arg && ${#toks[@]} -lt 1 ]] && { 
            reset=$(shopt -po noglob);
            set -o noglob;
            toks+=($(compgen -f ${plusdirs+"${plusdirs[@]}"} -- $quoted));
            IFS=' ';
            $reset;
            IFS='
'
        };
    fi;
    if ((${#toks[@]} != 0)); then
        compopt -o filenames 2> /dev/null;
        COMPREPLY+=("${toks[@]}");
    fi
}
_filedir_xspec () 
{ 
    local cur prev words cword;
    _init_completion || return;
    _tilde "$cur" || return;
    local IFS='
' xspec=${_xspecs[${1##*/}]} tmp;
    local -a toks;
    toks=($(
        compgen -d -- "$(quote_readline "$cur")" | {
            while read -r tmp; do
                printf '%s\n' $tmp
            done
        }
    ));
    eval xspec="${xspec}";
    local matchop=!;
    if [[ $xspec == !* ]]; then
        xspec=${xspec#!};
        matchop=@;
    fi;
    xspec="$matchop($xspec|${xspec^^})";
    toks+=($(
        eval compgen -f -X "'!$xspec'" -- '$(quote_readline "$cur")' | {
            while read -r tmp; do
                [[ -n $tmp ]] && printf '%s\n' $tmp
            done
        }
    ));
    [[ -n ${COMP_FILEDIR_FALLBACK:-} && ${#toks[@]} -lt 1 ]] && { 
        local reset=$(shopt -po noglob);
        set -o noglob;
        toks+=($(compgen -f -- "$(quote_readline "$cur")"));
        IFS=' ';
        $reset;
        IFS='
'
    };
    if ((${#toks[@]} != 0)); then
        compopt -o filenames;
        COMPREPLY=("${toks[@]}");
    fi
}
_fstypes () 
{ 
    local fss;
    if [[ -e /proc/filesystems ]]; then
        fss="$(cut -d'	' -f2 /proc/filesystems)
             $(awk '! /\*/ { print $NF }' /etc/filesystems 2>/dev/null)";
    else
        fss="$(awk '/^[ \t]*[^#]/ { print $3 }' /etc/fstab 2>/dev/null)
             $(awk '/^[ \t]*[^#]/ { print $3 }' /etc/mnttab 2>/dev/null)
             $(awk '/^[ \t]*[^#]/ { print $4 }' /etc/vfstab 2>/dev/null)
             $(awk '{ print $1 }' /etc/dfs/fstypes 2>/dev/null)
             $([[ -d /etc/fs ]] && command ls /etc/fs)";
    fi;
    [[ -n $fss ]] && COMPREPLY+=($(compgen -W "$fss" -- "$cur"))
}
_get_comp_words_by_ref () 
{ 
    local exclude flag i OPTIND=1;
    local cur cword words=();
    local upargs=() upvars=() vcur vcword vprev vwords;
    while getopts "c:i:n:p:w:" flag "$@"; do
        case $flag in 
            c)
                vcur=$OPTARG
            ;;
            i)
                vcword=$OPTARG
            ;;
            n)
                exclude=$OPTARG
            ;;
            p)
                vprev=$OPTARG
            ;;
            w)
                vwords=$OPTARG
            ;;
            *)
                echo "bash_completion: $FUNCNAME: usage error" 1>&2;
                return 1
            ;;
        esac;
    done;
    while [[ $# -ge $OPTIND ]]; do
        case ${!OPTIND} in 
            cur)
                vcur=cur
            ;;
            prev)
                vprev=prev
            ;;
            cword)
                vcword=cword
            ;;
            words)
                vwords=words
            ;;
            *)
                echo "bash_completion: $FUNCNAME: \`${!OPTIND}':" "unknown argument" 1>&2;
                return 1
            ;;
        esac;
        ((OPTIND += 1));
    done;
    __get_cword_at_cursor_by_ref "${exclude-}" words cword cur;
    [[ -v vcur ]] && { 
        upvars+=("$vcur");
        upargs+=(-v $vcur "$cur")
    };
    [[ -v vcword ]] && { 
        upvars+=("$vcword");
        upargs+=(-v $vcword "$cword")
    };
    [[ -v vprev && $cword -ge 1 ]] && { 
        upvars+=("$vprev");
        upargs+=(-v $vprev "${words[cword - 1]}")
    };
    [[ -v vwords ]] && { 
        upvars+=("$vwords");
        upargs+=(-a${#words[@]} $vwords ${words+"${words[@]}"})
    };
    ((${#upvars[@]})) && local "${upvars[@]}" && _upvars "${upargs[@]}"
}
_get_cword () 
{ 
    local LC_CTYPE=C;
    local cword words;
    __reassemble_comp_words_by_ref "${1-}" words cword;
    if [[ -n ${2-} && -n ${2//[^0-9]/} ]]; then
        printf "%s" "${words[cword - $2]}";
    else
        if ((${#words[cword]} == 0 && COMP_POINT == ${#COMP_LINE})); then
            :;
        else
            local i;
            local cur="$COMP_LINE";
            local index="$COMP_POINT";
            for ((i = 0; i <= cword; ++i))
            do
                while [[ ${#cur} -ge ${#words[i]} && ${cur:0:${#words[i]}} != "${words[i]}" ]]; do
                    cur="${cur:1}";
                    ((index > 0)) && ((index--));
                done;
                if ((i < cword)); then
                    local old_size="${#cur}";
                    cur="${cur#${words[i]}}";
                    local new_size="${#cur}";
                    ((index -= old_size - new_size));
                fi;
            done;
            if [[ ${words[cword]:0:${#cur}} != "$cur" ]]; then
                printf "%s" "${words[cword]}";
            else
                printf "%s" "${cur:0:index}";
            fi;
        fi;
    fi
}
_get_first_arg () 
{ 
    local i;
    arg=;
    for ((i = 1; i < COMP_CWORD; i++))
    do
        if [[ ${COMP_WORDS[i]} != -* ]]; then
            arg=${COMP_WORDS[i]};
            break;
        fi;
    done
}
_get_pword () 
{ 
    if ((COMP_CWORD >= 1)); then
        _get_cword "${@:-}" 1;
    fi
}
_gids () 
{ 
    if type getent &> /dev/null; then
        COMPREPLY=($(compgen -W '$(getent group | cut -d: -f3)' -- "$cur"));
    else
        if type perl &> /dev/null; then
            COMPREPLY=($(compgen -W '$(perl -e '"'"'while (($gid) = (getgrent)[2]) { print $gid . "\n" }'"'"')' -- "$cur"));
        else
            COMPREPLY=($(compgen -W '$(cut -d: -f3 /etc/group)' -- "$cur"));
        fi;
    fi
}
_git_add () 
{ 
    case "$cur" in 
        --chmod=*)
            __gitcomp "+x -x" "" "${cur##--chmod=}";
            return
        ;;
        --*)
            __gitcomp_builtin add;
            return
        ;;
    esac;
    local complete_opt="--others --modified --directory --no-empty-directory";
    if test -n "$(__git_find_on_cmdline "-u --update")"; then
        complete_opt="--modified";
    fi;
    __git_complete_index_file "$complete_opt"
}
_git_am () 
{ 
    __git_find_repo_path;
    if [ -d "$__git_repo_path"/rebase-apply ]; then
        __gitcomp "$__git_am_inprogress_options";
        return;
    fi;
    case "$cur" in 
        --whitespace=*)
            __gitcomp "$__git_whitespacelist" "" "${cur##--whitespace=}";
            return
        ;;
        --patch-format=*)
            __gitcomp "$__git_patchformat" "" "${cur##--patch-format=}";
            return
        ;;
        --show-current-patch=*)
            __gitcomp "$__git_showcurrentpatch" "" "${cur##--show-current-patch=}";
            return
        ;;
        --quoted-cr=*)
            __gitcomp "$__git_quoted_cr" "" "${cur##--quoted-cr=}";
            return
        ;;
        --*)
            __gitcomp_builtin am "" "$__git_am_inprogress_options";
            return
        ;;
    esac
}
_git_apply () 
{ 
    case "$cur" in 
        --whitespace=*)
            __gitcomp "$__git_whitespacelist" "" "${cur##--whitespace=}";
            return
        ;;
        --*)
            __gitcomp_builtin apply;
            return
        ;;
    esac
}
_git_archive () 
{ 
    case "$cur" in 
        --format=*)
            __gitcomp "$(git archive --list)" "" "${cur##--format=}";
            return
        ;;
        --remote=*)
            __gitcomp_nl "$(__git_remotes)" "" "${cur##--remote=}";
            return
        ;;
        --*)
            __gitcomp_builtin archive "--format= --list --verbose --prefix= --worktree-attributes";
            return
        ;;
    esac;
    __git_complete_file
}
_git_bisect () 
{ 
    __git_has_doubledash && return;
    local subcommands="start bad good skip reset visualize replay log run";
    local subcommand="$(__git_find_on_cmdline "$subcommands")";
    if [ -z "$subcommand" ]; then
        __git_find_repo_path;
        if [ -f "$__git_repo_path"/BISECT_START ]; then
            __gitcomp "$subcommands";
        else
            __gitcomp "replay start";
        fi;
        return;
    fi;
    case "$subcommand" in 
        bad | good | reset | skip | start)
            __git_complete_refs
        ;;
        *)

        ;;
    esac
}
_git_branch () 
{ 
    local i c="$__git_cmd_idx" only_local_ref="n" has_r="n";
    while [ $c -lt $cword ]; do
        i="${words[c]}";
        case "$i" in 
            -d | -D | --delete | -m | -M | --move | -c | -C | --copy)
                only_local_ref="y"
            ;;
            -r | --remotes)
                has_r="y"
            ;;
        esac;
        ((c++));
    done;
    case "$cur" in 
        --set-upstream-to=*)
            __git_complete_refs --cur="${cur##--set-upstream-to=}"
        ;;
        --*)
            __gitcomp_builtin branch
        ;;
        *)
            if [ $only_local_ref = "y" -a $has_r = "n" ]; then
                __gitcomp_direct "$(__git_heads "" "$cur" " ")";
            else
                __git_complete_refs;
            fi
        ;;
    esac
}
_git_bundle () 
{ 
    local cmd="${words[__git_cmd_idx+1]}";
    case "$cword" in 
        $((__git_cmd_idx+1)))
            __gitcomp "create list-heads verify unbundle"
        ;;
        $((__git_cmd_idx+2)))

        ;;
        *)
            case "$cmd" in 
                create)
                    __git_complete_revlist
                ;;
            esac
        ;;
    esac
}
_git_checkout () 
{ 
    __git_has_doubledash && return;
    local dwim_opt="$(__git_checkout_default_dwim_mode)";
    case "$prev" in 
        -b | -B | --orphan)
            __git_complete_refs $dwim_opt --mode="heads";
            return
        ;;
        *)

        ;;
    esac;
    case "$cur" in 
        --conflict=*)
            __gitcomp "diff3 merge" "" "${cur##--conflict=}"
        ;;
        --*)
            __gitcomp_builtin checkout
        ;;
        *)
            if [ -n "$(__git_find_on_cmdline "-b -B -d --detach --orphan")" ]; then
                __git_complete_refs --mode="refs";
            else
                if [ -n "$(__git_find_on_cmdline "--track")" ]; then
                    __git_complete_refs --mode="remote-heads";
                else
                    __git_complete_refs $dwim_opt --mode="refs";
                fi;
            fi
        ;;
    esac
}
_git_cherry_pick () 
{ 
    __git_find_repo_path;
    if [ -f "$__git_repo_path"/CHERRY_PICK_HEAD ]; then
        __gitcomp "$__git_cherry_pick_inprogress_options";
        return;
    fi;
    __git_complete_strategy && return;
    case "$cur" in 
        --*)
            __gitcomp_builtin cherry-pick "" "$__git_cherry_pick_inprogress_options"
        ;;
        *)
            __git_complete_refs
        ;;
    esac
}
_git_clean () 
{ 
    case "$cur" in 
        --*)
            __gitcomp_builtin clean;
            return
        ;;
    esac;
    __git_complete_index_file "--others --directory"
}
_git_clone () 
{ 
    case "$prev" in 
        -c | --config)
            __git_complete_config_variable_name_and_value;
            return
        ;;
    esac;
    case "$cur" in 
        --config=*)
            __git_complete_config_variable_name_and_value --cur="${cur##--config=}";
            return
        ;;
        --*)
            __gitcomp_builtin clone;
            return
        ;;
    esac
}
_git_commit () 
{ 
    case "$prev" in 
        -c | -C)
            __git_complete_refs;
            return
        ;;
    esac;
    case "$cur" in 
        --cleanup=*)
            __gitcomp "default scissors strip verbatim whitespace
			" "" "${cur##--cleanup=}";
            return
        ;;
        --reuse-message=* | --reedit-message=* | --fixup=* | --squash=*)
            __git_complete_refs --cur="${cur#*=}";
            return
        ;;
        --untracked-files=*)
            __gitcomp "$__git_untracked_file_modes" "" "${cur##--untracked-files=}";
            return
        ;;
        --*)
            __gitcomp_builtin commit;
            return
        ;;
    esac;
    if __git rev-parse --verify --quiet HEAD > /dev/null; then
        __git_complete_index_file "--committable";
    else
        __git_complete_index_file "--cached";
    fi
}
_git_config () 
{ 
    case "$prev" in 
        --get | --get-all | --unset | --unset-all)
            __gitcomp_nl "$(__git_config_get_set_variables)";
            return
        ;;
        *.*)
            __git_complete_config_variable_value;
            return
        ;;
    esac;
    case "$cur" in 
        --*)
            __gitcomp_builtin config
        ;;
        *)
            __git_complete_config_variable_name
        ;;
    esac
}
_git_describe () 
{ 
    case "$cur" in 
        --*)
            __gitcomp_builtin describe;
            return
        ;;
    esac;
    __git_complete_refs
}
_git_diff () 
{ 
    __git_has_doubledash && return;
    case "$cur" in 
        --diff-algorithm=*)
            __gitcomp "$__git_diff_algorithms" "" "${cur##--diff-algorithm=}";
            return
        ;;
        --submodule=*)
            __gitcomp "$__git_diff_submodule_formats" "" "${cur##--submodule=}";
            return
        ;;
        --color-moved=*)
            __gitcomp "$__git_color_moved_opts" "" "${cur##--color-moved=}";
            return
        ;;
        --color-moved-ws=*)
            __gitcomp "$__git_color_moved_ws_opts" "" "${cur##--color-moved-ws=}";
            return
        ;;
        --*)
            __gitcomp "$__git_diff_difftool_options";
            return
        ;;
    esac;
    __git_complete_revlist_file
}
_git_difftool () 
{ 
    __git_has_doubledash && return;
    case "$cur" in 
        --tool=*)
            __gitcomp "$__git_mergetools_common kompare" "" "${cur##--tool=}";
            return
        ;;
        --*)
            __gitcomp_builtin difftool "$__git_diff_difftool_options";
            return
        ;;
    esac;
    __git_complete_revlist_file
}
_git_fetch () 
{ 
    case "$cur" in 
        --recurse-submodules=*)
            __gitcomp "$__git_fetch_recurse_submodules" "" "${cur##--recurse-submodules=}";
            return
        ;;
        --filter=*)
            __gitcomp "blob:none blob:limit= sparse:oid=" "" "${cur##--filter=}";
            return
        ;;
        --*)
            __gitcomp_builtin fetch;
            return
        ;;
    esac;
    __git_complete_remote_or_refspec
}
_git_format_patch () 
{ 
    case "$cur" in 
        --thread=*)
            __gitcomp "
			deep shallow
			" "" "${cur##--thread=}";
            return
        ;;
        --base=* | --interdiff=* | --range-diff=*)
            __git_complete_refs --cur="${cur#--*=}";
            return
        ;;
        --*)
            __gitcomp_builtin format-patch "$__git_format_patch_extra_options";
            return
        ;;
    esac;
    __git_complete_revlist
}
_git_fsck () 
{ 
    case "$cur" in 
        --*)
            __gitcomp_builtin fsck;
            return
        ;;
    esac
}
_git_gitk () 
{ 
    __gitk_main
}
_git_grep () 
{ 
    __git_has_doubledash && return;
    case "$cur" in 
        --*)
            __gitcomp_builtin grep;
            return
        ;;
    esac;
    case "$cword,$prev" in 
        $((__git_cmd_idx+1)),* | *,-*)
            __git_complete_symbol && return
        ;;
    esac;
    __git_complete_refs
}
_git_help () 
{ 
    case "$cur" in 
        --*)
            __gitcomp_builtin help;
            return
        ;;
    esac;
    if test -n "${GIT_TESTING_ALL_COMMAND_LIST-}"; then
        __gitcomp "$GIT_TESTING_ALL_COMMAND_LIST $(__git --list-cmds=alias,list-guide) gitk";
    else
        __gitcomp "$(__git --list-cmds=main,nohelpers,alias,list-guide) gitk";
    fi
}
_git_init () 
{ 
    case "$cur" in 
        --shared=*)
            __gitcomp "
			false true umask group all world everybody
			" "" "${cur##--shared=}";
            return
        ;;
        --*)
            __gitcomp_builtin init;
            return
        ;;
    esac
}
_git_log () 
{ 
    __git_has_doubledash && return;
    __git_find_repo_path;
    local merge="";
    if [ -f "$__git_repo_path/MERGE_HEAD" ]; then
        merge="--merge";
    fi;
    case "$prev,$cur" in 
        -L,:*:*)
            return
        ;;
        -L,:*)
            __git_complete_symbol --cur="${cur#:}" --sfx=":";
            return
        ;;
        -G,* | -S,*)
            __git_complete_symbol;
            return
        ;;
    esac;
    case "$cur" in 
        --pretty=* | --format=*)
            __gitcomp "$__git_log_pretty_formats $(__git_pretty_aliases)
			" "" "${cur#*=}";
            return
        ;;
        --date=*)
            __gitcomp "$__git_log_date_formats" "" "${cur##--date=}";
            return
        ;;
        --decorate=*)
            __gitcomp "full short no" "" "${cur##--decorate=}";
            return
        ;;
        --diff-algorithm=*)
            __gitcomp "$__git_diff_algorithms" "" "${cur##--diff-algorithm=}";
            return
        ;;
        --submodule=*)
            __gitcomp "$__git_diff_submodule_formats" "" "${cur##--submodule=}";
            return
        ;;
        --no-walk=*)
            __gitcomp "sorted unsorted" "" "${cur##--no-walk=}";
            return
        ;;
        --*)
            __gitcomp "
			$__git_log_common_options
			$__git_log_shortlog_options
			$__git_log_gitk_options
			--root --topo-order --date-order --reverse
			--follow --full-diff
			--abbrev-commit --no-abbrev-commit --abbrev=
			--relative-date --date=
			--pretty= --format= --oneline
			--show-signature
			--cherry-mark
			--cherry-pick
			--graph
			--decorate --decorate= --no-decorate
			--walk-reflogs
			--no-walk --no-walk= --do-walk
			--parents --children
			--expand-tabs --expand-tabs= --no-expand-tabs
			$merge
			$__git_diff_common_options
			--pickaxe-all --pickaxe-regex
			";
            return
        ;;
        -L:*:*)
            return
        ;;
        -L:*)
            __git_complete_symbol --cur="${cur#-L:}" --sfx=":";
            return
        ;;
        -G*)
            __git_complete_symbol --pfx="-G" --cur="${cur#-G}";
            return
        ;;
        -S*)
            __git_complete_symbol --pfx="-S" --cur="${cur#-S}";
            return
        ;;
    esac;
    __git_complete_revlist
}
_git_log_prettily () 
{ 
    if [[ -n $1 ]]; then
        command git log --pretty="$1";
    fi
}
_git_ls_files () 
{ 
    case "$cur" in 
        --*)
            __gitcomp_builtin ls-files;
            return
        ;;
    esac;
    __git_complete_index_file "--cached"
}
_git_ls_remote () 
{ 
    case "$cur" in 
        --*)
            __gitcomp_builtin ls-remote;
            return
        ;;
    esac;
    __gitcomp_nl "$(__git_remotes)"
}
_git_ls_tree () 
{ 
    case "$cur" in 
        --*)
            __gitcomp_builtin ls-tree;
            return
        ;;
    esac;
    __git_complete_file
}
_git_merge () 
{ 
    __git_complete_strategy && return;
    case "$cur" in 
        --*)
            __gitcomp_builtin merge;
            return
        ;;
    esac;
    __git_complete_refs
}
_git_merge_base () 
{ 
    case "$cur" in 
        --*)
            __gitcomp_builtin merge-base;
            return
        ;;
    esac;
    __git_complete_refs
}
_git_mergetool () 
{ 
    case "$cur" in 
        --tool=*)
            __gitcomp "$__git_mergetools_common tortoisemerge" "" "${cur##--tool=}";
            return
        ;;
        --*)
            __gitcomp "--tool= --prompt --no-prompt --gui --no-gui";
            return
        ;;
    esac
}
_git_mv () 
{ 
    case "$cur" in 
        --*)
            __gitcomp_builtin mv;
            return
        ;;
    esac;
    if [ $(__git_count_arguments "mv") -gt 0 ]; then
        __git_complete_index_file "--cached --others --directory";
    else
        __git_complete_index_file "--cached";
    fi
}
_git_notes () 
{ 
    local subcommands='add append copy edit get-ref list merge prune remove show';
    local subcommand="$(__git_find_on_cmdline "$subcommands")";
    case "$subcommand,$cur" in 
        ,--*)
            __gitcomp_builtin notes
        ;;
        ,*)
            case "$prev" in 
                --ref)
                    __git_complete_refs
                ;;
                *)
                    __gitcomp "$subcommands --ref"
                ;;
            esac
        ;;
        *,--reuse-message=* | *,--reedit-message=*)
            __git_complete_refs --cur="${cur#*=}"
        ;;
        *,--*)
            __gitcomp_builtin notes_$subcommand
        ;;
        prune,* | get-ref,*)

        ;;
        *)
            case "$prev" in 
                -m | -F)

                ;;
                *)
                    __git_complete_refs
                ;;
            esac
        ;;
    esac
}
_git_pull () 
{ 
    __git_complete_strategy && return;
    case "$cur" in 
        --recurse-submodules=*)
            __gitcomp "$__git_fetch_recurse_submodules" "" "${cur##--recurse-submodules=}";
            return
        ;;
        --*)
            __gitcomp_builtin pull;
            return
        ;;
    esac;
    __git_complete_remote_or_refspec
}
_git_push () 
{ 
    case "$prev" in 
        --repo)
            __gitcomp_nl "$(__git_remotes)";
            return
        ;;
        --recurse-submodules)
            __gitcomp "$__git_push_recurse_submodules";
            return
        ;;
    esac;
    case "$cur" in 
        --repo=*)
            __gitcomp_nl "$(__git_remotes)" "" "${cur##--repo=}";
            return
        ;;
        --recurse-submodules=*)
            __gitcomp "$__git_push_recurse_submodules" "" "${cur##--recurse-submodules=}";
            return
        ;;
        --force-with-lease=*)
            __git_complete_force_with_lease "${cur##--force-with-lease=}";
            return
        ;;
        --*)
            __gitcomp_builtin push;
            return
        ;;
    esac;
    __git_complete_remote_or_refspec
}
_git_range_diff () 
{ 
    case "$cur" in 
        --*)
            __gitcomp "
			--creation-factor= --no-dual-color
			$__git_diff_common_options
		";
            return
        ;;
    esac;
    __git_complete_revlist
}
_git_rebase () 
{ 
    __git_find_repo_path;
    if [ -f "$__git_repo_path"/rebase-merge/interactive ]; then
        __gitcomp "$__git_rebase_interactive_inprogress_options";
        return;
    else
        if [ -d "$__git_repo_path"/rebase-apply ] || [ -d "$__git_repo_path"/rebase-merge ]; then
            __gitcomp "$__git_rebase_inprogress_options";
            return;
        fi;
    fi;
    __git_complete_strategy && return;
    case "$cur" in 
        --whitespace=*)
            __gitcomp "$__git_whitespacelist" "" "${cur##--whitespace=}";
            return
        ;;
        --onto=*)
            __git_complete_refs --cur="${cur##--onto=}";
            return
        ;;
        --*)
            __gitcomp_builtin rebase "" "$__git_rebase_interactive_inprogress_options";
            return
        ;;
    esac;
    __git_complete_refs
}
_git_reflog () 
{ 
    local subcommands="show delete expire";
    local subcommand="$(__git_find_on_cmdline "$subcommands")";
    if [ -z "$subcommand" ]; then
        __gitcomp "$subcommands";
    else
        __git_complete_refs;
    fi
}
_git_remote () 
{ 
    local subcommands="
		add rename remove set-head set-branches
		get-url set-url show prune update
		";
    local subcommand="$(__git_find_on_cmdline "$subcommands")";
    if [ -z "$subcommand" ]; then
        case "$cur" in 
            --*)
                __gitcomp_builtin remote
            ;;
            *)
                __gitcomp "$subcommands"
            ;;
        esac;
        return;
    fi;
    case "$subcommand,$cur" in 
        add,--*)
            __gitcomp_builtin remote_add
        ;;
        add,*)

        ;;
        set-head,--*)
            __gitcomp_builtin remote_set-head
        ;;
        set-branches,--*)
            __gitcomp_builtin remote_set-branches
        ;;
        set-head,* | set-branches,*)
            __git_complete_remote_or_refspec
        ;;
        update,--*)
            __gitcomp_builtin remote_update
        ;;
        update,*)
            __gitcomp "$(__git_remotes) $(__git_get_config_variables "remotes")"
        ;;
        set-url,--*)
            __gitcomp_builtin remote_set-url
        ;;
        get-url,--*)
            __gitcomp_builtin remote_get-url
        ;;
        prune,--*)
            __gitcomp_builtin remote_prune
        ;;
        *)
            __gitcomp_nl "$(__git_remotes)"
        ;;
    esac
}
_git_replace () 
{ 
    case "$cur" in 
        --format=*)
            __gitcomp "short medium long" "" "${cur##--format=}";
            return
        ;;
        --*)
            __gitcomp_builtin replace;
            return
        ;;
    esac;
    __git_complete_refs
}
_git_rerere () 
{ 
    local subcommands="clear forget diff remaining status gc";
    local subcommand="$(__git_find_on_cmdline "$subcommands")";
    if test -z "$subcommand"; then
        __gitcomp "$subcommands";
        return;
    fi
}
_git_reset () 
{ 
    __git_has_doubledash && return;
    case "$cur" in 
        --*)
            __gitcomp_builtin reset;
            return
        ;;
    esac;
    __git_complete_refs
}
_git_restore () 
{ 
    case "$prev" in 
        -s)
            __git_complete_refs;
            return
        ;;
    esac;
    case "$cur" in 
        --conflict=*)
            __gitcomp "diff3 merge" "" "${cur##--conflict=}"
        ;;
        --source=*)
            __git_complete_refs --cur="${cur##--source=}"
        ;;
        --*)
            __gitcomp_builtin restore
        ;;
    esac
}
_git_revert () 
{ 
    __git_find_repo_path;
    if [ -f "$__git_repo_path"/REVERT_HEAD ]; then
        __gitcomp "$__git_revert_inprogress_options";
        return;
    fi;
    __git_complete_strategy && return;
    case "$cur" in 
        --*)
            __gitcomp_builtin revert "" "$__git_revert_inprogress_options";
            return
        ;;
    esac;
    __git_complete_refs
}
_git_rm () 
{ 
    case "$cur" in 
        --*)
            __gitcomp_builtin rm;
            return
        ;;
    esac;
    __git_complete_index_file "--cached"
}
_git_send_email () 
{ 
    case "$prev" in 
        --to | --cc | --bcc | --from)
            __gitcomp "$(__git send-email --dump-aliases)";
            return
        ;;
    esac;
    case "$cur" in 
        --confirm=*)
            __gitcomp "
			$__git_send_email_confirm_options
			" "" "${cur##--confirm=}";
            return
        ;;
        --suppress-cc=*)
            __gitcomp "
			$__git_send_email_suppresscc_options
			" "" "${cur##--suppress-cc=}";
            return
        ;;
        --smtp-encryption=*)
            __gitcomp "ssl tls" "" "${cur##--smtp-encryption=}";
            return
        ;;
        --thread=*)
            __gitcomp "
			deep shallow
			" "" "${cur##--thread=}";
            return
        ;;
        --to=* | --cc=* | --bcc=* | --from=*)
            __gitcomp "$(__git send-email --dump-aliases)" "" "${cur#--*=}";
            return
        ;;
        --*)
            __gitcomp_builtin send-email "--annotate --bcc --cc --cc-cmd --chain-reply-to
			--compose --confirm= --dry-run --envelope-sender
			--from --identity
			--in-reply-to --no-chain-reply-to --no-signed-off-by-cc
			--no-suppress-from --no-thread --quiet --reply-to
			--signed-off-by-cc --smtp-pass --smtp-server
			--smtp-server-port --smtp-encryption= --smtp-user
			--subject --suppress-cc= --suppress-from --thread --to
			--validate --no-validate
			$__git_format_patch_extra_options";
            return
        ;;
    esac;
    __git_complete_revlist
}
_git_shortlog () 
{ 
    __git_has_doubledash && return;
    case "$cur" in 
        --*)
            __gitcomp "
			$__git_log_common_options
			$__git_log_shortlog_options
			--numbered --summary --email
			";
            return
        ;;
    esac;
    __git_complete_revlist
}
_git_show () 
{ 
    __git_has_doubledash && return;
    case "$cur" in 
        --pretty=* | --format=*)
            __gitcomp "$__git_log_pretty_formats $(__git_pretty_aliases)
			" "" "${cur#*=}";
            return
        ;;
        --diff-algorithm=*)
            __gitcomp "$__git_diff_algorithms" "" "${cur##--diff-algorithm=}";
            return
        ;;
        --submodule=*)
            __gitcomp "$__git_diff_submodule_formats" "" "${cur##--submodule=}";
            return
        ;;
        --color-moved=*)
            __gitcomp "$__git_color_moved_opts" "" "${cur##--color-moved=}";
            return
        ;;
        --color-moved-ws=*)
            __gitcomp "$__git_color_moved_ws_opts" "" "${cur##--color-moved-ws=}";
            return
        ;;
        --*)
            __gitcomp "--pretty= --format= --abbrev-commit --no-abbrev-commit
			--oneline --show-signature
			--expand-tabs --expand-tabs= --no-expand-tabs
			$__git_diff_common_options
			";
            return
        ;;
    esac;
    __git_complete_revlist_file
}
_git_show_branch () 
{ 
    case "$cur" in 
        --*)
            __gitcomp_builtin show-branch;
            return
        ;;
    esac;
    __git_complete_revlist
}
_git_sparse_checkout () 
{ 
    local subcommands="list init set disable";
    local subcommand="$(__git_find_on_cmdline "$subcommands")";
    if [ -z "$subcommand" ]; then
        __gitcomp "$subcommands";
        return;
    fi;
    case "$subcommand,$cur" in 
        init,--*)
            __gitcomp "--cone"
        ;;
        set,--*)
            __gitcomp "--stdin"
        ;;
        *)

        ;;
    esac
}
_git_stage () 
{ 
    _git_add
}
_git_stash () 
{ 
    local subcommands='push list show apply clear drop pop create branch';
    local subcommand="$(__git_find_on_cmdline "$subcommands save")";
    if [ -z "$subcommand" ]; then
        case "$((cword - __git_cmd_idx)),$cur" in 
            *,--*)
                __gitcomp_builtin stash_push
            ;;
            1,sa*)
                __gitcomp "save"
            ;;
            1,*)
                __gitcomp "$subcommands"
            ;;
        esac;
        return;
    fi;
    case "$subcommand,$cur" in 
        list,--*)
            __gitcomp_builtin stash_list "$__git_log_common_options $__git_diff_common_options"
        ;;
        show,--*)
            __gitcomp_builtin stash_show "$__git_diff_common_options"
        ;;
        *,--*)
            __gitcomp_builtin "stash_$subcommand"
        ;;
        branch,*)
            if [ $cword -eq $((__git_cmd_idx+2)) ]; then
                __git_complete_refs;
            else
                __gitcomp_nl "$(__git stash list 					| sed -n -e 's/:.*//p')";
            fi
        ;;
        show,* | apply,* | drop,* | pop,*)
            __gitcomp_nl "$(__git stash list 				| sed -n -e 's/:.*//p')"
        ;;
    esac
}
_git_status () 
{ 
    local complete_opt;
    local untracked_state;
    case "$cur" in 
        --ignore-submodules=*)
            __gitcomp "none untracked dirty all" "" "${cur##--ignore-submodules=}";
            return
        ;;
        --untracked-files=*)
            __gitcomp "$__git_untracked_file_modes" "" "${cur##--untracked-files=}";
            return
        ;;
        --column=*)
            __gitcomp "
			always never auto column row plain dense nodense
			" "" "${cur##--column=}";
            return
        ;;
        --*)
            __gitcomp_builtin status;
            return
        ;;
    esac;
    untracked_state="$(__git_get_option_value "-u" "--untracked-files=" 		"$__git_untracked_file_modes" "status.showUntrackedFiles")";
    case "$untracked_state" in 
        no)
            complete_opt=
        ;;
        all | normal | *)
            complete_opt="--cached --directory --no-empty-directory --others";
            if [ -n "$(__git_find_on_cmdline "--ignored")" ]; then
                complete_opt="$complete_opt --ignored --exclude=*";
            fi
        ;;
    esac;
    __git_complete_index_file "$complete_opt"
}
_git_submodule () 
{ 
    __git_has_doubledash && return;
    local subcommands="add status init deinit update set-branch set-url summary foreach sync absorbgitdirs";
    local subcommand="$(__git_find_on_cmdline "$subcommands")";
    if [ -z "$subcommand" ]; then
        case "$cur" in 
            --*)
                __gitcomp "--quiet"
            ;;
            *)
                __gitcomp "$subcommands"
            ;;
        esac;
        return;
    fi;
    case "$subcommand,$cur" in 
        add,--*)
            __gitcomp "--branch --force --name --reference --depth"
        ;;
        status,--*)
            __gitcomp "--cached --recursive"
        ;;
        deinit,--*)
            __gitcomp "--force --all"
        ;;
        update,--*)
            __gitcomp "
			--init --remote --no-fetch
			--recommend-shallow --no-recommend-shallow
			--force --rebase --merge --reference --depth --recursive --jobs
		"
        ;;
        set-branch,--*)
            __gitcomp "--default --branch"
        ;;
        summary,--*)
            __gitcomp "--cached --files --summary-limit"
        ;;
        foreach,--* | sync,--*)
            __gitcomp "--recursive"
        ;;
        *)

        ;;
    esac
}
_git_svn () 
{ 
    local subcommands="
		init fetch clone rebase dcommit log find-rev
		set-tree commit-diff info create-ignore propget
		proplist show-ignore show-externals branch tag blame
		migrate mkdirs reset gc
		";
    local subcommand="$(__git_find_on_cmdline "$subcommands")";
    if [ -z "$subcommand" ]; then
        __gitcomp "$subcommands";
    else
        local remote_opts="--username= --config-dir= --no-auth-cache";
        local fc_opts="
			--follow-parent --authors-file= --repack=
			--no-metadata --use-svm-props --use-svnsync-props
			--log-window-size= --no-checkout --quiet
			--repack-flags --use-log-author --localtime
			--add-author-from
			--recursive
			--ignore-paths= --include-paths= $remote_opts
			";
        local init_opts="
			--template= --shared= --trunk= --tags=
			--branches= --stdlayout --minimize-url
			--no-metadata --use-svm-props --use-svnsync-props
			--rewrite-root= --prefix= $remote_opts
			";
        local cmt_opts="
			--edit --rmdir --find-copies-harder --copy-similarity=
			";
        case "$subcommand,$cur" in 
            fetch,--*)
                __gitcomp "--revision= --fetch-all $fc_opts"
            ;;
            clone,--*)
                __gitcomp "--revision= $fc_opts $init_opts"
            ;;
            init,--*)
                __gitcomp "$init_opts"
            ;;
            dcommit,--*)
                __gitcomp "
				--merge --strategy= --verbose --dry-run
				--fetch-all --no-rebase --commit-url
				--revision --interactive $cmt_opts $fc_opts
				"
            ;;
            set-tree,--*)
                __gitcomp "--stdin $cmt_opts $fc_opts"
            ;;
            create-ignore,--* | propget,--* | proplist,--* | show-ignore,--* | show-externals,--* | mkdirs,--*)
                __gitcomp "--revision="
            ;;
            log,--*)
                __gitcomp "
				--limit= --revision= --verbose --incremental
				--oneline --show-commit --non-recursive
				--authors-file= --color
				"
            ;;
            rebase,--*)
                __gitcomp "
				--merge --verbose --strategy= --local
				--fetch-all --dry-run $fc_opts
				"
            ;;
            commit-diff,--*)
                __gitcomp "--message= --file= --revision= $cmt_opts"
            ;;
            info,--*)
                __gitcomp "--url"
            ;;
            branch,--*)
                __gitcomp "--dry-run --message --tag"
            ;;
            tag,--*)
                __gitcomp "--dry-run --message"
            ;;
            blame,--*)
                __gitcomp "--git-format"
            ;;
            migrate,--*)
                __gitcomp "
				--config-dir= --ignore-paths= --minimize
				--no-auth-cache --username=
				"
            ;;
            reset,--*)
                __gitcomp "--revision= --parent"
            ;;
            *)

            ;;
        esac;
    fi
}
_git_switch () 
{ 
    local dwim_opt="$(__git_checkout_default_dwim_mode)";
    case "$prev" in 
        -c | -C | --orphan)
            __git_complete_refs $dwim_opt --mode="heads";
            return
        ;;
        *)

        ;;
    esac;
    case "$cur" in 
        --conflict=*)
            __gitcomp "diff3 merge" "" "${cur##--conflict=}"
        ;;
        --*)
            __gitcomp_builtin switch
        ;;
        *)
            if [ -n "$(__git_find_on_cmdline "--orphan")" ]; then
                return;
            fi;
            if [ -n "$(__git_find_on_cmdline "-c -C -d --detach")" ]; then
                __git_complete_refs --mode="refs";
            else
                if [ -n "$(__git_find_on_cmdline "--track")" ]; then
                    __git_complete_refs --mode="remote-heads";
                else
                    __git_complete_refs $dwim_opt --mode="heads";
                fi;
            fi
        ;;
    esac
}
_git_tag () 
{ 
    local i c="$__git_cmd_idx" f=0;
    while [ $c -lt $cword ]; do
        i="${words[c]}";
        case "$i" in 
            -d | --delete | -v | --verify)
                __gitcomp_direct "$(__git_tags "" "$cur" " ")";
                return
            ;;
            -f)
                f=1
            ;;
        esac;
        ((c++));
    done;
    case "$prev" in 
        -m | -F)

        ;;
        -* | tag)
            if [ $f = 1 ]; then
                __gitcomp_direct "$(__git_tags "" "$cur" " ")";
            fi
        ;;
        *)
            __git_complete_refs
        ;;
    esac;
    case "$cur" in 
        --*)
            __gitcomp_builtin tag
        ;;
    esac
}
_git_whatchanged () 
{ 
    _git_log
}
_git_worktree () 
{ 
    local subcommands="add list lock move prune remove unlock";
    local subcommand subcommand_idx;
    subcommand="$(__git_find_on_cmdline --show-idx "$subcommands")";
    subcommand_idx="${subcommand% *}";
    subcommand="${subcommand#* }";
    case "$subcommand,$cur" in 
        ,*)
            __gitcomp "$subcommands"
        ;;
        *,--*)
            __gitcomp_builtin worktree_$subcommand
        ;;
        add,*)
            case "$prev" in 
                -b | -B)
                    __git_complete_refs
                ;;
                -*)

                ;;
                *)
                    if [ $cword -eq $((subcommand_idx+1)) ]; then
                        :;
                    else
                        case "${words[cword-2]}" in 
                            -b | -B)

                            ;;
                            *)
                                __git_complete_refs
                            ;;
                        esac;
                    fi
                ;;
            esac
        ;;
        lock,* | remove,* | unlock,*)
            __git_complete_worktree_paths
        ;;
        move,*)
            if [ $cword -eq $((subcommand_idx+1)) ]; then
                __git_complete_worktree_paths;
            else
                :;
            fi
        ;;
    esac
}
_goto_bookmark () 
{ 
    _bashmarks_goto "$@"
}
_gum_choose () 
{ 
    last_command="gum_choose";
    command_aliases=();
    commands=();
    flags=();
    two_word_flags=();
    local_nonpersistent_flags=();
    flags_with_completion=();
    flags_completion=();
    flags+=("--limit");
    flags+=("--no-limit");
    flags+=("--ordered");
    flags+=("--height");
    flags+=("--cursor=");
    two_word_flags+=("--cursor");
    flags+=("--header=");
    two_word_flags+=("--header");
    flags+=("--cursor-prefix=");
    two_word_flags+=("--cursor-prefix");
    flags+=("--selected-prefix=");
    two_word_flags+=("--selected-prefix");
    flags+=("--unselected-prefix=");
    two_word_flags+=("--unselected-prefix");
    flags+=("--selected");
    flags+=("--select-if-one");
    flags+=("--cursor.foreground=");
    two_word_flags+=("--cursor.foreground");
    flags+=("--header.foreground=");
    two_word_flags+=("--header.foreground");
    flags+=("--item.foreground=");
    two_word_flags+=("--item.foreground");
    flags+=("--selected.foreground=");
    two_word_flags+=("--selected.foreground");
    flags+=("--timeout");
    noun_aliases=()
}
_gum_confirm () 
{ 
    last_command="gum_confirm";
    command_aliases=();
    commands=();
    flags=();
    two_word_flags=();
    local_nonpersistent_flags=();
    flags_with_completion=();
    flags_completion=();
    flags+=("--default");
    flags+=("--affirmative=");
    two_word_flags+=("--affirmative");
    flags+=("--negative=");
    two_word_flags+=("--negative");
    flags+=("--prompt.foreground=");
    two_word_flags+=("--prompt.foreground");
    flags+=("--selected.foreground=");
    two_word_flags+=("--selected.foreground");
    flags+=("--unselected.foreground=");
    two_word_flags+=("--unselected.foreground");
    flags+=("--timeout");
    noun_aliases=()
}
_gum_file () 
{ 
    last_command="gum_file";
    command_aliases=();
    commands=();
    flags=();
    two_word_flags=();
    local_nonpersistent_flags=();
    flags_with_completion=();
    flags_completion=();
    flags+=("--cursor=");
    two_word_flags+=("--cursor");
    two_word_flags+=("-c");
    flags+=("--all");
    flags+=("-a");
    flags+=("--file");
    flags+=("--directory");
    flags+=("--height");
    flags+=("--cursor.foreground=");
    two_word_flags+=("--cursor.foreground");
    flags+=("--symlink.foreground=");
    two_word_flags+=("--symlink.foreground");
    flags+=("--directory.foreground=");
    two_word_flags+=("--directory.foreground");
    flags+=("--file.foreground=");
    two_word_flags+=("--file.foreground");
    flags+=("--permissions.foreground=");
    two_word_flags+=("--permissions.foreground");
    flags+=("--selected.foreground=");
    two_word_flags+=("--selected.foreground");
    flags+=("--file-size.foreground=");
    two_word_flags+=("--file-size.foreground");
    flags+=("--timeout");
    noun_aliases=()
}
_gum_filter () 
{ 
    last_command="gum_filter";
    command_aliases=();
    commands=();
    flags=();
    two_word_flags=();
    local_nonpersistent_flags=();
    flags_with_completion=();
    flags_completion=();
    flags+=("--indicator=");
    two_word_flags+=("--indicator");
    flags+=("--indicator.foreground=");
    two_word_flags+=("--indicator.foreground");
    flags+=("--limit");
    flags+=("--no-limit");
    flags+=("--select-if-one");
    flags+=("--strict");
    flags+=("--selected-prefix=");
    two_word_flags+=("--selected-prefix");
    flags+=("--selected-indicator.foreground=");
    two_word_flags+=("--selected-indicator.foreground");
    flags+=("--unselected-prefix=");
    two_word_flags+=("--unselected-prefix");
    flags+=("--unselected-prefix.foreground=");
    two_word_flags+=("--unselected-prefix.foreground");
    flags+=("--header.foreground=");
    two_word_flags+=("--header.foreground");
    flags+=("--header=");
    two_word_flags+=("--header");
    flags+=("--text.foreground=");
    two_word_flags+=("--text.foreground");
    flags+=("--cursor-text.foreground=");
    two_word_flags+=("--cursor-text.foreground");
    flags+=("--match.foreground=");
    two_word_flags+=("--match.foreground");
    flags+=("--placeholder=");
    two_word_flags+=("--placeholder");
    flags+=("--prompt=");
    two_word_flags+=("--prompt");
    flags+=("--prompt.foreground=");
    two_word_flags+=("--prompt.foreground");
    flags+=("--width");
    flags+=("--height");
    flags+=("--value=");
    two_word_flags+=("--value");
    flags+=("--reverse");
    flags+=("--fuzzy");
    flags+=("--sort");
    flags+=("--timeout");
    noun_aliases=()
}
_gum_format () 
{ 
    last_command="gum_format";
    command_aliases=();
    commands=();
    flags=();
    two_word_flags=();
    local_nonpersistent_flags=();
    flags_with_completion=();
    flags_completion=();
    flags+=("--theme=");
    two_word_flags+=("--theme");
    flags+=("--language=");
    two_word_flags+=("--language");
    two_word_flags+=("-l");
    flags+=("--type=");
    two_word_flags+=("--type");
    two_word_flags+=("-t");
    noun_aliases=()
}
_gum_input () 
{ 
    last_command="gum_input";
    command_aliases=();
    commands=();
    flags=();
    two_word_flags=();
    local_nonpersistent_flags=();
    flags_with_completion=();
    flags_completion=();
    flags+=("--placeholder=");
    two_word_flags+=("--placeholder");
    flags+=("--prompt=");
    two_word_flags+=("--prompt");
    flags+=("--prompt.foreground=");
    two_word_flags+=("--prompt.foreground");
    flags+=("--cursor.foreground=");
    two_word_flags+=("--cursor.foreground");
    flags+=("--cursor.mode=");
    two_word_flags+=("--cursor.mode");
    flags+=("--value=");
    two_word_flags+=("--value");
    flags+=("--char-limit");
    flags+=("--width");
    flags+=("--password");
    flags+=("--header=");
    two_word_flags+=("--header");
    flags+=("--header.foreground=");
    two_word_flags+=("--header.foreground");
    flags+=("--timeout");
    noun_aliases=()
}
_gum_join () 
{ 
    last_command="gum_join";
    command_aliases=();
    commands=();
    flags=();
    two_word_flags=();
    local_nonpersistent_flags=();
    flags_with_completion=();
    flags_completion=();
    flags+=("--align=");
    two_word_flags+=("--align");
    flags+=("--horizontal");
    flags+=("--vertical");
    noun_aliases=()
}
_gum_log () 
{ 
    last_command="gum_log";
    command_aliases=();
    commands=();
    flags=();
    two_word_flags=();
    local_nonpersistent_flags=();
    flags_with_completion=();
    flags_completion=();
    flags+=("--file=");
    two_word_flags+=("--file");
    two_word_flags+=("-o");
    flags+=("--format");
    flags+=("-f");
    flags+=("--formatter=");
    two_word_flags+=("--formatter");
    flags+=("--level=");
    two_word_flags+=("--level");
    two_word_flags+=("-l");
    flags+=("--prefix=");
    two_word_flags+=("--prefix");
    flags+=("--structured");
    flags+=("-s");
    flags+=("--time=");
    two_word_flags+=("--time");
    two_word_flags+=("-t");
    flags+=("--level.foreground=");
    two_word_flags+=("--level.foreground");
    flags+=("--time.foreground=");
    two_word_flags+=("--time.foreground");
    flags+=("--prefix.foreground=");
    two_word_flags+=("--prefix.foreground");
    flags+=("--message.foreground=");
    two_word_flags+=("--message.foreground");
    flags+=("--key.foreground=");
    two_word_flags+=("--key.foreground");
    flags+=("--value.foreground=");
    two_word_flags+=("--value.foreground");
    flags+=("--separator.foreground=");
    two_word_flags+=("--separator.foreground");
    noun_aliases=()
}
_gum_pager () 
{ 
    last_command="gum_pager";
    command_aliases=();
    commands=();
    flags=();
    two_word_flags=();
    local_nonpersistent_flags=();
    flags_with_completion=();
    flags_completion=();
    flags+=("--foreground=");
    two_word_flags+=("--foreground");
    flags+=("--help.foreground=");
    two_word_flags+=("--help.foreground");
    flags+=("--show-line-numbers");
    flags+=("--line-number.foreground=");
    two_word_flags+=("--line-number.foreground");
    flags+=("--soft-wrap");
    flags+=("--match.foreground=");
    two_word_flags+=("--match.foreground");
    flags+=("--match-highlight.foreground=");
    two_word_flags+=("--match-highlight.foreground");
    flags+=("--timeout");
    noun_aliases=()
}
_gum_root_command () 
{ 
    last_command="gum";
    command_aliases=();
    commands=();
    commands+=("choose");
    commands+=("confirm");
    commands+=("file");
    commands+=("filter");
    commands+=("format");
    commands+=("input");
    commands+=("join");
    commands+=("pager");
    commands+=("spin");
    commands+=("style");
    commands+=("table");
    commands+=("write");
    commands+=("log");
    flags=();
    two_word_flags=();
    local_nonpersistent_flags=();
    flags_with_completion=();
    flags_completion=();
    flags+=("--help");
    flags+=("-h");
    flags+=("--version");
    flags+=("-v");
    noun_aliases=()
}
_gum_spin () 
{ 
    last_command="gum_spin";
    command_aliases=();
    commands=();
    flags=();
    two_word_flags=();
    local_nonpersistent_flags=();
    flags_with_completion=();
    flags_completion=();
    flags+=("--show-output");
    flags+=("--spinner=");
    two_word_flags+=("--spinner");
    two_word_flags+=("-s");
    flags+=("--spinner.foreground=");
    two_word_flags+=("--spinner.foreground");
    flags+=("--title=");
    two_word_flags+=("--title");
    flags+=("--title.foreground=");
    two_word_flags+=("--title.foreground");
    flags+=("--align=");
    two_word_flags+=("--align");
    two_word_flags+=("-a");
    flags+=("--timeout");
    noun_aliases=()
}
_gum_style () 
{ 
    last_command="gum_style";
    command_aliases=();
    commands=();
    flags=();
    two_word_flags=();
    local_nonpersistent_flags=();
    flags_with_completion=();
    flags_completion=();
    flags+=("--foreground=");
    two_word_flags+=("--foreground");
    flags+=("--background=");
    two_word_flags+=("--background");
    flags+=("--border=");
    two_word_flags+=("--border");
    flags+=("--border-background=");
    two_word_flags+=("--border-background");
    flags+=("--border-foreground=");
    two_word_flags+=("--border-foreground");
    flags+=("--align=");
    two_word_flags+=("--align");
    flags+=("--height");
    flags+=("--width");
    flags+=("--margin=");
    two_word_flags+=("--margin");
    flags+=("--padding=");
    two_word_flags+=("--padding");
    flags+=("--bold");
    flags+=("--faint");
    flags+=("--italic");
    flags+=("--strikethrough");
    flags+=("--underline");
    noun_aliases=()
}
_gum_table () 
{ 
    last_command="gum_table";
    command_aliases=();
    commands=();
    flags=();
    two_word_flags=();
    local_nonpersistent_flags=();
    flags_with_completion=();
    flags_completion=();
    flags+=("--separator=");
    two_word_flags+=("--separator");
    two_word_flags+=("-s");
    flags+=("--columns");
    flags+=("-c");
    flags+=("--widths");
    flags+=("-w");
    flags+=("--height");
    flags+=("--print");
    flags+=("-p");
    flags+=("--file=");
    two_word_flags+=("--file");
    two_word_flags+=("-f");
    flags+=("--border=");
    two_word_flags+=("--border");
    two_word_flags+=("-b");
    flags+=("--border.foreground=");
    two_word_flags+=("--border.foreground");
    flags+=("--cell.foreground=");
    two_word_flags+=("--cell.foreground");
    flags+=("--header.foreground=");
    two_word_flags+=("--header.foreground");
    flags+=("--selected.foreground=");
    two_word_flags+=("--selected.foreground");
    noun_aliases=()
}
_gum_write () 
{ 
    last_command="gum_write";
    command_aliases=();
    commands=();
    flags=();
    two_word_flags=();
    local_nonpersistent_flags=();
    flags_with_completion=();
    flags_completion=();
    flags+=("--width");
    flags+=("--height");
    flags+=("--header=");
    two_word_flags+=("--header");
    flags+=("--placeholder=");
    two_word_flags+=("--placeholder");
    flags+=("--prompt=");
    two_word_flags+=("--prompt");
    flags+=("--show-cursor-line");
    flags+=("--show-line-numbers");
    flags+=("--value=");
    two_word_flags+=("--value");
    flags+=("--char-limit");
    flags+=("--cursor.mode=");
    two_word_flags+=("--cursor.mode");
    flags+=("--base.foreground=");
    two_word_flags+=("--base.foreground");
    flags+=("--cursor-line-number.foreground=");
    two_word_flags+=("--cursor-line-number.foreground");
    flags+=("--cursor-line.foreground=");
    two_word_flags+=("--cursor-line.foreground");
    flags+=("--cursor.foreground=");
    two_word_flags+=("--cursor.foreground");
    flags+=("--end-of-buffer.foreground=");
    two_word_flags+=("--end-of-buffer.foreground");
    flags+=("--line-number.foreground=");
    two_word_flags+=("--line-number.foreground");
    flags+=("--header.foreground=");
    two_word_flags+=("--header.foreground");
    flags+=("--placeholder.foreground=");
    two_word_flags+=("--placeholder.foreground");
    flags+=("--prompt.foreground=");
    two_word_flags+=("--prompt.foreground");
    noun_aliases=()
}
_have () 
{ 
    PATH=$PATH:/usr/sbin:/sbin:/usr/local/sbin type $1 &> /dev/null
}
_included_ssh_config_files () 
{ 
    (($# < 1)) && echo "bash_completion: $FUNCNAME: missing mandatory argument CONFIG" 1>&2;
    local configfile i f;
    configfile=$1;
    local reset=$(shopt -po noglob);
    set -o noglob;
    local included=($(command sed -ne 's/^[[:blank:]]*[Ii][Nn][Cc][Ll][Uu][Dd][Ee][[:blank:]]\(.*\)$/\1/p' "${configfile}"));
    $reset;
    [[ -n ${included-} ]] || return;
    for i in "${included[@]}";
    do
        if ! [[ $i =~ ^\~.*|^\/.* ]]; then
            if [[ $configfile =~ ^\/etc\/ssh.* ]]; then
                i="/etc/ssh/$i";
            else
                i="$HOME/.ssh/$i";
            fi;
        fi;
        __expand_tilde_by_ref i;
        set +o noglob;
        for f in $i;
        do
            if [[ -r $f ]]; then
                config+=("$f");
                _included_ssh_config_files $f;
            fi;
        done;
        $reset;
    done
}
_init_completion () 
{ 
    local exclude="" flag outx errx inx OPTIND=1;
    while getopts "n:e:o:i:s" flag "$@"; do
        case $flag in 
            n)
                exclude+=$OPTARG
            ;;
            e)
                errx=$OPTARG
            ;;
            o)
                outx=$OPTARG
            ;;
            i)
                inx=$OPTARG
            ;;
            s)
                split=false;
                exclude+==
            ;;
            *)
                echo "bash_completion: $FUNCNAME: usage error" 1>&2;
                return 1
            ;;
        esac;
    done;
    COMPREPLY=();
    local redir="@(?([0-9])<|?([0-9&])>?(>)|>&)";
    _get_comp_words_by_ref -n "$exclude<>&" cur prev words cword;
    _variables && return 1;
    if [[ $cur == $redir* || ${prev-} == $redir ]]; then
        local xspec;
        case $cur in 
            2'>'*)
                xspec=${errx-}
            ;;
            *'>'*)
                xspec=${outx-}
            ;;
            *'<'*)
                xspec=${inx-}
            ;;
            *)
                case $prev in 
                    2'>'*)
                        xspec=${errx-}
                    ;;
                    *'>'*)
                        xspec=${outx-}
                    ;;
                    *'<'*)
                        xspec=${inx-}
                    ;;
                esac
            ;;
        esac;
        cur="${cur##$redir}";
        _filedir $xspec;
        return 1;
    fi;
    local i skip;
    for ((i = 1; i < ${#words[@]}; 1))
    do
        if [[ ${words[i]} == $redir* ]]; then
            [[ ${words[i]} == $redir ]] && skip=2 || skip=1;
            words=("${words[@]:0:i}" "${words[@]:i+skip}");
            ((i <= cword)) && ((cword -= skip));
        else
            ((i++));
        fi;
    done;
    ((cword <= 0)) && return 1;
    prev=${words[cword - 1]};
    [[ -n ${split-} ]] && _split_longopt && split=true;
    return 0
}
_installed_modules () 
{ 
    COMPREPLY=($(compgen -W "$(PATH="$PATH:/sbin" lsmod |
        awk '{if (NR != 1) print $1}')" -- "$1"))
}
_ip_addresses () 
{ 
    local n;
    case ${1-} in 
        -a)
            n='6\?'
        ;;
        -6)
            n='6'
        ;;
        *)
            n=
        ;;
    esac;
    local PATH=$PATH:/sbin;
    local addrs=$({
        LC_ALL=C ifconfig -a || ip addr show
    } 2>/dev/null |
        command sed -e 's/[[:space:]]addr:/ /' -ne             "s|.*inet${n}[[:space:]]\{1,\}\([^[:space:]/]*\).*|\1|p");
    COMPREPLY+=($(compgen -W "$addrs" -- "${cur-}"))
}
_kernel_versions () 
{ 
    COMPREPLY=($(compgen -W '$(command ls /lib/modules)' -- "$cur"))
}
_known_hosts () 
{ 
    local cur prev words cword;
    _init_completion -n : || return;
    local options;
    [[ ${1-} == -a || ${2-} == -a ]] && options=-a;
    [[ ${1-} == -c || ${2-} == -c ]] && options+=" -c";
    _known_hosts_real ${options-} -- "$cur"
}
_known_hosts_real () 
{ 
    local configfile flag prefix="" ifs=$IFS;
    local cur suffix="" aliases i host ipv4 ipv6;
    local -a kh tmpkh=() khd=() config=();
    local OPTIND=1;
    while getopts "ac46F:p:" flag "$@"; do
        case $flag in 
            a)
                aliases='yes'
            ;;
            c)
                suffix=':'
            ;;
            F)
                configfile=$OPTARG
            ;;
            p)
                prefix=$OPTARG
            ;;
            4)
                ipv4=1
            ;;
            6)
                ipv6=1
            ;;
            *)
                echo "bash_completion: $FUNCNAME: usage error" 1>&2;
                return 1
            ;;
        esac;
    done;
    if (($# < OPTIND)); then
        echo "bash_completion: $FUNCNAME: missing mandatory argument CWORD" 1>&2;
        return 1;
    fi;
    cur=${!OPTIND};
    ((OPTIND += 1));
    if (($# >= OPTIND)); then
        echo "bash_completion: $FUNCNAME($*): unprocessed arguments:" "$(while (($# >= OPTIND)); do
                printf '%s ' ${!OPTIND}
                shift
            done)" 1>&2;
        return 1;
    fi;
    [[ $cur == *@* ]] && prefix=$prefix${cur%@*}@ && cur=${cur#*@};
    kh=();
    if [[ -v configfile ]]; then
        [[ -r $configfile ]] && config+=("$configfile");
    else
        for i in /etc/ssh/ssh_config ~/.ssh/config ~/.ssh2/config;
        do
            [[ -r $i ]] && config+=("$i");
        done;
    fi;
    local reset=$(shopt -po noglob);
    set -o noglob;
    if ((${#config[@]} > 0)); then
        for i in "${config[@]}";
        do
            _included_ssh_config_files "$i";
        done;
    fi;
    if ((${#config[@]} > 0)); then
        local IFS='
';
        tmpkh=($(awk 'sub("^[ \t]*([Gg][Ll][Oo][Bb][Aa][Ll]|[Uu][Ss][Ee][Rr])[Kk][Nn][Oo][Ww][Nn][Hh][Oo][Ss][Tt][Ss][Ff][Ii][Ll][Ee][ \t]+", "") { print $0 }' "${config[@]}" | sort -u));
        IFS=$ifs;
    fi;
    if ((${#tmpkh[@]} != 0)); then
        local j;
        for i in "${tmpkh[@]}";
        do
            while [[ $i =~ ^([^\"]*)\"([^\"]*)\"(.*)$ ]]; do
                i=${BASH_REMATCH[1]}${BASH_REMATCH[3]};
                j=${BASH_REMATCH[2]};
                __expand_tilde_by_ref j;
                [[ -r $j ]] && kh+=("$j");
            done;
            for j in $i;
            do
                __expand_tilde_by_ref j;
                [[ -r $j ]] && kh+=("$j");
            done;
        done;
    fi;
    if [[ ! -v configfile ]]; then
        for i in /etc/ssh/ssh_known_hosts /etc/ssh/ssh_known_hosts2 /etc/known_hosts /etc/known_hosts2 ~/.ssh/known_hosts ~/.ssh/known_hosts2;
        do
            [[ -r $i ]] && kh+=("$i");
        done;
        for i in /etc/ssh2/knownhosts ~/.ssh2/hostkeys;
        do
            [[ -d $i ]] && khd+=("$i"/*pub);
        done;
    fi;
    if ((${#kh[@]} + ${#khd[@]} > 0)); then
        if ((${#kh[@]} > 0)); then
            for i in "${kh[@]}";
            do
                while read -ra tmpkh; do
                    ((${#tmpkh[@]} == 0)) && continue;
                    set -- "${tmpkh[@]}";
                    [[ $1 == [\|\#]* ]] && continue;
                    [[ $1 == @* ]] && shift;
                    local IFS=,;
                    for host in $1;
                    do
                        [[ $host == *[*?]* ]] && continue;
                        host="${host#[}";
                        host="${host%]?(:+([0-9]))}";
                        COMPREPLY+=($host);
                    done;
                    IFS=$ifs;
                done < "$i";
            done;
            COMPREPLY=($(compgen -W '${COMPREPLY[@]}' -- "$cur"));
        fi;
        if ((${#khd[@]} > 0)); then
            for i in "${khd[@]}";
            do
                if [[ $i == *key_22_$cur*.pub && -r $i ]]; then
                    host=${i/#*key_22_/};
                    host=${host/%.pub/};
                    COMPREPLY+=($host);
                fi;
            done;
        fi;
        for i in ${!COMPREPLY[*]};
        do
            COMPREPLY[i]=$prefix${COMPREPLY[i]}$suffix;
        done;
    fi;
    if [[ ${#config[@]} -gt 0 && -v aliases ]]; then
        local -a hosts=($(command sed -ne 's/^[[:blank:]]*[Hh][Oo][Ss][Tt][[:blank:]]\(.*\)$/\1/p' "${config[@]}"));
        if ((${#hosts[@]} != 0)); then
            COMPREPLY+=($(compgen -P "$prefix"                 -S "$suffix" -W '${hosts[@]%%[*?%]*}' -X '\!*' -- "$cur"));
        fi;
    fi;
    if [[ -n ${COMP_KNOWN_HOSTS_WITH_AVAHI-} ]] && type avahi-browse &> /dev/null; then
        COMPREPLY+=($(compgen -P "$prefix" -S "$suffix" -W             "$(avahi-browse -cpr _workstation._tcp 2>/dev/null |
                awk -F';' '/^=/ { print $7 }' | sort -u)" -- "$cur"));
    fi;
    if type ruptime &> /dev/null; then
        COMPREPLY+=($(compgen -W             "$(ruptime 2>/dev/null | awk '!/^ruptime:/ { print $1 }')"             -- "$cur"));
    fi;
    if [[ -n ${COMP_KNOWN_HOSTS_WITH_HOSTFILE-1} ]]; then
        COMPREPLY+=($(compgen -A hostname -P "$prefix" -S "$suffix" -- "$cur"));
    fi;
    $reset;
    if [[ -v ipv4 ]]; then
        COMPREPLY=("${COMPREPLY[@]/*:*$suffix/}");
    fi;
    if [[ -v ipv6 ]]; then
        COMPREPLY=("${COMPREPLY[@]/+([0-9]).+([0-9]).+([0-9]).+([0-9])$suffix/}");
    fi;
    if [[ -v ipv4 || -v ipv6 ]]; then
        for i in "${!COMPREPLY[@]}";
        do
            [[ -n ${COMPREPLY[i]} ]] || unset -v "COMPREPLY[i]";
        done;
    fi;
    __ltrim_colon_completions "$prefix$cur"
}
_l () 
{ 
    _bashmarks_list_names "$@"
}
_list_bookmark () 
{ 
    _bashmarks_list "$@"
}
_longopt () 
{ 
    local cur prev words cword split;
    _init_completion -s || return;
    case "${prev,,}" in 
        --help | --usage | --version)
            return
        ;;
        --!(no-*)dir*)
            _filedir -d;
            return
        ;;
        --!(no-*)@(file|path)*)
            _filedir;
            return
        ;;
        --+([-a-z0-9_]))
            local argtype=$(LC_ALL=C $1 --help 2>&1 | command sed -ne                 "s|.*$prev\[\{0,1\}=[<[]\{0,1\}\([-A-Za-z0-9_]\{1,\}\).*|\1|p");
            case ${argtype,,} in 
                *dir*)
                    _filedir -d;
                    return
                ;;
                *file* | *path*)
                    _filedir;
                    return
                ;;
            esac
        ;;
    esac;
    $split && return;
    if [[ $cur == -* ]]; then
        COMPREPLY=($(compgen -W "$(LC_ALL=C $1 --help 2>&1 |
            while read -r line; do
                [[ $line =~ --[A-Za-z0-9]+([-_][A-Za-z0-9]+)*=? ]] &&
                    printf '%s\n' ${BASH_REMATCH[0]}
            done)" -- "$cur"));
        [[ ${COMPREPLY-} == *= ]] && compopt -o nospace;
    else
        if [[ $1 == *@(rmdir|chroot) ]]; then
            _filedir -d;
        else
            [[ $1 == *mkdir ]] && compopt -o nospace;
            _filedir;
        fi;
    fi
}
_mac_addresses () 
{ 
    local re='\([A-Fa-f0-9]\{2\}:\)\{5\}[A-Fa-f0-9]\{2\}';
    local PATH="$PATH:/sbin:/usr/sbin";
    COMPREPLY+=($(
        {
            LC_ALL=C ifconfig -a || ip link show
        } 2>/dev/null | command sed -ne             "s/.*[[:space:]]HWaddr[[:space:]]\{1,\}\($re\)[[:space:]].*/\1/p" -ne             "s/.*[[:space:]]HWaddr[[:space:]]\{1,\}\($re\)[[:space:]]*$/\1/p" -ne             "s|.*[[:space:]]\(link/\)\{0,1\}ether[[:space:]]\{1,\}\($re\)[[:space:]].*|\2|p" -ne             "s|.*[[:space:]]\(link/\)\{0,1\}ether[[:space:]]\{1,\}\($re\)[[:space:]]*$|\2|p"
    ));
    COMPREPLY+=($({
        arp -an || ip neigh show
    } 2>/dev/null | command sed -ne         "s/.*[[:space:]]\($re\)[[:space:]].*/\1/p" -ne         "s/.*[[:space:]]\($re\)[[:space:]]*$/\1/p"));
    COMPREPLY+=($(command sed -ne         "s/^[[:space:]]*\($re\)[[:space:]].*/\1/p" /etc/ethers 2>/dev/null));
    COMPREPLY=($(compgen -W '${COMPREPLY[@]}' -- "$cur"));
    __ltrim_colon_completions "$cur"
}
_minimal () 
{ 
    local cur prev words cword split;
    _init_completion -s || return;
    $split && return;
    _filedir
}
_moFindEndTag () 
{ 
    local content remaining scanned standaloneBytes tag;
    scanned="";
    _moSplit content "$2" '{{' '}}';
    while [[ "${#content[@]}" -gt 1 ]]; do
        _moTrimWhitespace tag "${content[1]}";
        content[1]='{{'"${content[1]}"'}}';
        case $tag in 
            '#'* | '^'*)
                scanned="${scanned}${content[0]}${content[1]}";
                _moTrimWhitespace tag "${tag:1}";
                _moFindEndTag content "${content[2]}" "$tag" "loop";
                scanned="${scanned}${content[0]}${content[1]}";
                remaining=${content[2]}
            ;;
            '/'*)
                _moTrimWhitespace tag "${tag:1}";
                scanned="$scanned${content[0]}";
                if [[ "$tag" == "$3" ]]; then
                    if [[ -z "${4-}" ]] && _moIsStandalone standaloneBytes "$scanned" "${content[2]}" true; then
                        standaloneBytes=($standaloneBytes);
                        content[1]="${scanned:${standaloneBytes[0]}}${content[1]}${content[2]:0:${standaloneBytes[1]}}";
                        scanned="${scanned:0:${standaloneBytes[0]}}";
                        content[2]="${content[2]:${standaloneBytes[1]}}";
                    fi;
                    local "$1" && _moIndirectArray "$1" "$scanned" "${content[1]}" "${content[2]}";
                    return 0;
                fi;
                scanned="$scanned${content[1]}";
                remaining=${content[2]}
            ;;
            *)
                scanned="${scanned}${content[0]}${content[1]}";
                remaining=${content[2]}
            ;;
        esac;
        _moSplit content "$remaining" '{{' '}}';
    done;
    scanned="$scanned${content[0]}";
    local "$1" && _moIndirectArray "$1" "${scanned}" "" ""
}
_moFindString () 
{ 
    local pos string;
    string=${2%%$3*};
    [[ "$string" == "$2" ]] && pos=-1 || pos=${#string};
    local "$1" && _moIndirect "$1" "$pos"
}
_moFullTagName () 
{ 
    if [[ -z "${2-}" ]] || [[ "$2" == *.* ]]; then
        local "$1" && _moIndirect "$1" "$3";
    else
        local "$1" && _moIndirect "$1" "${2}.${3}";
    fi
}
_moGetContent () 
{ 
    local content filename target;
    target=$1;
    shift;
    if [[ "${#@}" -gt 0 ]]; then
        content="";
        for filename in "$@";
        do
            content="$content"'{{>'"$filename"'}}';
        done;
    else
        _moLoadFile content /dev/stdin;
    fi;
    local "$target" && _moIndirect "$target" "$content"
}
_moIndentLines () 
{ 
    local content fragment len posN posR result trimmed;
    result="";
    len=$((${#3} - 1));
    content="${3:0:$len}";
    if [[ -z "${2-}" ]]; then
        local "$1" && _moIndirect "$1" "$content";
        return 0;
    fi;
    _moFindString posN "$content" '
';
    _moFindString posR "$content" '';
    while [[ "$posN" -gt -1 ]] || [[ "$posR" -gt -1 ]]; do
        if [[ "$posN" -gt -1 ]]; then
            fragment="${content:0:$posN + 1}";
            content=${content:$posN + 1};
        else
            fragment="${content:0:$posR + 1}";
            content=${content:$posR + 1};
        fi;
        _moTrimChars trimmed "$fragment" false true " " '	' '
' '';
        if [[ -n "$trimmed" ]]; then
            fragment="$2$fragment";
        fi;
        result="$result$fragment";
        _moFindString posN "$content" '
';
        _moFindString posR "$content" '';
    done;
    _moTrimChars trimmed "$content" false true " " '	';
    if [[ -n "$trimmed" ]]; then
        content="$2$content";
    fi;
    result="$result$content";
    local "$1" && _moIndirect "$1" "$result"
}
_moIndirect () 
{ 
    unset -v "$1";
    printf -v "$1" '%s' "$2"
}
_moIndirectArray () 
{ 
    unset -v "$1";
    eval "$(printf "IFS= %s=(\"\${@:2}\") IFS=%q" "$1" "$IFS")"
}
_moIsArray () 
{ 
    local moTestResult;
    moTestResult=$(declare -p "$1" 2>/dev/null) || return 1;
    [[ "${moTestResult:0:10}" == "declare -a" ]] && return 0;
    [[ "${moTestResult:0:10}" == "declare -A" ]] && return 0;
    return 1
}
_moIsFunction () 
{ 
    local functionList functionName;
    functionList=$(declare -F);
    functionList=(${functionList//declare -f /});
    for functionName in "${functionList[@]}";
    do
        if [[ "$functionName" == "$1" ]]; then
            return 0;
        fi;
    done;
    return 1
}
_moIsStandalone () 
{ 
    local afterTrimmed beforeTrimmed char;
    _moTrimChars beforeTrimmed "$2" false true " " '	';
    _moTrimChars afterTrimmed "$3" true false " " '	';
    char=$((${#beforeTrimmed} - 1));
    char=${beforeTrimmed:$char};
    if [[ "$char" != '
' ]] && [[ "$char" != '' ]]; then
        if [[ -n "$char" ]] || ! $4; then
            return 1;
        fi;
    fi;
    char=${afterTrimmed:0:1};
    if [[ "$char" != '
' ]] && [[ "$char" != '' ]] && [[ -n "$char" ]]; then
        return 2;
    fi;
    if [[ "$char" == '' ]] && [[ "${afterTrimmed:1:1}" == '
' ]]; then
        char="$char"'
';
    fi;
    local "$1" && _moIndirect "$1" "$((${#beforeTrimmed})) $((${#3} + ${#char} - ${#afterTrimmed}))"
}
_moJoin () 
{ 
    local joiner part result target;
    target=$1;
    joiner=$2;
    result=$3;
    shift 3;
    for part in "$@";
    do
        result="$result$joiner$part";
    done;
    local "$target" && _moIndirect "$target" "$result"
}
_moLoadFile () 
{ 
    local content len;
    content=$(cat -- "$2"; echo '.');
    len=$((${#content} - 1));
    content=${content:0:$len};
    local "$1" && _moIndirect "$1" "$content"
}
_moLoop () 
{ 
    local content context contextBase;
    content=$1;
    contextBase=$2;
    shift 2;
    while [[ "${#@}" -gt 0 ]]; do
        _moFullTagName context "$contextBase" "$1";
        _moParse "$content" "$context" false;
        shift;
    done
}
_moParse () 
{ 
    local moBlock moContent moCurrent moIsBeginning moTag;
    moCurrent=$2;
    moIsBeginning=$3;
    _moSplit moContent "$1" '{{' '}}';
    while [[ "${#moContent[@]}" -gt 1 ]]; do
        _moTrimWhitespace moTag "${moContent[1]}";
        case $moTag in 
            '#'*)
                _moStandaloneAllowed moContent "${moContent[@]}" "$moIsBeginning";
                _moTrimWhitespace moTag "${moTag:1}";
                _moFindEndTag moBlock "$moContent" "$moTag";
                _moFullTagName moTag "$moCurrent" "$moTag";
                if _moTest "$moTag"; then
                    if _moIsFunction "$moTag"; then
                        moContent=$($moTag "${moBlock[0]}");
                        _moParse "$moContent" "$moCurrent" false;
                        moContent="${moBlock[2]}";
                    else
                        if _moIsArray "$moTag"; then
                            eval "_moLoop \"\${moBlock[0]}\" \"$moTag\" \"\${!${moTag}[@]}\"";
                        else
                            _moParse "${moBlock[0]}" "$moCurrent" false;
                        fi;
                    fi;
                fi;
                moContent="${moBlock[2]}"
            ;;
            '>'*)
                _moPartial moContent "${moContent[@]}" "$moIsBeginning" "$moCurrent"
            ;;
            '/'*)
                _moStandaloneAllowed moContent "${moContent[@]}" "$moIsBeginning"
            ;;
            '^'*)
                _moStandaloneAllowed moContent "${moContent[@]}" "$moIsBeginning";
                _moTrimWhitespace moTag "${moTag:1}";
                _moFindEndTag moBlock "$moContent" "$moTag";
                _moFullTagName moTag "$moCurrent" "$moTag";
                if ! _moTest "$moTag"; then
                    _moParse "${moBlock[0]}" "$moCurrent" false "$moCurrent";
                fi;
                moContent="${moBlock[2]}"
            ;;
            '!'*)
                _moStandaloneAllowed moContent "${moContent[@]}" "$moIsBeginning"
            ;;
            .)
                _moStandaloneDenied moContent "${moContent[@]}";
                _moShow "$moCurrent" "$moCurrent"
            ;;
            '=')
                _moStandaloneAllowed moContent "${moContent[@]}" "$moIsBeginning"
            ;;
            '{'*)
                _moStandaloneDenied moContent "${moContent[@]}";
                moContent="${moTag:1}"'}}'"$moContent";
                _moSplit moContent "$moContent" '}}}';
                _moTrimWhitespace moTag "${moContent[0]}";
                _moFullTagName moTag "$moCurrent" "$moTag";
                moContent=${moContent[1]};
                _moShow "$moTag" "$moCurrent"
            ;;
            '&'*)
                _moStandaloneDenied moContent "${moContent[@]}";
                _moTrimWhitespace moTag "${moTag:1}";
                _moFullTagName moTag "$moCurrent" "$moTag";
                _moShow "$moTag" "$moCurrent"
            ;;
            *)
                _moStandaloneDenied moContent "${moContent[@]}";
                _moFullTagName moTag "$moCurrent" "$moTag";
                _moShow "$moTag" "$moCurrent"
            ;;
        esac;
        moIsBeginning=false;
        _moSplit moContent "$moContent" '{{' '}}';
    done;
    echo -n "${moContent[0]}"
}
_moPartial () 
{ 
    local moContent moFilename moIndent moPartial moStandalone;
    if _moIsStandalone moStandalone "$2" "$4" "$5"; then
        moStandalone=($moStandalone);
        echo -n "${2:0:${moStandalone[0]}}";
        moIndent=${2:${moStandalone[0]}};
        moContent=${4:${moStandalone[1]}};
    else
        moIndent="";
        echo -n "$2";
        moContent=$4;
    fi;
    _moTrimWhitespace moFilename "${3:1}";
    ( _omb_directories_cd "$(dirname -- "$moFilename")" || exit 1;
    _moIndentLines moPartial "$moIndent" "$(
            _moLoadFile moPartial "${moFilename##*/}"

            # Fix bash handling of subshells
            # The extra dot is removed in _moIndentLines
            echo -n "${moPartial}."
        )";
    _moParse "$moPartial" "$6" true );
    local "$1" && _moIndirect "$1" "$moContent"
}
_moShow () 
{ 
    local moJoined moNameParts;
    if _moIsFunction "$1"; then
        CONTENT=$($1 "");
        _moParse "$CONTENT" "$2" false;
        return 0;
    fi;
    _moSplit moNameParts "$1" ".";
    if [[ -z "${moNameParts[1]}" ]]; then
        if _moIsArray "$1"; then
            eval _moJoin moJoined "," "\${$1[@]}";
            echo -n "$moJoined";
        else
            echo -n "${!1}";
        fi;
    else
        eval "echo -n \"\${${moNameParts[0]}[${moNameParts[1]%%.*}]}\"";
    fi
}
_moSplit () 
{ 
    local pos result;
    result=("$2");
    _moFindString pos "${result[0]}" "$3";
    if [[ "$pos" -ne -1 ]]; then
        result[1]=${result[0]:$pos + ${#3}};
        result[0]=${result[0]:0:$pos};
        if [[ -n "${4-}" ]]; then
            _moFindString pos "${result[1]}" "$4";
            if [[ "$pos" -ne -1 ]]; then
                result[2]="${result[1]:$pos + ${#4}}";
                result[1]="${result[1]:0:$pos}";
            fi;
        fi;
    fi;
    local "$1" && _moIndirectArray "$1" "${result[@]}"
}
_moStandaloneAllowed () 
{ 
    local bytes;
    if _moIsStandalone bytes "$2" "$4" "$5"; then
        bytes=($bytes);
        echo -n "${2:0:${bytes[0]}}";
        local "$1" && _moIndirect "$1" "${4:${bytes[1]}}";
    else
        echo -n "$2";
        local "$1" && _moIndirect "$1" "$4";
    fi
}
_moStandaloneDenied () 
{ 
    echo -n "$2";
    local "$1" && _moIndirect "$1" "$4"
}
_moTest () 
{ 
    _moIsFunction "$1" && return 0;
    if _moIsArray "$1"; then
        eval "[[ \"\${#${1}[@]}\" -gt 0 ]]" && return 0;
    else
        [[ -n "${MO_FALSE_IS_EMPTY-}" ]] && [[ "${!1-}" == "false" ]] && return 1;
        [[ -n "${!1}" ]] && return 0;
    fi;
    return 1
}
_moTrimChars () 
{ 
    local back current front last target varName;
    target=$1;
    current=$2;
    front=$3;
    back=$4;
    last="";
    shift 4;
    while [[ "$current" != "$last" ]]; do
        last=$current;
        for varName in "$@";
        do
            $front && current="${current/#$varName}";
            $back && current="${current/%$varName}";
        done;
    done;
    local "$target" && _moIndirect "$target" "$current"
}
_moTrimWhitespace () 
{ 
    local result;
    _moTrimChars result "$2" true true '' '
' '	' " ";
    local "$1" && _moIndirect "$1" "$result"
}
_moUsage () 
{ 
    grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} '^#/' "${MO_ORIGINAL_COMMAND}" | cut -c 4-
}
_modules () 
{ 
    local modpath;
    modpath=/lib/modules/$1;
    COMPREPLY=($(compgen -W "$(command ls -RL $modpath 2>/dev/null |
        command sed -ne 's/^\(.*\)\.k\{0,1\}o\(\.[gx]z\)\{0,1\}$/\1/p')" -- "$cur"))
}
_ncpus () 
{ 
    local var=NPROCESSORS_ONLN;
    [[ $OSTYPE == *linux* ]] && var=_$var;
    local n=$(getconf $var 2>/dev/null);
    printf %s ${n:-1}
}
_npm_completion () 
{ 
    local words cword;
    if type _get_comp_words_by_ref &> /dev/null; then
        _get_comp_words_by_ref -n = -n @ -n : -w words -i cword;
    else
        cword="$COMP_CWORD";
        words=("${COMP_WORDS[@]}");
    fi;
    local si="$IFS";
    if ! IFS='
' COMPREPLY=($(COMP_CWORD="$cword"                            COMP_LINE="$COMP_LINE"                            COMP_POINT="$COMP_POINT"                            npm completion -- "${words[@]}"                            2>/dev/null)); then
        local ret=$?;
        IFS="$si";
        return $ret;
    fi;
    IFS="$si";
    if type __ltrim_colon_completions &> /dev/null; then
        __ltrim_colon_completions "${words[cword]}";
    fi
}
_omb_completion_reassemble_breaks () 
{ 
    local exclude=$1;
    local line=$COMP_LINE point=$COMP_POINT;
    local breaks=${COMP_WORDBREAKS//[\"\'$exclude]};
    COMPREPLY=();
    cur=("${COMP_WORDS[COMP_CWORD]}" '');
    local word rprefix= rword=;
    for word in "${COMP_WORDS[@]::COMP_CWORD+1}";
    do
        local space=${line%%"$word"*};
        if [[ $space == "$line" ]]; then
            return 1;
        fi;
        word=${word::point - ${#space}};
        if [[ -n $space || $rword == *["$breaks"] || $word == ["$breaks"]* ]]; then
            rprefix=;
            rword=$word;
        else
            rprefix=$rword;
            rword+=$word;
        fi;
        line=${line:${#space}+${#word}};
        ((point -= ${#space} + ${#word}));
        ((point >= 0)) || break;
    done;
    cur=("$rword" "$rprefix")
}
_omb_completion_resolve_breaks () 
{ 
    if [[ -n ${cur[1]} ]]; then
        local i;
        for i in "${!COMPREPLY[@]}";
        do
            if [[ ${COMPREPLY[i]} == "$cur_prefix"* ]]; then
                COMPREPLY[i]=${COMPREPLY[i]#"$cur_prefix"};
            else
                unset -v 'COMPREPLY[i]';
            fi;
        done;
        COMPREPLY=("${COMPREPLY[@]}");
    fi
}
_omb_completion_ssh () 
{ 
    local cur;
    _omb_completion_reassemble_breaks :;
    if [[ $cur == *@* ]]; then
        local -a options=(-P "${cur%%@*}@" -- "${cur#*@}");
    else
        local -a options=(-- "$cur");
    fi;
    if [[ -r $HOME/.ssh/config ]]; then
        COMPREPLY=($(compgen -W "$(grep ^Host "$HOME/.ssh/config" | awk '{for (i=2; i<=NF; i++) print $i}' )" "${options[@]}"));
    fi;
    if [[ -r $HOME/.ssh/known_hosts ]]; then
        if grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} -v -q -e '^ ssh-rsa' "$HOME/.ssh/known_hosts"; then
            COMPREPLY+=($(compgen -W "$( awk '{print $1}' "$HOME/.ssh/known_hosts" | grep -v ^\| | cut -d, -f 1 | sed -e 's/\[//g' | sed -e 's/\]//g' | cut -d: -f1 | grep -v ssh-rsa)" "${options[@]}"));
        fi;
    fi;
    if [[ -r /etc/hosts ]]; then
        COMPREPLY+=($(compgen -W "$( grep -v '^[[:space:]]*$' /etc/hosts | grep -v '^#' | awk '{for (i=2; i<=NF; i++) print $i}' )" "${options[@]}"));
    fi;
    _omb_completion_resolve_breaks
}
_omb_deprecate_const () 
{ 
    local __ver=$1 __old=$2 __value=$3 __msg=$4;
    if [[ -n ${!__old+set} ]]; then
        return 0;
    fi;
    if ((_omb_version >= __ver)); then
        local __index=${#_omb_deprecate_const[@]};
        _omb_deprecate_const[__index]=$__old:$__msg;
        _omb_deprecate_const_value[__index]=$__value;
        printf -v "_omb_deprecate_Const_$__old" %s "$__value";
        eval "declare -gn $__old='_omb_deprecate_Const_$__old[_omb_deprecate_const_counter[$__index,\$BASH_SOURCE,\$LINENO]+=\$(_omb_deprecate_const__notify $__index),0]'";
    else
        printf -v "$__old" %s "$__value";
    fi
}
_omb_deprecate_const__notify () 
{ 
    local __index=$1;
    local __old=${_omb_deprecate_const[__index]%%:*};
    local __msg=${_omb_deprecate_const[__index]#*:};
    local __value=${_omb_deprecate_const_value[__index]};
    local __ref=_omb_deprecate_Const_$__old;
    if [[ ${!__ref-} == "$__value" ]]; then
        local count=${_omb_deprecate_const_counter[$__index,${BASH_SOURCE[1]},${BASH_LINENO[0]}]:-0};
        if ((count == 0)); then
            local esc_old=$_omb_term_bold_brown$__old$_omb_term_reset;
            _omb_deprecate_warning 1 "The variable '$esc_old' has been deprecated.${__msg+ $__msg}" 1>&2;
        fi;
    fi;
    echo 1
}
_omb_deprecate_const__sync () 
{ 
    local __index __old __curval __compaction=;
    for __index in "${!_omb_deprecate_const[@]}";
    do
        __old=${_omb_deprecate_const[__index]%%:*};
        [[ -n $__old ]] || continue;
        __ref=_omb_deprecate_Const_$__old;
        __curval=${!__ref-};
        if [[ $__curval != "${_omb_deprecate_const_value[__index]}" ]]; then
            _omb_deprecate_const[__index]=;
            _omb_deprecate_const_value[__index]=;
            unset -n "$__old";
            printf -v "$__old" %s "$__curval";
        fi;
    done
}
_omb_deprecate_declare () 
{ 
    local __ver=$1 __old=$2 __new=$3 __opts=$4 __msg=$5;
    _omb_deprecate_declare__init;
    unset -n "$__old";
    unset -v "$__old";
    if ((_omb_version >= __ver)); then
        local __index=${#_omb_deprecate_declare[@]};
        _omb_deprecate_declare[__index]=$__old:$__new:$__msg;
        eval "declare -gn $__old='$__new[_omb_deprecate_declare_counter[$__index,\$BASH_SOURCE,\$LINENO]+=\$(_omb_deprecate_declare__notify $__index),0]'";
    else
        eval "declare -gn $__old='$__new'";
    fi
}
_omb_deprecate_declare__init () 
{ 
    if [[ -n ${!__old+set} ]]; then
        __opts=$__opts:notified;
        if ((_omb_version >= __ver)); then
            if [[ -n $__new ]]; then
                printf '%s\n' "oh-my-bash: The variable '$__old' is set but has been renamed to '$__new'.  Please use '$__new'.";
            else
                printf '%s\n' "oh-my-bash: The variable '$__old' is set but has been deprecated.${__msg+ $__msg}";
            fi > /dev/tty;
        fi;
        if [[ -n $__new && ! -n ${!__new+set} ]]; then
            printf -v "$__new" '%s' "${!__old}";
        fi;
    fi
}
_omb_deprecate_declare__notify () 
{ 
    local __index=$1 data=${_omb_deprecate_declare[__index]};
    local __old=${data%%:*};
    data=${data#*:};
    local __new=${data%%:*};
    data=${data#*:};
    local __msg=$data;
    local count=${_omb_deprecate_declare_counter[$__index,${BASH_SOURCE[1]},${BASH_LINENO[0]}]:-0};
    if ((count == 0)); then
        local esc_old=$_omb_term_bold_brown$__old$_omb_term_reset;
        local esc_new=$_omb_term_bold_navy$__new$_omb_term_reset;
        if [[ -n $__new ]]; then
            _omb_deprecate_warning 1 "The variable '$esc_old' has been renamed to '$esc_new'. Please use '$esc_new'.";
        else
            _omb_deprecate_warning 1 "The variable '$esc_old' has been deprecated.${__msg+ $__msg}";
        fi > /dev/tty;
    fi;
    echo 1
}
_omb_deprecate_function () 
{ 
    local warning=;
    ((_omb_version >= $1)) && warning="_omb_deprecate_function__notify '$2' '$3'; ";
    builtin eval -- "function $2 { $warning$3 \"\$@\"; }"
}
_omb_deprecate_function__notify () 
{ 
    local old=$1 new=$2;
    local v=__omb_deprecate_Function_$old;
    v=${v//[!a-zA-Z0-9_]/'_'};
    [[ -n ${!v+set} ]] && return 0;
    local esc_old=$_omb_term_bold_brown$old$_omb_term_reset;
    local esc_new=$_omb_term_bold_navy$new$_omb_term_reset;
    _omb_deprecate_warning 2 "The function '$esc_old' is deprecated. Please use '$esc_new'." 1>&2;
    printf -v "$v" notified
}
_omb_deprecate_warning () 
{ 
    local level=$1 msg=$2;
    local sep=$_omb_term_teal:;
    local src=$_omb_term_purple${BASH_SOURCE[level+1]};
    local line=$_omb_term_green${BASH_LINENO[level]};
    local func=${FUNCNAME[level+1]};
    if [[ -n $func && $func != source ]]; then
        func=" $_omb_term_teal($_omb_term_navy$func$_omb_term_teal)";
    else
        func=;
    fi;
    printf '%s\n' "$src$sep$line$func$sep$_omb_term_reset $msg"
}
_omb_directories_cd () 
{ 
    local -i index;
    if [[ $# -eq 1 && $1 =~ ^-[1-9]+$ ]]; then
        index=${1#-};
        if ((index >= ${#_omb_cd_dirstack[@]})); then
            builtin echo "cd: no such entry in dir stack" 1>&2;
            return 1;
        fi;
        set -- "${_omb_cd_dirstack[index]}";
    fi;
    if [[ ${OMB_DIRECTORIES_CD_USE_PUSHD-} == true ]]; then
        local oldpwd=$OLDPWD;
        builtin pushd . > /dev/null && OLDPWD=$oldpwd builtin cd "$@" && oldpwd=$OLDPWD && builtin pushd . > /dev/null && for ((index = ${#DIRSTACK[@]} - 1; index >= 1; index--))
        do
            if [[ ${DIRSTACK[0]/#~/$HOME} == "${DIRSTACK[index]}" ]]; then
                builtin popd "+$index" > /dev/null || return 1;
            fi;
        done;
        local status=$?;
        _omb_cd_dirstack=("${DIRSTACK[@]/#~/$HOME}");
        OLDPWD=$oldpwd;
    else
        [[ ${_omb_cd_dirstack[0]} == "$PWD" ]] || _omb_cd_dirstack=("$PWD" "${_omb_cd_dirstack[@]}");
        builtin cd "$@" && _omb_cd_dirstack=("$PWD" "${_omb_cd_dirstack[@]}");
        local status=$?;
        for ((index = ${#_omb_cd_dirstack[@]} - 1; index >= 1; index--))
        do
            if [[ ${_omb_cd_dirstack[0]} == "${_omb_cd_dirstack[index]}" ]]; then
                unset -v '_omb_cd_dirstack[index]';
            fi;
        done;
        _omb_cd_dirstack=("${_omb_cd_dirstack[@]}");
    fi;
    return "$status"
}
_omb_log_arrow () 
{ 
    printf "➜ %s\n" "$@"
}
_omb_log_bold () 
{ 
    printf "${_omb_term_bold}%s${_omb_term_reset}\n" "$@"
}
_omb_log_error () 
{ 
    printf "${_omb_term_brown}✖ %s${_omb_term_reset}\n" "$@"
}
_omb_log_header () 
{ 
    printf "\n${_omb_term_bold}${_omb_term_violet}==========  %s  ==========${_omb_term_reset}\n" "$@"
}
_omb_log_note () 
{ 
    printf "${_omb_term_underline}${_omb_term_bold}${_omb_term_navy}Note:${_omb_term_reset}  ${_omb_term_olive}%s${_omb_term_reset}\n" "$@"
}
_omb_log_success () 
{ 
    printf "${_omb_term_green}✔ %s${_omb_term_reset}\n" "$@"
}
_omb_log_underline () 
{ 
    printf "${_omb_term_underline}${_omb_term_bold}%s${_omb_term_reset}\n" "$@"
}
_omb_log_warning () 
{ 
    printf "${_omb_term_olive}➜ %s${_omb_term_reset}\n" "$@"
}
_omb_module_require () 
{ 
    local status=0;
    local -a files=() modules=();
    while (($#)); do
        local type=lib name=$1;
        shift;
        [[ $name == *:* ]] && type=${name%%:*} name=${name#*:};
        name=${name%.bash};
        name=${name%.sh};
        local module=$type:$name;
        [[ ' '$_omb_module_loaded' ' == *" $module "* ]] && continue;
        local -a locations=();
        case $type in 
            lib)
                locations=({"$OSH_CUSTOM","$OSH"}/lib/"$name".{bash,sh})
            ;;
            plugin)
                locations=({"$OSH_CUSTOM","$OSH"}/plugins/"$name"/"$name".plugin.{bash,sh})
            ;;
            alias)
                locations=({"$OSH_CUSTOM","$OSH"}/aliases/"$name".aliases.{bash,sh})
            ;;
            completion)
                locations=({"$OSH_CUSTOM","$OSH"}/completions/"$name".completion.{bash,sh})
            ;;
            theme)
                locations=({"$OSH_CUSTOM"{,/themes},"$OSH"/themes}/"$name"/"$name".theme.{bash,sh})
            ;;
            *)
                echo "oh-my-bash (module_require): unknown module type '$type'." 1>&2;
                status=2;
                continue
            ;;
        esac;
        local path;
        for path in "${locations[@]}";
        do
            if [[ -f $path ]]; then
                files+=("$path");
                modules+=("$module");
                continue 2;
            fi;
        done;
        echo "oh-my-bash (module_require): module '$type:$name' not found." 1>&2;
        status=127;
    done;
    if ((status == 0)); then
        local i;
        for i in "${!files[@]}";
        do
            local path=${files[i]} module=${modules[i]};
            [[ ' '$_omb_module_loaded' ' == *" $module "* ]] && continue;
            _omb_module_loaded="$_omb_module_loaded $module";
            source "$path" || status=$?;
        done;
    fi;
    return "$status"
}
_omb_module_require_alias () 
{ 
    _omb_module_require "${@/#/alias:}"
}
_omb_module_require_completion () 
{ 
    _omb_module_require "${@/#/completion:}"
}
_omb_module_require_lib () 
{ 
    _omb_module_require "${@/#/lib:}"
}
_omb_module_require_plugin () 
{ 
    _omb_module_require "${@/#/plugin:}"
}
_omb_module_require_theme () 
{ 
    _omb_module_require "${@/#/theme:}"
}
_omb_prompt_color_initialize () 
{ 
    _omb_prompt_normal='\[\e[0m\]';
    _omb_prompt_reset_color='\[\e[39m\]';
    _omb_prompt_bold='\[\e[1m\]';
    local -a normal_colors=(black brown green olive navy purple teal silver);
    local -a bright_colors=(gray red lime yellow blue magenta cyan white);
    local bright_fg_prefix=9 bright_bg_prefix=10;
    ((_omb_term_colors >= 16)) || bright_fg_prefix=3 bright_bg_prefix=4;
    local index;
    for ((index = 0; index < 8; index++))
    do
        printf -v "_omb_prompt_${normal_colors[index]}" %s '\[\e[0;3'"$index"'m\]';
        printf -v "_omb_prompt_bold_${normal_colors[index]}" %s '\[\e[3'"$index"';1m\]';
        printf -v "_omb_prompt_underline_${normal_colors[index]}" %s '\[\e[3'"$index"';4m\]';
        printf -v "_omb_prompt_background_${normal_colors[index]}" %s '\[\e[4'"$index"'m\]';
        printf -v "_omb_prompt_${bright_colors[index]}" %s '\[\e[0;'"$bright_fg_prefix$index"'m\]';
        printf -v "_omb_prompt_bold_${bright_colors[index]}" %s '\[\e['"$bright_fg_prefix$index"';1m\]';
        printf -v "_omb_prompt_underline_${bright_colors[index]}" %s '\[\e['"$bright_fg_prefix$index"';4m\]';
        printf -v "_omb_prompt_background_${bright_colors[index]}" %s '\[\e['"$bright_bg_prefix$index"'m\]';
    done
}
_omb_prompt_format () 
{ 
    local __format=${3%%:*}_FORMAT;
    __format=${!__format-};
    if [[ ! -n $__format ]]; then
        local __prefix=${3#*:}_PREFIX;
        __prefix=${!__prefix-};
        local __suffix=${3#*:}_SUFFIX;
        __suffix=${!__suffix-};
        __format=${__prefix//'%'/'%%'}%s${__suffix//'%'/'%%'};
    fi;
    printf -v "$1" "$__format" "$2"
}
_omb_prompt_get_chruby () 
{ 
    chruby=;
    _omb_util_function_exists chruby || return 1;
    _omb_util_function_exists chruby_auto && chruby=$(chruby_auto);
    local ruby_version;
    ruby_version=$(ruby --version | command awk '{print $1, $2;}') || return;
    chruby | command grep -q '\*' || ruby_version="${ruby_version} (system)";
    _omb_prompt_format ruby_version "$ruby_version" OMB_PROMPT_CHRUBY:CHRUBY_THEME_PROMPT;
    chruby+=$ruby_version
}
_omb_prompt_get_condaenv () 
{ 
    condaenv=;
    [[ -n ${CONDA_DEFAULT_ENV-} && ${CONDA_SHLVL-} != 0 ]] || return 1;
    condaenv=$CONDA_DEFAULT_ENV;
    if [[ ${OMB_PROMPT_CONDAENV_USE_BASENAME-} == true ]]; then
        condaenv=$(basename "$condaenv");
    fi;
    _omb_prompt_format condaenv "$condaenv" OMB_PROMPT_CONDAENV:CONDAENV_THEME_PROMPT
}
_omb_prompt_get_python_env () 
{ 
    local virtualenv condaenv python_version;
    _omb_prompt_get_virtualenv;
    _omb_prompt_get_condaenv;
    _omb_prompt_get_python_version;
    python_env=$virtualenv$condaenv$python_version;
    [[ -n $python_env ]]
}
_omb_prompt_get_python_venv () 
{ 
    python_venv=;
    [[ ${OMB_PROMPT_SHOW_PYTHON_VENV-} == true ]] || return 1;
    local virtualenv condaenv;
    _omb_prompt_get_virtualenv;
    _omb_prompt_get_condaenv;
    python_venv=$virtualenv$condaenv;
    [[ -n $python_venv ]]
}
_omb_prompt_get_python_version () 
{ 
    python_version=$(python --version 2>&1 | command awk '{print "py-"$2;}');
    [[ -n $python_version ]] || return 1;
    _omb_prompt_format python_version "$python_version" OMB_PROMPT_PYTHON_VERSION:PYTHON_THEME_PROMPT
}
_omb_prompt_get_rbenv () 
{ 
    rbenv=;
    _omb_util_command_exists rbenv || return 1;
    rbenv=$(rbenv version-name);
    rbenv commands | command grep -q gemset && gemset=$(rbenv gemset active 2> /dev/null) && rbenv="$rbenv@${gemset%% *}";
    [[ $rbenv != system ]] || return 1;
    _omb_prompt_format rbenv "$rbenv" OMB_PROMPT_RBENV:RBENV_THEME_PROMPT
}
_omb_prompt_get_rbfu () 
{ 
    rbfu=$RBFU_RUBY_VERSION;
    [[ -n $rbfu ]] || return 1;
    _omb_prompt_format rbfu "$rbfu" OMB_PROMPT_RBFU:RBFU_THEME_PROMPT
}
_omb_prompt_get_ruby_env () 
{ 
    local rbfu rbenv rvm chruby;
    _omb_prompt_get_rbfu;
    _omb_prompt_get_rbenv;
    _omb_prompt_get_rvm;
    _omb_prompt_get_chruby;
    ruby_env=$rbfu$rbenv$rvm$chruby;
    [[ -n $ruby_env ]]
}
_omb_prompt_get_rvm () 
{ 
    rvm=;
    if _omb_util_command_exists rvm-prompt; then
        rvm=$(rvm-prompt);
    else
        if _omb_util_command_exists rvm; then
            local rvm_current=$(rvm tools identifier);
            local rvm_default=$(rvm strings default);
            [[ -n $rvm_current && -n $rvm_default && $rvm_current != "$rvm_default" ]] || return 1;
            rvm=$rvm_current;
        fi;
    fi;
    [[ -n $rvm ]] || return 1;
    _omb_prompt_format rvm "$rvm" OMB_PROMPT_RVM:RVM_THEME_PROMPT
}
_omb_prompt_get_virtualenv () 
{ 
    virtualenv=;
    [[ -n ${VIRTUAL_ENV-} ]] || return 1;
    _omb_prompt_format virtualenv "$(basename "$VIRTUAL_ENV")" OMB_PROMPT_VIRTUALENV:VIRTUALENV_THEME_PROMPT
}
_omb_prompt_git () 
{ 
    command git "$@"
}
_omb_prompt_print_chruby () 
{ 
    local chruby;
    _omb_prompt_get_chruby "$@" && printf '%s\n' "${chruby}"
}
_omb_prompt_print_condaenv () 
{ 
    local condaenv;
    _omb_prompt_get_condaenv "$@" && printf '%s\n' "${condaenv}"
}
_omb_prompt_print_python_env () 
{ 
    local python_env;
    _omb_prompt_get_python_env "$@" && printf '%s\n' "${python_env}"
}
_omb_prompt_print_python_venv () 
{ 
    local python_venv;
    _omb_prompt_get_python_venv "$@" && printf '%s\n' "${python_venv}"
}
_omb_prompt_print_python_version () 
{ 
    local python_version;
    _omb_prompt_get_python_version "$@" && printf '%s\n' "${python_version}"
}
_omb_prompt_print_rbenv () 
{ 
    local rbenv;
    _omb_prompt_get_rbenv "$@" && printf '%s\n' "${rbenv}"
}
_omb_prompt_print_rbfu () 
{ 
    local rbfu;
    _omb_prompt_get_rbfu "$@" && printf '%s\n' "${rbfu}"
}
_omb_prompt_print_ruby_env () 
{ 
    local ruby_env;
    _omb_prompt_get_ruby_env "$@" && printf '%s\n' "${ruby_env}"
}
_omb_prompt_print_rvm () 
{ 
    local rvm;
    _omb_prompt_get_rvm "$@" && printf '%s\n' "${rvm}"
}
_omb_prompt_print_virtualenv () 
{ 
    local virtualenv;
    _omb_prompt_get_virtualenv "$@" && printf '%s\n' "${virtualenv}"
}
_omb_spectrum__deprecate () 
{ 
    local key;
    for key in "${!_omb_spectrum_fx[@]}";
    do
        FX[$key]=${_omb_spectrum_fx[$key]};
    done;
    for key in "${!_omb_spectrum_fg[@]}";
    do
        FG[$key]=${_omb_spectrum_fg[$key]};
    done;
    for key in "${!_omb_spectrum_bg[@]}";
    do
        BG[$key]=${_omb_spectrum_bg[$key]};
    done
}
_omb_spectrum__initialize () 
{ 
    _omb_spectrum_fx=([reset]='[00m' [bold]='[01m' [no-bold]='[22m' [italic]='[03m' [no-italic]='[23m' [underline]='[04m' [no-underline]='[24m' [blink]='[05m' [no-blink]='[25m' [reverse]='[07m' [no-reverse]='[27m');
    local color;
    for color in {000..255};
    do
        _omb_spectrum_fg[$color]='[38;5;'${color}'m';
        _omb_spectrum_bg[$color]='[48;5;'${color}'m';
    done
}
_omb_term_color_initialize () 
{ 
    local name;
    local -a normal_colors=(black brown green olive navy purple teal silver);
    local -a bright_colors=(gray red lime yellow blue magenta cyan white);
    if [[ ! -t 1 ]]; then
        _omb_term_colors=;
        _omb_term_bold=;
        _omb_term_underline=;
        _omb_term_reset=;
        _omb_term_normal=;
        _omb_term_reset_color=;
        for name in "${normal_colors[@]}" "${bright_colors[@]}" violet;
        do
            printf -v "_omb_term_$name" '';
            printf -v "_omb_term_background_$name" '';
            printf -v "_omb_term_bold_$name" '';
            printf -v "_omb_term_underline_$name" '';
        done;
        return 0;
    fi;
    if _omb_util_binary_exists tput; then
        _omb_term_colors=$(tput colors 2>/dev/null || tput Co 2>/dev/null);
        _omb_term_bold=$(tput bold 2>/dev/null || tput md 2>/dev/null);
        _omb_term_underline=$(tput smul 2>/dev/null || tput ul 2>/dev/null);
        _omb_term_reset=$(tput sgr0 2>/dev/null || tput me 2>/dev/null);
    else
        _omb_term_colors=;
        _omb_term_bold='[1m';
        _omb_term_underline='[4m';
        _omb_term_reset='[0m';
    fi;
    _omb_term_normal='[0m';
    _omb_term_reset_color='[39m';
    if ((_omb_term_colors >= 8)); then
        local index;
        for ((index = 0; index < 8; index++))
        do
            local fg=$(tput setaf "$index" 2>/dev/null || tput AF "$index" 2>/dev/null);
            [[ -n $fg ]] || fg='[3'$index'm';
            printf -v "_omb_term_${normal_colors[index]}" %s "$fg";
            printf -v "_omb_term_background_${normal_colors[index]}" '\e[4%sm' "$index";
        done;
    else
        local index;
        for ((index = 0; index < 8; index++))
        do
            printf -v "_omb_term_${normal_colors[index]}" '\e[3%sm' "$index";
            printf -v "_omb_term_background_${normal_colors[index]}" '\e[4%sm' "$index";
        done;
    fi;
    if ((_omb_term_colors >= 16)); then
        local index;
        for ((index = 0; index < 8; index++))
        do
            local fg=$(tput setaf $((index+8)) 2>/dev/null || tput AF $((index+8)) 2>/dev/null);
            [[ -n $fg ]] || fg='[9'$index'm';
            local refbg=_omb_term_background_${normal_colors[index]};
            local bg=${!refbg}'[10'$index'm';
            printf -v "_omb_term_${bright_colors[index]}" %s "$fg";
            printf -v "_omb_term_background_${bright_colors[index]}" %s "$bg";
        done;
    else
        local index;
        for ((index = 0; index < 8; index++))
        do
            local reffg=_omb_term_${normal_colors[index]};
            local refbg=_omb_term_background_${normal_colors[index]};
            printf -v "_omb_term_${bright_colors[index]}" %s "$_omb_term_bold${!reffg}";
            printf -v "_omb_term_background_${bright_colors[index]}" %s "$_omb_term_bold${!refbg}";
        done;
    fi;
    if ((_omb_term_colors == 256)); then
        _omb_term_violet='[38;5;171m';
        _omb_term_background_violet='[48;5;171m';
    else
        _omb_term_violet=$_omb_term_purple;
        _omb_term_background_violet=$_omb_term_background_purple;
    fi;
    for name in "${normal_colors[@]}" "${bright_colors[@]}" violet;
    do
        local ref=_omb_term_$name;
        printf -v "_omb_term_bold_$name" %s "$_omb_term_bold${!ref}";
        printf -v "_omb_term_underline_$name" %s "$_omb_term_underline${!ref}";
    done
}
_omb_theme_PROMPT_COMMAND () 
{ 
    my_ps_host="${_omb_prompt_green}\h${_omb_prompt_normal}";
    my_ps_host_root="${_omb_prompt_green}\h${_omb_prompt_normal}";
    my_ps_user="${_omb_prompt_bold_green}\u${_omb_prompt_normal}";
    my_ps_root="${_omb_prompt_bold_brown}\u${_omb_prompt_normal}";
    if [ -n "$VIRTUAL_ENV" ]; then
        ve=`basename $VIRTUAL_ENV`;
    fi;
    case "`id -u`" in 
        0)
            PS1="${TITLEBAR}┌─$(my_ve)$(chroot)[$my_ps_root][$my_ps_host_root]$(modern_scm_prompt)$(__my_rvm_ruby_version)[${_omb_prompt_teal}\w${_omb_prompt_normal}]$(is_vim_shell)
└─▪ "
        ;;
        *)
            PS1="${TITLEBAR}┌─$(my_ve)$(chroot)[$my_ps_user][$my_ps_host]$(modern_scm_prompt)$(__my_rvm_ruby_version)[${_omb_prompt_teal}\w${_omb_prompt_normal}]$(is_vim_shell)
└─▪ "
        ;;
    esac
}
_omb_theme__construct_sgr () 
{ 
    out=;
    local reset=;
    while (($#)); do
        local next=$1;
        shift;
        case $next in 
            reset)
                reset=0
            ;;
            bold)
                out=${out:+$out;}1
            ;;
            faint)
                out=${out:+$out;}2
            ;;
            italic)
                out=${out:+$out;}3
            ;;
            underline)
                out=${out:+$out;}4
            ;;
            negative)
                out=${out:+$out;}7
            ;;
            crossed)
                out=${out:+$out;}8
            ;;
            color)
                local color=$1;
                shift;
                local side=fg mode=normal;
                case $1 in 
                    fg | bg)
                        side=$1;
                        shift
                    ;;
                esac;
                case $1 in 
                    normal | bright)
                        mode=$1;
                        shift
                    ;;
                esac;
                local prefix=3;
                case $side:$mode in 
                    fg:normal)
                        prefix=3
                    ;;
                    bg:normal)
                        prefix=4
                    ;;
                    fg:bright)
                        prefix=9
                    ;;
                    bg:bright)
                        prefix=10
                    ;;
                esac;
                case $color in 
                    black)
                        color=0
                    ;;
                    red)
                        color=1
                    ;;
                    green)
                        color=2
                    ;;
                    yellow)
                        color=3
                    ;;
                    blue)
                        color=4
                    ;;
                    magenta)
                        color=5
                    ;;
                    cyan)
                        color=6
                    ;;
                    white)
                        color=7
                    ;;
                    rgb)
                        local r=$1 g=$2 b=$3;
                        shift 3;
                        if ((r == g && g == b)); then
                            color=$((232 + r / 11));
                        else
                            color="8;5;$(((r * 36  + b * 6 + g) / 51 + 16))";
                        fi
                    ;;
                    *)
                        printf '%s\n' "_omb_theme_color: unknown color '$color'" 1>&2;
                        continue
                    ;;
                esac;
                out=${out:+$out;}$prefix$color
            ;;
            '')
                out="${out:+$out;}$*"
            ;;
            *)
                printf '%s\n' "_omb_theme_color: unknown token '$next'" 1>&2
            ;;
        esac;
    done;
    if [[ -n $reset ]]; then
        out=$reset${out:+;$out};
    fi
}
_omb_theme_color_echo () 
{ 
    local out;
    _omb_theme__construct_sgr "$@";
    echo "\033[${out}m"
}
_omb_theme_color_prompt () 
{ 
    local out;
    _omb_theme__construct_sgr "$@";
    echo "\[\e[${out}m\]"
}
_omb_upgrade_check () 
{ 
    if [[ ! -f ~/.osh-update ]]; then
        _omb_upgrade_update_timestamp;
        return 0;
    fi;
    local LAST_EPOCH;
    . ~/.osh-update;
    if [[ ! -n $LAST_EPOCH ]]; then
        _omb_upgrade_update_timestamp;
        return 0;
    fi;
    local epoch_expires=${UPDATE_OSH_DAYS:-13};
    local epoch_elapsed=$(($(_omb_upgrade_current_epoch) - LAST_EPOCH));
    if ((epoch_elapsed <= epoch_expires)); then
        return 0;
    fi;
    _omb_upgrade_update_timestamp;
    if [[ $DISABLE_UPDATE_PROMPT == true ]] || { 
        read -rp '[Oh My Bash] Would you like to check for updates? [Y/n]: ' line && [[ $line == Y* || $line == y* || ! -n $line ]]
    }; then
        source "$OSH"/tools/upgrade.sh;
    fi
}
_omb_upgrade_current_epoch () 
{ 
    local sec=${EPOCHSECONDS-};
    [[ -n $sec ]] || printf -v sec '%(%s)T' -1 2> /dev/null || sec=$(command date +%s);
    echo $((sec / 60 / 60 / 24))
}
_omb_upgrade_update_timestamp () 
{ 
    echo "LAST_EPOCH=$(_omb_upgrade_current_epoch)" >| ~/.osh-update
}
_omb_util_add_prompt_command () 
{ 
    local other;
    for other in "${_omb_util_prompt_command[@]}";
    do
        [[ $1 == "$other" ]] && return 0;
    done;
    _omb_util_prompt_command+=("$1");
    if [[ ! -n $_omb_util_prompt_command_setup ]]; then
        _omb_util_prompt_command_setup=1;
        local hook=_omb_util_prompt_command_hook;
        if _omb_util_function_exists append_prompt_command_override; then
            append_prompt_command_override "$hook";
            return;
        fi;
        local prompt_re;
        if [[ $OSTYPE == darwin* ]]; then
            prompt_re='[[:<:]]'$hook'[[:>:]]';
        else
            prompt_re='\<'$hook'\>';
        fi;
        [[ $PROMPT_COMMAND =~ $prompt_re ]] && return 0;
        if ((_omb_bash_version >= 50100)); then
            local other;
            for other in "${PROMPT_COMMAND[@]}";
            do
                [[ $hook == "$other" ]] && return 0;
            done;
            PROMPT_COMMAND+=("$hook");
        else
            PROMPT_COMMAND="$hook${PROMPT_COMMAND:+;$PROMPT_COMMAND}";
        fi;
    fi
}
_omb_util_alias () 
{ 
    case ${OMB_DEFAULT_ALIASES:-enable} in 
        disable)
            return 0
        ;;
        check)
            alias -- "${1%%=*}" &> /dev/null && return 0
        ;;
        enable)

        ;;
        *)
            _omb_log_error "invalid value: OMB_DEFAULT_ALIASES='${OMB_DEFAULT_ALIASES-}' (expect: enable|disable|check)" 1>&2;
            return 2
        ;;
    esac;
    alias -- "$1"
}
_omb_util_alias_delayed () 
{ 
    local name=$1 opts=${2-};
    local func=_omb_util_alias_init_$name;
    eval -- "function $func { _omb_util_alias_delayed__init $name \"\$@\"; }";
    if [[ :$opts: == *:force:* ]]; then
        alias "$name=$func";
    else
        _omb_util_alias "$name=$func";
    fi
}
_omb_util_alias_delayed__init () 
{ 
    local _omb_name=$1 _omb_init=${FUNCNAME[1]};
    local _omb_command=$_omb_name;
    "_omb_util_alias_select_$_omb_name";
    if [[ ! -n $_omb_command || $_omb_command == "$_omb_name" ]]; then
        unalias "$_omb_name";
    else
        alias "$_omb_name=$_omb_command";
    fi || return 1;
    eval -- "function $_omb_init { command ${_omb_command:-$_omb_name} \"\$@\"; }" && "$_omb_init" "${@:2}"
}
_omb_util_alias_init_cp () 
{ 
    command cp -iv "$@"
}
_omb_util_alias_init_ls () 
{ 
    _omb_util_alias_delayed__init ls "$@"
}
_omb_util_alias_init_mkdir () 
{ 
    command mkdir -pv "$@"
}
_omb_util_alias_init_mv () 
{ 
    _omb_util_alias_delayed__init mv "$@"
}
_omb_util_alias_init_nano () 
{ 
    command nano -W "$@"
}
_omb_util_alias_select_cp () 
{ 
    if ( tmp=$(_omb_util_mktemp);
    trap 'rm -f "$tmp"{,.2}' EXIT;
    command cp -v "$tmp" "$tmp.2" &> /dev/null ); then
        _omb_command='cp -iv';
    else
        _omb_command='cp -i';
    fi
}
_omb_util_alias_select_ls () 
{ 
    if command ls --color=auto ~ &> /dev/null; then
        _omb_command='ls --color=auto';
    else
        if command ls -G ~ &> /dev/null; then
            _omb_command='ls -G';
        fi;
    fi
}
_omb_util_alias_select_mkdir () 
{ 
    if command mkdir -pv . &> /dev/null; then
        _omb_command='mkdir -pv';
    else
        _omb_command='mkdir -p';
    fi
}
_omb_util_alias_select_mv () 
{ 
    if ( tmp=$(_omb_util_mktemp);
    trap 'rm -f "$tmp.2"' EXIT;
    command mv -v "$tmp" "$tmp.2" &> /dev/null ); then
        _omb_command='mv -iv';
    else
        _omb_command='mv -i';
    fi
}
_omb_util_alias_select_nano () 
{ 
    if LANG=C command nano --help 2> /dev/null | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} -q '^[[:space:]]*[-]W'; then
        _omb_command='nano -W';
    else
        _omb_command='nano';
    fi
}
_omb_util_binary_exists () 
{ 
    type -P -- "$@" &> /dev/null
}
_omb_util_command_exists () 
{ 
    type -t -- "$@" &> /dev/null
}
_omb_util_defun_print () 
{ 
    builtin eval -- "function $1 { local $3; $2 \"\$@\" && printf '%s\n' \"\${$3}\"; }"
}
_omb_util_function_exists () 
{ 
    declare -F "$@" &> /dev/null
}
_omb_util_get_shopt () 
{ 
    __shopt=$BASHOPTS
}
_omb_util_glob_expand () 
{ 
    local __set=$- __shopt __gignore=$GLOBIGNORE;
    _omb_util_get_shopt failglob nullglob extglob;
    shopt -u failglob;
    shopt -s nullglob;
    shopt -s extglob;
    set +f;
    GLOBIGNORE=;
    eval -- "$1=($2)";
    GLOBIGNORE=$__gignore;
    if [[ :$__shopt: == *:dotglob:* ]]; then
        shopt -s dotglob;
    else
        shopt -u dotglob;
    fi;
    [[ $__set == *f* ]] && set -f;
    [[ :$__shopt: != *:extglob:* ]] && shopt -u extglob;
    [[ :$__shopt: != *:nullglob:* ]] && shopt -u nullglob;
    [[ :$__shopt: == *:failglob:* ]] && shopt -s failglob;
    return 0
}
_omb_util_mktemp () 
{ 
    local template=tmp.oh-my-bash.XXXXXXXXXX;
    if _omb_util_command_exists mktemp; then
        mktemp -t "$template";
    else
        m4 -D template="${TMPDIR:-/tmp}/$template" <<< 'mkstemp(template)';
    fi
}
_omb_util_prompt_command_hook () 
{ 
    local status=$? lastarg=$_ hook;
    for hook in "${_omb_util_prompt_command[@]}";
    do
        _omb_util_setexit "$status" "$lastarg";
        eval -- "$hook";
    done;
    _omb_util_setexit "$status"
}
_omb_util_readlink () 
{ 
    if [[ -h $1 ]]; then
        _omb_util_readlink__resolve "$1";
    else
        echo "$1";
    fi
}
_omb_util_readlink__readlink () 
{ 
    local path=$1;
    if _omb_util_function_exists readlink; then
        link=$(readlink -- "$path");
        [[ -n $link ]];
    else
        if _omb_util_binary_exists ls; then
            link=$(ls -ld -- "$path") && [[ $link == *" $path -> "?* ]] && link=${link#*" $path -> "};
        else
            false;
        fi;
    fi
} 2> /dev/null
_omb_util_readlink__resolve () 
{ 
    _omb_util_readlink_type=;
    case $OSTYPE in 
        cygwin | msys | linux-gnu)
            local readlink;
            readlink=$(type -P readlink);
            case $readlink in 
                /bin/readlink | /usr/bin/readlink)
                    _omb_util_readlink_type=readlink-f;
                    function _omb_util_readlink__resolve () 
                    { 
                        readlink -f -- "$1"
                    }
                ;;
            esac
        ;;
    esac;
    if [[ ! -n $_omb_util_readlink_type ]]; then
        _omb_util_readlink_type=loop;
        function _omb_util_readlink__resolve () 
        { 
            _omb_util_readlink__resolve_loop "$1"
        };
    fi;
    _omb_util_readlink__resolve "$1"
}
_omb_util_readlink__resolve_loop () 
{ 
    local path=$1;
    builtin eval -- "$_omb_util_readlink_visited_init";
    while [[ -h $path ]]; do
        local link;
        _omb_util_readlink__visited "$path" && break;
        _omb_util_readlink__readlink "$path" || break;
        if [[ $link == /* || $path != */* ]]; then
            path=$link;
        else
            _omb_util_readlink__resolve_physical_directory;
            path=${path%/}/$link;
        fi;
        while [[ $path == ?*/ ]]; do
            path=${path%/};
        done;
    done;
    echo "$path"
}
_omb_util_readlink__resolve_physical_directory () 
{ 
    [[ $path == */?* ]] || return 0;
    local PWD=$PWD OLDPWD=$OLDPWD CDPATH=;
    builtin cd -L . && local pwd=$PWD && builtin cd -P "${path%/*}/" && path=${PWD%/}/${path##*/};
    builtin cd -L "$pwd";
    return 0
}
_omb_util_readlink__visited () 
{ 
    [[ -n ${visited[$1]+set} ]] && return 0;
    visited[$1]=1;
    return 1
}
_omb_util_setexit () 
{ 
    return "$1"
}
_omb_util_split () 
{ 
    local __set=$- IFS=${3:-' 	
'};
    set -f;
    eval -- "$1=(\$2)";
    [[ $__set == *f* ]] || set +f;
    return 0
}
_omb_util_unload () 
{ 
    local hook;
    for hook in "${_omb_util_unload_hook[@]}";
    do
        eval -- "$hook";
    done
}
_parse_help () 
{ 
    eval local cmd="$(quote "$1")";
    local line;
    { 
        case $cmd in 
            -)
                cat
            ;;
            *)
                LC_ALL=C "$(dequote "$cmd")" ${2:---help} 2>&1
            ;;
        esac
    } | while read -r line; do
        [[ $line == *([[:blank:]])-* ]] || continue;
        while [[ $line =~ ((^|[^-])-[A-Za-z0-9?][[:space:]]+)\[?[A-Z0-9]+([,_-]+[A-Z0-9]+)?(\.\.+)?\]? ]]; do
            line=${line/"${BASH_REMATCH[0]}"/"${BASH_REMATCH[1]}"};
        done;
        __parse_options "${line// or /, }";
    done
}
_parse_usage () 
{ 
    eval local cmd="$(quote "$1")";
    local line match option i char;
    { 
        case $cmd in 
            -)
                cat
            ;;
            *)
                LC_ALL=C "$(dequote "$cmd")" ${2:---usage} 2>&1
            ;;
        esac
    } | while read -r line; do
        while [[ $line =~ \[[[:space:]]*(-[^]]+)[[:space:]]*\] ]]; do
            match=${BASH_REMATCH[0]};
            option=${BASH_REMATCH[1]};
            case $option in 
                -?(\[)+([a-zA-Z0-9?]))
                    for ((i = 1; i < ${#option}; i++))
                    do
                        char=${option:i:1};
                        [[ $char != '[' ]] && printf '%s\n' -$char;
                    done
                ;;
                *)
                    __parse_options "$option"
                ;;
            esac;
            line=${line#*"$match"};
        done;
    done
}
_pci_ids () 
{ 
    COMPREPLY+=($(compgen -W         "$(PATH="$PATH:/sbin" lspci -n | awk '{print $3}')" -- "$cur"))
}
_pgids () 
{ 
    COMPREPLY=($(compgen -W '$(command ps axo pgid=)' -- "$cur"))
}
_pids () 
{ 
    COMPREPLY=($(compgen -W '$(command ps axo pid=)' -- "$cur"))
}
_pnames () 
{ 
    local -a procs;
    if [[ ${1-} == -s ]]; then
        procs=($(command ps axo comm | command sed -e 1d));
    else
        local line i=-1 ifs=$IFS;
        IFS='
';
        local -a psout=($(command ps axo command=));
        IFS=$ifs;
        for line in "${psout[@]}";
        do
            if ((i == -1)); then
                if [[ $line =~ ^(.*[[:space:]])COMMAND([[:space:]]|$) ]]; then
                    i=${#BASH_REMATCH[1]};
                else
                    break;
                fi;
            else
                line=${line:i};
                line=${line%% *};
                procs+=($line);
            fi;
        done;
        if ((i == -1)); then
            for line in "${psout[@]}";
            do
                if [[ $line =~ ^[[(](.+)[])]$ ]]; then
                    procs+=(${BASH_REMATCH[1]});
                else
                    line=${line%% *};
                    line=${line##@(*/|-)};
                    procs+=($line);
                fi;
            done;
        fi;
    fi;
    COMPREPLY=($(compgen -X "<defunct>" -W '${procs[@]}' -- "$cur"))
}
_print_bookmark () 
{ 
    _bashmarks_print "$@"
}
_purge_line () 
{ 
    _bashmarks_purge_line "$@"
}
_quote_readline_by_ref () 
{ 
    if [ -z "$1" ]; then
        printf -v $2 %s "$1";
    else
        if [[ $1 == \'* ]]; then
            printf -v $2 %s "${1:1}";
        else
            if [[ $1 == \~* ]]; then
                printf -v $2 \~%q "${1:1}";
            else
                printf -v $2 %q "$1";
            fi;
        fi;
    fi;
    [[ ${!2} == \$* ]] && eval $2=${!2}
}
_realcommand () 
{ 
    type -P "$1" > /dev/null && { 
        if type -p realpath > /dev/null; then
            realpath "$(type -P "$1")";
        else
            if type -p greadlink > /dev/null; then
                greadlink -f "$(type -P "$1")";
            else
                if type -p readlink > /dev/null; then
                    readlink -f "$(type -P "$1")";
                else
                    type -P "$1";
                fi;
            fi;
        fi
    }
}
_rl_enabled () 
{ 
    [[ "$(bind -v)" == *$1+([[:space:]])on* ]]
}
_root_command () 
{ 
    local PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin;
    local root_command=$1;
    _command
}
_save_bookmark () 
{ 
    _bashmarks_save "$@"
}
_service () 
{ 
    local cur prev words cword;
    _init_completion || return;
    ((cword > 2)) && return;
    if [[ $cword -eq 1 && $prev == ?(*/)service ]]; then
        _services;
        [[ -e /etc/mandrake-release ]] && _xinetd_services;
    else
        local sysvdirs;
        _sysvdirs;
        COMPREPLY=($(compgen -W '`command sed -e "y/|/ /" \
            -ne "s/^.*\(U\|msg_u\)sage.*{\(.*\)}.*$/\2/p" \
            ${sysvdirs[0]}/${prev##*/} 2>/dev/null` start stop' -- "$cur"));
    fi
}
_services () 
{ 
    local sysvdirs;
    _sysvdirs;
    local IFS=' 	
' reset=$(shopt -p nullglob);
    shopt -s nullglob;
    COMPREPLY=($(printf '%s\n' ${sysvdirs[0]}/!($_backup_glob|functions|README)));
    $reset;
    COMPREPLY+=($({
        systemctl list-units --full --all ||
            systemctl list-unit-files
    } 2>/dev/null |
        awk '$1 ~ /\.service$/ { sub("\\.service$", "", $1); print $1 }'));
    if [[ -x /sbin/upstart-udev-bridge ]]; then
        COMPREPLY+=($(initctl list 2>/dev/null | cut -d' ' -f1));
    fi;
    COMPREPLY=($(compgen -W '${COMPREPLY[@]#${sysvdirs[0]}/}' -- "$cur"))
}
_shells () 
{ 
    local shell rest;
    while read -r shell rest; do
        [[ $shell == /* && $shell == "$cur"* ]] && COMPREPLY+=($shell);
    done 2> /dev/null < /etc/shells
}
_signals () 
{ 
    local -a sigs=($(compgen -P "${1-}" -A signal "SIG${cur#${1-}}"));
    COMPREPLY+=("${sigs[@]/#${1-}SIG/${1-}}")
}
_split_longopt () 
{ 
    if [[ $cur == --?*=* ]]; then
        prev="${cur%%?(\\)=*}";
        cur="${cur#*=}";
        return 0;
    fi;
    return 1
}
_starship_set_return () 
{ 
    return "${1:-0}"
}
_sudo () 
{ 
    local cur prev words cword split;
    _init_completion -s || return;
    local i mode=normal;
    [[ $1 == *sudoedit ]] && mode=edit;
    [[ $mode == normal ]] && for ((i = 1; i <= cword; i++))
    do
        if [[ ${words[i]} != -* ]]; then
            local PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin;
            local root_command=${words[i]};
            _command_offset $i;
            return;
        fi;
        if [[ ${words[i]} == -@(!(-*)e*|-edit) ]]; then
            mode=edit;
            break;
        fi;
        [[ ${words[i]} == -@(user|other-user|group|close-from|prompt|!(-*)[uUgCp]) ]] && ((i++));
    done;
    case "$prev" in 
        --user | --other-user | -!(-*)[uU])
            COMPREPLY=($(compgen -u -- "$cur"));
            return
        ;;
        --group | -!(-*)g)
            COMPREPLY=($(compgen -g -- "$cur"));
            return
        ;;
        --close-from | --prompt | -!(-*)[Cp])
            return
        ;;
    esac;
    $split && return;
    if [[ $cur == -* ]]; then
        local opts=$(_parse_help "$1");
        COMPREPLY=($(compgen -W '${opts:-$(_parse_usage "$1")}' -- "$cur"));
        [[ ${COMPREPLY-} == *= ]] && compopt -o nospace;
        return;
    fi;
    if [[ $mode == edit ]]; then
        _filedir;
    fi
}
_sysvdirs () 
{ 
    sysvdirs=();
    [[ -d /etc/rc.d/init.d ]] && sysvdirs+=(/etc/rc.d/init.d);
    [[ -d /etc/init.d ]] && sysvdirs+=(/etc/init.d);
    [[ -f /etc/slackware-version ]] && sysvdirs=(/etc/rc.d);
    return 0
}
_terms () 
{ 
    COMPREPLY+=($(compgen -W "$({
        command sed -ne 's/^\([^[:space:]#|]\{2,\}\)|.*/\1/p' /etc/termcap
        {
            toe -a || toe
        } | awk '{ print $1 }'
        find /{etc,lib,usr/lib,usr/share}/terminfo/? -type f -maxdepth 1 |
            awk -F/ '{ print $NF }'
    } 2>/dev/null)" -- "$cur"))
}
_tilde () 
{ 
    local result=0;
    if [[ ${1-} == \~* && $1 != */* ]]; then
        COMPREPLY=($(compgen -P '~' -u -- "${1#\~}"));
        result=${#COMPREPLY[@]};
        ((result > 0)) && compopt -o filenames 2> /dev/null;
    fi;
    return $result
}
_uids () 
{ 
    if type getent &> /dev/null; then
        COMPREPLY=($(compgen -W '$(getent passwd | cut -d: -f3)' -- "$cur"));
    else
        if type perl &> /dev/null; then
            COMPREPLY=($(compgen -W '$(perl -e '"'"'while (($uid) = (getpwent)[2]) { print $uid . "\n" }'"'"')' -- "$cur"));
        else
            COMPREPLY=($(compgen -W '$(cut -d: -f3 /etc/passwd)' -- "$cur"));
        fi;
    fi
}
_upvar () 
{ 
    echo "bash_completion: $FUNCNAME: deprecated function," "use _upvars instead" 1>&2;
    if unset -v "$1"; then
        if (($# == 2)); then
            eval $1=\"\$2\";
        else
            eval $1=\(\"\$"{@:2}"\"\);
        fi;
    fi
}
_upvars () 
{ 
    if ! (($#)); then
        echo "bash_completion: $FUNCNAME: usage: $FUNCNAME" "[-v varname value] | [-aN varname [value ...]] ..." 1>&2;
        return 2;
    fi;
    while (($#)); do
        case $1 in 
            -a*)
                [[ -n ${1#-a} ]] || { 
                    echo "bash_completion: $FUNCNAME:" "\`$1': missing number specifier" 1>&2;
                    return 1
                };
                printf %d "${1#-a}" &> /dev/null || { 
                    echo bash_completion: "$FUNCNAME: \`$1': invalid number specifier" 1>&2;
                    return 1
                };
                [[ -n "$2" ]] && unset -v "$2" && eval $2=\(\"\$"{@:3:${1#-a}}"\"\) && shift $((${1#-a} + 2)) || { 
                    echo bash_completion: "$FUNCNAME: \`$1${2+ }$2': missing argument(s)" 1>&2;
                    return 1
                }
            ;;
            -v)
                [[ -n "$2" ]] && unset -v "$2" && eval $2=\"\$3\" && shift 3 || { 
                    echo "bash_completion: $FUNCNAME: $1:" "missing argument(s)" 1>&2;
                    return 1
                }
            ;;
            *)
                echo "bash_completion: $FUNCNAME: $1: invalid option" 1>&2;
                return 1
            ;;
        esac;
    done
}
_usb_ids () 
{ 
    COMPREPLY+=($(compgen -W         "$(PATH="$PATH:/sbin" lsusb | awk '{print $6}')" -- "$cur"))
}
_user_at_host () 
{ 
    local cur prev words cword;
    _init_completion -n : || return;
    if [[ $cur == *@* ]]; then
        _known_hosts_real "$cur";
    else
        COMPREPLY=($(compgen -u -S @ -- "$cur"));
        compopt -o nospace;
    fi
}
_usergroup () 
{ 
    if [[ $cur == *\\\\* || $cur == *:*:* ]]; then
        return;
    else
        if [[ $cur == *\\:* ]]; then
            local prefix;
            prefix=${cur%%*([^:])};
            prefix=${prefix//\\/};
            local mycur="${cur#*[:]}";
            if [[ ${1-} == -u ]]; then
                _allowed_groups "$mycur";
            else
                local IFS='
';
                COMPREPLY=($(compgen -g -- "$mycur"));
            fi;
            COMPREPLY=($(compgen -P "$prefix" -W "${COMPREPLY[@]}"));
        else
            if [[ $cur == *:* ]]; then
                local mycur="${cur#*:}";
                if [[ ${1-} == -u ]]; then
                    _allowed_groups "$mycur";
                else
                    local IFS='
';
                    COMPREPLY=($(compgen -g -- "$mycur"));
                fi;
            else
                if [[ ${1-} == -u ]]; then
                    _allowed_users "$cur";
                else
                    local IFS='
';
                    COMPREPLY=($(compgen -u -- "$cur"));
                fi;
            fi;
        fi;
    fi
}
_userland () 
{ 
    local userland=$(uname -s);
    [[ $userland == @(Linux|GNU/*) ]] && userland=GNU;
    [[ $userland == "$1" ]]
}
_variable_assignments () 
{ 
    local cur=${1-};
    if [[ $cur =~ ^([A-Za-z_][A-Za-z0-9_]*)=(.*)$ ]]; then
        prev=${BASH_REMATCH[1]};
        cur=${BASH_REMATCH[2]};
    else
        return 1;
    fi;
    case $prev in 
        TZ)
            cur=/usr/share/zoneinfo/$cur;
            _filedir;
            for i in "${!COMPREPLY[@]}";
            do
                if [[ ${COMPREPLY[i]} == *.tab ]]; then
                    unset 'COMPREPLY[i]';
                    continue;
                else
                    if [[ -d ${COMPREPLY[i]} ]]; then
                        COMPREPLY[i]+=/;
                        compopt -o nospace;
                    fi;
                fi;
                COMPREPLY[i]=${COMPREPLY[i]#/usr/share/zoneinfo/};
            done
        ;;
        TERM)
            _terms
        ;;
        LANG | LC_*)
            COMPREPLY=($(compgen -W '$(locale -a 2>/dev/null)'                 -- "$cur"))
        ;;
        *)
            _variables && return 0;
            _filedir
        ;;
    esac;
    return 0
}
_variables () 
{ 
    if [[ $cur =~ ^(\$(\{[!#]?)?)([A-Za-z0-9_]*)$ ]]; then
        if [[ $cur == '${'* ]]; then
            local arrs vars;
            vars=($(compgen -A variable -P ${BASH_REMATCH[1]} -S '}' -- ${BASH_REMATCH[3]}));
            arrs=($(compgen -A arrayvar -P ${BASH_REMATCH[1]} -S '[' -- ${BASH_REMATCH[3]}));
            if ((${#vars[@]} == 1 && ${#arrs[@]} != 0)); then
                compopt -o nospace;
                COMPREPLY+=(${arrs[*]});
            else
                COMPREPLY+=(${vars[*]});
            fi;
        else
            COMPREPLY+=($(compgen -A variable -P '$' -- "${BASH_REMATCH[3]}"));
        fi;
        return 0;
    else
        if [[ $cur =~ ^(\$\{[#!]?)([A-Za-z0-9_]*)\[([^]]*)$ ]]; then
            local IFS='
';
            COMPREPLY+=($(compgen -W '$(printf %s\\n "${!'${BASH_REMATCH[2]}'[@]}")'             -P "${BASH_REMATCH[1]}${BASH_REMATCH[2]}[" -S ']}' -- "${BASH_REMATCH[3]}"));
            if [[ ${BASH_REMATCH[3]} == [@*] ]]; then
                COMPREPLY+=("${BASH_REMATCH[1]}${BASH_REMATCH[2]}[${BASH_REMATCH[3]}]}");
            fi;
            __ltrim_colon_completions "$cur";
            return 0;
        else
            if [[ $cur =~ ^\$\{[#!]?[A-Za-z0-9_]*\[.*\]$ ]]; then
                COMPREPLY+=("$cur}");
                __ltrim_colon_completions "$cur";
                return 0;
            fi;
        fi;
    fi;
    return 1
}
_xfunc () 
{ 
    set -- "$@";
    local srcfile=$1;
    shift;
    declare -F $1 &> /dev/null || __load_completion "$srcfile";
    "$@"
}
_xinetd_services () 
{ 
    local xinetddir=${BASHCOMP_XINETDDIR:-/etc/xinetd.d};
    if [[ -d $xinetddir ]]; then
        local IFS=' 	
' reset=$(shopt -p nullglob);
        shopt -s nullglob;
        local -a svcs=($(printf '%s\n' $xinetddir/!($_backup_glob)));
        $reset;
        ((!${#svcs[@]})) || COMPREPLY+=($(compgen -W '${svcs[@]#$xinetddir/}' -- "${cur-}"));
    fi
}
alias_value () 
{ 
    [[ -n ${BASH_ALIASES[$1]+set} ]] && echo "${BASH_ALIASES[$1]}"
}
aws_profile () 
{ 
    if [[ -n $AWS_DEFAULT_PROFILE ]]; then
        echo -e "${AWS_DEFAULT_PROFILE}";
    else
        echo -e "default";
    fi
}
banish-cookies () 
{ 
    rm -r ~/.macromedia ~/.adobe;
    ln -s /dev/null ~/.adobe;
    ln -s /dev/null ~/.macromedia
}
bash_stats () 
{ 
    fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n20
}
batch_chmod () 
{ 
    echo -ne "${_omb_term_bold_navy}Applying 0755 permission for all directories...";
    ( find . -type d -print0 | xargs -0 chmod 0755 ) & spinner;
    echo -ne "${_omb_term_normal}";
    echo -ne "${_omb_term_bold_navy}Applying 0644 permission for all files...";
    ( find . -type f -print0 | xargs -0 chmod 0644 ) & spinner;
    echo -ne "${_omb_term_normal}"
}
battery_char () 
{ 
    echo -n
}
battery_charge () 
{ 
    echo -n
}
bigfind () 
{ 
    if [[ $# -lt 1 ]]; then
        echo_warn "Usage: bigfind DIRECTORY";
        return;
    fi;
    du -a "$1" | sort -n -r | head -n 10
}
bm () 
{ 
    local option=$1;
    case $option in 
        -a)
            _bashmarks_save "$2"
        ;;
        -d)
            _bashmarks_delete "$2"
        ;;
        -g)
            _bashmarks_goto "$2"
        ;;
        -p)
            _bashmarks_print "$2"
        ;;
        -l)
            _bashmarks_list
        ;;
        -h)
            _bashmarks_usage
        ;;
        *)
            if [[ $1 == -* ]]; then
                echo "Unknown option '$1'";
                _bashmarks_usage;
                kill -SIGINT $$;
                exit 1;
            else
                if [[ $1 == "" ]]; then
                    _bashmarks_usage;
                else
                    _bashmarks_goto "$1";
                fi;
            fi
        ;;
    esac
}
buf () 
{ 
    local filename filetime;
    filename=$1;
    filetime=$(date +%Y%m%d_%H%M%S);
    cp -a "${filename}" "${filename}_${filetime}"
}
chroot () 
{ 
    if [ -n "$debian_chroot" ]; then
        my_ps_chroot="${_omb_prompt_bold_teal}$debian_chroot${_omb_prompt_normal}";
        echo "($my_ps_chroot)";
    fi
}
chruby_version_prompt () 
{ 
    _omb_prompt_print_chruby "$@"
}
clock_char () 
{ 
    CLOCK_CHAR=${THEME_CLOCK_CHAR:-"⌚"};
    CLOCK_CHAR_COLOR=${THEME_CLOCK_CHAR_COLOR:-"$_omb_prompt_normal"};
    SHOW_CLOCK_CHAR=${THEME_SHOW_CLOCK_CHAR:-"true"};
    if [[ "${SHOW_CLOCK_CHAR}" = "true" ]]; then
        echo -e "${CLOCK_CHAR_COLOR}${CLOCK_CHAR_THEME_PROMPT_PREFIX}${CLOCK_CHAR}${CLOCK_CHAR_THEME_PROMPT_SUFFIX}";
    fi
}
clock_prompt () 
{ 
    CLOCK_COLOR=${THEME_CLOCK_COLOR:-"$_omb_prompt_normal"};
    CLOCK_FORMAT=${THEME_CLOCK_FORMAT:-"%H:%M:%S"};
    [ -z $THEME_SHOW_CLOCK ] && THEME_SHOW_CLOCK=${THEME_CLOCK_CHECK:-"true"};
    SHOW_CLOCK=$THEME_SHOW_CLOCK;
    if [[ "${SHOW_CLOCK}" = "true" ]]; then
        CLOCK_STRING=$(date +"${CLOCK_FORMAT}");
        echo -e "${CLOCK_COLOR}${CLOCK_THEME_PROMPT_PREFIX}${CLOCK_STRING}${CLOCK_THEME_PROMPT_SUFFIX}";
    fi
}
color () 
{ 
    _omb_theme_color_prompt "$@"
}
command_not_found_handle () 
{ 
    if [ -x /usr/lib/command-not-found ]; then
        /usr/lib/command-not-found -- "$1";
        return $?;
    else
        if [ -x /usr/share/command-not-found/command-not-found ]; then
            /usr/share/command-not-found/command-not-found -- "$1";
            return $?;
        else
            printf "%s: command not found\n" "$1" 1>&2;
            return 127;
        fi;
    fi
}
condaenv_prompt () 
{ 
    _omb_prompt_print_condaenv "$@"
}
current_branch () 
{ 
    git_current_branch
}
current_repository () 
{ 
    if ! $_omb_git_git_cmd rev-parse --is-inside-work-tree &> /dev/null; then
        return;
    fi;
    echo $($_omb_git_git_cmd remote -v | cut -d':' -f 2)
}
default () 
{ 
    typeset -p "$1" &> /dev/null && return 0;
    typeset -g "$1"="$2" && return 3
}
del () 
{ 
    mkdir -p /tmp/.trash && mv "$@" /tmp/.trash
}
dequote () 
{ 
    eval printf %s "$1" 2> /dev/null
}
down4me () 
{ 
    curl -s "http://www.downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g'
}
dulcie_setter () 
{ 
    _omb_theme_PROMPT_COMMAND "$@"
}
e_arrow () 
{ 
    _omb_log_arrow "$@"
}
e_bold () 
{ 
    _omb_log_bold "$@"
}
e_error () 
{ 
    _omb_log_error "$@"
}
e_header () 
{ 
    _omb_log_header "$@"
}
e_note () 
{ 
    _omb_log_note "$@"
}
e_success () 
{ 
    _omb_log_success "$@"
}
e_underline () 
{ 
    _omb_log_underline "$@"
}
e_warning () 
{ 
    _omb_log_warning "$@"
}
echo_color () 
{ 
    _omb_theme_color_echo "$@"
}
env_default () 
{ 
    env | grep -q "^$1=" && return 0;
    export "$1=$2" && return 3
}
extract () 
{ 
    if [ -f "$1" ]; then
        case "$1" in 
            *.tar.bz2)
                tar xjf "$1"
            ;;
            *.tar.gz)
                tar xzf "$1"
            ;;
            *.bz2)
                bunzip2 "$1"
            ;;
            *.rar)
                unrar e "$1"
            ;;
            *.gz)
                gunzip "$1"
            ;;
            *.tar)
                tar xf "$1"
            ;;
            *.tbz2)
                tar xjf "$1"
            ;;
            *.tgz)
                tar xzf "$1"
            ;;
            *.zip)
                unzip "$1"
            ;;
            *.Z)
                uncompress "$1"
            ;;
            *.7z)
                7z x "$1"
            ;;
            *)
                echo "'$1' cannot be extracted via extract()"
            ;;
        esac;
    else
        echo "'$1' is not a valid file";
    fi
}
ff () 
{ 
    /usr/bin/find . -name "$@"
}
ffe () 
{ 
    /usr/bin/find . -name '*'"$@"
}
ffs () 
{ 
    /usr/bin/find . -name "$@"'*'
}
findPid () 
{ 
    lsof -t -c "$@"
}
fn_exists () 
{ 
    _omb_util_function_exists "$@"
}
gccd () 
{ 
    command git clone --recurse-submodules "$@";
    local lastarg=$_;
    [[ -d $lastarg ]] && _omb_directories_cd "$lastarg" && return;
    lastarg=${lastarg##*/};
    _omb_directories_cd "${lastarg%.git}"
}
gdnolock () 
{ 
    command git diff "$@" ":(exclude)package-lock.json" ":(exclude)*.lock"
}
gdv () 
{ 
    command git diff -w "$@" | view -
}
get_hg_root () 
{ 
    local CURRENT_DIR=$PWD;
    while [ "$CURRENT_DIR" != "/" ]; do
        if [ -d "$CURRENT_DIR/.hg" ]; then
            echo "$CURRENT_DIR/.hg";
            return;
        fi;
        CURRENT_DIR=$(dirname "$CURRENT_DIR");
    done
}
ggf () 
{ 
    (($# != 1)) && local b=$(git_current_branch);
    command git push --force origin "${b:=$1}"
}
ggfl () 
{ 
    (($# != 1)) && local b=$(git_current_branch);
    command git push --force-with-lease origin "${b:=$1}"
}
ggl () 
{ 
    if (($# != 0 && $# != 1)); then
        command git pull origin "$*";
    else
        local b=;
        (($# == 0)) && b=$(git_current_branch);
        command git pull origin "${b:-$1}";
    fi
}
ggp () 
{ 
    if (($# != 0 && $# != 1)); then
        command git push origin "$*";
    else
        (($# == 0)) && local b=$(git_current_branch);
        command git push origin "${b:=$1}";
    fi
}
ggpnp () 
{ 
    if (($# == 0)); then
        ggl && ggp;
    else
        ggl "$*" && ggp "$*";
    fi
}
ggu () 
{ 
    local b=;
    (($# != 1)) && b=$(git_current_branch);
    command git pull --rebase origin "${b:-$1}"
}
git_clean_branch () 
{ 
    local unsafe_ref=$(_omb_prompt_git symbolic-ref -q HEAD 2> /dev/null);
    local stripped_ref=${unsafe_ref##refs/heads/};
    local clean_ref=${stripped_ref//[\$\`\\]/-};
    clean_ref=${clean_ref//[^[:print:]]/-};
    echo $clean_ref
}
git_commits_ahead () 
{ 
    if _omb_prompt_git rev-parse --git-dir &> /dev/null; then
        local commits=$(_omb_prompt_git rev-list --count @{upstream}..HEAD);
        if ((commits != 0)); then
            echo "$OSH_THEME_GIT_COMMITS_AHEAD_PREFIX$commits$OSH_THEME_GIT_COMMITS_AHEAD_SUFFIX";
        fi;
    fi
}
git_commits_behind () 
{ 
    if _omb_prompt_git rev-parse --git-dir &> /dev/null; then
        local commits=$(_omb_prompt_git rev-list --count HEAD..@{upstream});
        if ((commits != 0)); then
            echo "$OSH_THEME_GIT_COMMITS_BEHIND_PREFIX$commits$OSH_THEME_GIT_COMMITS_BEHIND_SUFFIX";
        fi;
    fi
}
git_compare_version () 
{ 
    local INPUT_GIT_VERSION INSTALLED_GIT_VERSION;
    _omb_util_split INPUT_GIT_VERSION "$1" '.';
    _omb_util_split INSTALLED_GIT_VERSION "$(_omb_prompt_git --version 2>/dev/null)";
    _omb_util_split INSTALLED_GIT_VERSION "${INSTALLED_GIT_VERSION[2]}" '.';
    local i;
    for i in {0..2};
    do
        if ((INSTALLED_GIT_VERSION[i] > INPUT_GIT_VERSION[i])); then
            echo 1;
            return 0;
        fi;
        if ((INSTALLED_GIT_VERSION[i] < INPUT_GIT_VERSION[i])); then
            echo -1;
            return 0;
        fi;
    done;
    echo 0
}
git_current_branch () 
{ 
    local ref;
    ref=$(_omb_prompt_git symbolic-ref --quiet HEAD 2> /dev/null);
    local ret=$?;
    if [[ $ret != 0 ]]; then
        [[ $ret == 128 ]] && return;
        ref=$(_omb_prompt_git rev-parse --short HEAD 2> /dev/null) || return;
    fi;
    echo ${ref#refs/heads/}
}
git_current_user_email () 
{ 
    _omb_prompt_git config user.email 2> /dev/null
}
git_current_user_name () 
{ 
    _omb_prompt_git config user.name 2> /dev/null
}
git_develop_branch () 
{ 
    command git rev-parse --git-dir &> /dev/null || return;
    local branch;
    for branch in dev devel development;
    do
        if command git show-ref -q --verify refs/heads/"$branch"; then
            echo "$branch";
            return;
        fi;
    done;
    echo develop
}
git_main_branch () 
{ 
    command git rev-parse --git-dir &> /dev/null || return;
    local ref;
    for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default};
    do
        if command git show-ref -q --verify "$ref"; then
            echo "${ref##*/}";
            return;
        fi;
    done;
    echo master
}
git_prompt_ahead () 
{ 
    if [[ -n $(_omb_prompt_git rev-list origin/$(git_current_branch)..HEAD 2> /dev/null) ]]; then
        echo "$OSH_THEME_GIT_PROMPT_AHEAD";
    fi
}
git_prompt_behind () 
{ 
    if [[ -n $(_omb_prompt_git rev-list HEAD..origin/$(git_current_branch) 2> /dev/null) ]]; then
        echo "$OSH_THEME_GIT_PROMPT_BEHIND";
    fi
}
git_prompt_info () 
{ 
    git_prompt_vars;
    echo -e "${SCM_PREFIX}${SCM_BRANCH}${SCM_STATE}${SCM_SUFFIX}"
}
git_prompt_long_sha () 
{ 
    local SHA;
    SHA=$(_omb_prompt_git rev-parse HEAD 2> /dev/null) && echo "$OSH_THEME_GIT_PROMPT_SHA_BEFORE$SHA$OSH_THEME_GIT_PROMPT_SHA_AFTER"
}
git_prompt_minimal_info () 
{ 
    local ref;
    local status;
    local git_status_flags=('--porcelain');
    SCM_STATE=${SCM_THEME_PROMPT_CLEAN};
    if [[ "$(_omb_prompt_git config --get bash-it.hide-status)" != "1" ]]; then
        ref=$(git_clean_branch) || ref=$(_omb_prompt_git rev-parse --short HEAD 2> /dev/null) || return 0;
        SCM_BRANCH=${SCM_THEME_BRANCH_PREFIX}${ref};
        [[ "${SCM_GIT_IGNORE_UNTRACKED}" = "true" ]] && git_status_flags+='-untracked-files=no';
        status=$(_omb_prompt_git status ${git_status_flags} 2> /dev/null | tail -n1);
        if [[ -n ${status} ]]; then
            SCM_DIRTY=1;
            SCM_STATE=${SCM_THEME_PROMPT_DIRTY};
        fi;
        SCM_PREFIX=${SCM_THEME_PROMPT_PREFIX};
        SCM_SUFFIX=${SCM_THEME_PROMPT_SUFFIX};
        echo -e "${SCM_PREFIX}${SCM_BRANCH}${SCM_STATE}${SCM_SUFFIX}";
    fi
}
git_prompt_remote () 
{ 
    if [[ -n $(_omb_prompt_git show-ref origin/$(git_current_branch) 2> /dev/null) ]]; then
        echo "$OSH_THEME_GIT_PROMPT_REMOTE_EXISTS";
    else
        echo "$OSH_THEME_GIT_PROMPT_REMOTE_MISSING";
    fi
}
git_prompt_short_sha () 
{ 
    local SHA;
    SHA=$(_omb_prompt_git rev-parse --short HEAD 2> /dev/null) && echo "$OSH_THEME_GIT_PROMPT_SHA_BEFORE$SHA$OSH_THEME_GIT_PROMPT_SHA_AFTER"
}
git_prompt_status () 
{ 
    local INDEX=$(_omb_prompt_git status --porcelain -b 2> /dev/null);
    local STATUS=;
    if command grep -qE '^\?\? ' <<< "$INDEX"; then
        STATUS=$OSH_THEME_GIT_PROMPT_UNTRACKED$STATUS;
    fi;
    if command grep -q '^[AM]  ' <<< "$INDEX"; then
        STATUS=$OSH_THEME_GIT_PROMPT_ADDED$STATUS;
    fi;
    if command grep -qE '^[ A]M |^ T ' <<< "$INDEX"; then
        STATUS=$OSH_THEME_GIT_PROMPT_MODIFIED$STATUS;
    fi;
    if command grep -q '^R  ' <<< "$INDEX"; then
        STATUS=$OSH_THEME_GIT_PROMPT_RENAMED$STATUS;
    fi;
    if command grep -qE '^[ A]D |D  ' <<< "$INDEX"; then
        STATUS=$OSH_THEME_GIT_PROMPT_DELETED$STATUS;
    fi;
    if _omb_prompt_git rev-parse --verify refs/stash &> /dev/null; then
        STATUS=$OSH_THEME_GIT_PROMPT_STASHED$STATUS;
    fi;
    if command grep -q '^UU ' <<< "$INDEX"; then
        STATUS=$OSH_THEME_GIT_PROMPT_UNMERGED$STATUS;
    fi;
    if command grep -q '^## [^ ]\+ .*ahead' <<< "$INDEX"; then
        STATUS=$OSH_THEME_GIT_PROMPT_AHEAD$STATUS;
    fi;
    if command grep -q '^## [^ ]\+ .*behind' <<< "$INDEX"; then
        STATUS=$OSH_THEME_GIT_PROMPT_BEHIND$STATUS;
    fi;
    if command grep -q '^## [^ ]\+ .*diverged' <<< "$INDEX"; then
        STATUS=$OSH_THEME_GIT_PROMPT_DIVERGED$STATUS;
    fi;
    echo "$STATUS"
}
git_prompt_vars () 
{ 
    local details='';
    local git_status_flags='';
    [[ "$(command git rev-parse --is-inside-work-tree 2> /dev/null)" == "true" ]] || return 1;
    SCM_STATE=${GIT_THEME_PROMPT_CLEAN:-$SCM_THEME_PROMPT_CLEAN};
    if [[ "$(_omb_prompt_git config --get bash-it.hide-status)" != "1" ]]; then
        [[ "${SCM_GIT_IGNORE_UNTRACKED}" = "true" ]] && git_status_flags='-uno';
        local status_lines=$((_omb_prompt_git status --porcelain ${git_status_flags} -b 2> /dev/null ||
                          _omb_prompt_git status --porcelain ${git_status_flags}    2> /dev/null) | git_status_summary);
        local status=$(awk 'NR==1' <<< "$status_lines");
        local counts=$(awk 'NR==2' <<< "$status_lines");
        IFS='	' read -r untracked_count unstaged_count staged_count <<< "$counts";
        if [[ "${untracked_count}" -gt 0 || "${unstaged_count}" -gt 0 || "${staged_count}" -gt 0 ]]; then
            if [[ "${SCM_GIT_SHOW_DETAILS}" = "true" ]]; then
                [[ "${staged_count}" -gt 0 ]] && details+=" ${SCM_GIT_STAGED_CHAR}${staged_count}" && SCM_DIRTY=3;
                [[ "${unstaged_count}" -gt 0 ]] && details+=" ${SCM_GIT_UNSTAGED_CHAR}${unstaged_count}" && SCM_DIRTY=2;
                [[ "${untracked_count}" -gt 0 ]] && details+=" ${SCM_GIT_UNTRACKED_CHAR}${untracked_count}" && [[ "$SCM_GIT_DISABLE_UNTRACKED_DIRTY" != "true" ]] && SCM_DIRTY=1;
            fi;
            [[ "$SCM_GIT_DISABLE_UNTRACKED_DIRTY" != "true" || "${unstaged_count}" -gt 0 || "${staged_count}" -gt 0 ]] && SCM_STATE=${GIT_THEME_PROMPT_DIRTY:-$SCM_THEME_PROMPT_DIRTY};
        fi;
    fi;
    [[ "${SCM_GIT_SHOW_CURRENT_USER}" == "true" ]] && details+="$(git_user_info)";
    SCM_CHANGE=$(_omb_prompt_git rev-parse --short HEAD 2>/dev/null);
    local ref=$(git_clean_branch);
    if [[ -n "$ref" ]]; then
        SCM_BRANCH="${SCM_THEME_BRANCH_PREFIX}${ref}";
        local tracking_info="$(grep -- "${SCM_BRANCH}\.\.\." <<< "${status}")";
        if [[ -n "${tracking_info}" ]]; then
            [[ "${tracking_info}" =~ .+\[gone\]$ ]] && local branch_gone="true";
            tracking_info=${tracking_info#\#\# ${SCM_BRANCH}...};
            tracking_info=${tracking_info% [*};
            local remote_name=${tracking_info%%/*};
            local remote_branch=${tracking_info#${remote_name}/};
            local remote_info="";
            local num_remotes=$(_omb_prompt_git remote | wc -l 2> /dev/null);
            [[ "${SCM_BRANCH}" = "${remote_branch}" ]] && local same_branch_name=true;
            if ( [[ "${SCM_GIT_SHOW_REMOTE_INFO}" = "auto" ]] && [[ "${num_remotes}" -ge 2 ]] ) || [[ "${SCM_GIT_SHOW_REMOTE_INFO}" = "true" ]]; then
                remote_info="${remote_name}";
                [[ "${same_branch_name}" != "true" ]] && remote_info+="/${remote_branch}";
            else
                if [[ ${same_branch_name} != "true" ]]; then
                    remote_info="${remote_branch}";
                fi;
            fi;
            if [[ -n "${remote_info}" ]]; then
                if [[ "${branch_gone}" = "true" ]]; then
                    SCM_BRANCH+="${SCM_THEME_BRANCH_GONE_PREFIX}${remote_info}";
                else
                    SCM_BRANCH+="${SCM_THEME_BRANCH_TRACK_PREFIX}${remote_info}";
                fi;
            fi;
        fi;
        SCM_GIT_DETACHED="false";
    else
        local detached_prefix="";
        ref=$(_omb_prompt_git describe --tags --exact-match 2> /dev/null);
        if [[ -n "$ref" ]]; then
            detached_prefix=${SCM_THEME_TAG_PREFIX};
        else
            ref=$(_omb_prompt_git describe --contains --all HEAD 2> /dev/null);
            ref=${ref#remotes/};
            [[ -z "$ref" ]] && ref=${SCM_CHANGE};
            detached_prefix=${SCM_THEME_DETACHED_PREFIX};
        fi;
        SCM_BRANCH=${detached_prefix}${ref};
        SCM_GIT_DETACHED="true";
    fi;
    local ahead_re='.+ahead ([0-9]+).+';
    local behind_re='.+behind ([0-9]+).+';
    [[ "${status}" =~ ${ahead_re} ]] && SCM_BRANCH+=" ${SCM_GIT_AHEAD_CHAR}${BASH_REMATCH[1]}";
    [[ "${status}" =~ ${behind_re} ]] && SCM_BRANCH+=" ${SCM_GIT_BEHIND_CHAR}${BASH_REMATCH[1]}";
    local stash_count="$(_omb_prompt_git stash list 2> /dev/null | wc -l | tr -d ' ')";
    [[ "${stash_count}" -gt 0 ]] && SCM_BRANCH+=" {${stash_count}}";
    SCM_BRANCH+=${details};
    SCM_PREFIX=${GIT_THEME_PROMPT_PREFIX:-$SCM_THEME_PROMPT_PREFIX};
    SCM_SUFFIX=${GIT_THEME_PROMPT_SUFFIX:-$SCM_THEME_PROMPT_SUFFIX}
}
git_remote_status () 
{ 
    local git_remote_origin=$(_omb_prompt_git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2>/dev/null);
    local remote=${git_remote_origin/refs\/remotes\//};
    if [[ -n $remote ]]; then
        local ahead=$(_omb_prompt_git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l);
        local behind=$(_omb_prompt_git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l);
        local git_remote_status git_remote_status_detailed;
        if ((ahead == 0 && behind == 0)); then
            git_remote_status=$OSH_THEME_GIT_PROMPT_EQUAL_REMOTE;
        else
            if ((ahead > 0 && behind == 0)); then
                git_remote_status=$OSH_THEME_GIT_PROMPT_AHEAD_REMOTE;
                git_remote_status_detailed=$OSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR$OSH_THEME_GIT_PROMPT_AHEAD_REMOTE$((ahead))$_omb_prompt_reset_color;
            else
                if ((behind > 0 && ahead == 0)); then
                    git_remote_status=$OSH_THEME_GIT_PROMPT_BEHIND_REMOTE;
                    git_remote_status_detailed=$OSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR$OSH_THEME_GIT_PROMPT_BEHIND_REMOTE$((behind))$_omb_prompt_reset_color;
                else
                    if ((ahead > 0 && behind > 0)); then
                        git_remote_status=$OSH_THEME_GIT_PROMPT_DIVERGED_REMOTE;
                        git_remote_status_detailed=$OSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR$OSH_THEME_GIT_PROMPT_AHEAD_REMOTE$((ahead))$_omb_prompt_reset_color$OSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR$OSH_THEME_GIT_PROMPT_BEHIND_REMOTE$((behind))$_omb_prompt_reset_color;
                    fi;
                fi;
            fi;
        fi;
        if [[ -n $OSH_THEME_GIT_PROMPT_REMOTE_STATUS_DETAILED ]]; then
            git_remote_status=$OSH_THEME_GIT_PROMPT_REMOTE_STATUS_PREFIX$remote$git_remote_status_detailed$OSH_THEME_GIT_PROMPT_REMOTE_STATUS_SUFFIX;
        fi;
        echo "$git_remote_status";
    fi
}
git_status_summary () 
{ 
    awk '
  BEGIN {
    untracked=0;
    unstaged=0;
    staged=0;
  }
  {
    if (!after_first && $0 ~ /^##.+/) {
      print $0
      seen_header = 1
    } else if ($0 ~ /^\?\? .+/) {
      untracked += 1
    } else {
      if ($0 ~ /^.[^ ] .+/) {
        unstaged += 1
      }
      if ($0 ~ /^[^ ]. .+/) {
        staged += 1
      }
    }
    after_first = 1
  }
  END {
    if (!seen_header) {
      print
    }
    print untracked "\t" unstaged "\t" staged
  }'
}
git_user_info () 
{ 
    SCM_CURRENT_USER=$(_omb_prompt_git config user.initials | sed 's% %+%');
    [[ -z "${SCM_CURRENT_USER}" ]] && SCM_CURRENT_USER=$(printf "%s" $(for word in $(_omb_prompt_git config user.name | tr 'A-Z' 'a-z'); do printf "%1.1s" $word; done));
    [[ -n "${SCM_CURRENT_USER}" ]] && printf "%s" "$SCM_THEME_CURRENT_USER_PREFFIX$SCM_CURRENT_USER$SCM_THEME_CURRENT_USER_SUFFIX"
}
gtl () 
{ 
    command git tag --sort=-v:refname -n --list "$1*"
}
hg_prompt_info () 
{ 
    hg_prompt_vars;
    echo -e "${SCM_PREFIX}${SCM_BRANCH}:${SCM_CHANGE#*:}${SCM_STATE}${SCM_SUFFIX}"
}
hg_prompt_vars () 
{ 
    if [[ -n $(command hg status 2> /dev/null) ]]; then
        SCM_DIRTY=1;
        SCM_STATE=${HG_THEME_PROMPT_DIRTY:-$SCM_THEME_PROMPT_DIRTY};
    else
        SCM_DIRTY=0;
        SCM_STATE=${HG_THEME_PROMPT_CLEAN:-$SCM_THEME_PROMPT_CLEAN};
    fi;
    SCM_PREFIX=${HG_THEME_PROMPT_PREFIX:-$SCM_THEME_PROMPT_PREFIX};
    SCM_SUFFIX=${HG_THEME_PROMPT_SUFFIX:-$SCM_THEME_PROMPT_SUFFIX};
    HG_ROOT=$(get_hg_root);
    if [ -f "$HG_ROOT/branch" ]; then
        SCM_BRANCH=$(cat "$HG_ROOT/branch");
    else
        SCM_BRANCH=$(command hg summary 2> /dev/null | grep branch: | awk '{print $2}');
    fi;
    if [ -f "$HG_ROOT/dirstate" ]; then
        SCM_CHANGE=$(hexdump -n 10 -e '1/1 "%02x"' "$HG_ROOT/dirstate" | cut -c-12);
    else
        SCM_CHANGE=$(command hg summary 2> /dev/null | grep parent: | awk '{print $2}');
    fi
}
hstats () 
{ 
    if [[ $# -lt 1 ]]; then
        NUM=10;
    else
        NUM=${1};
    fi;
    history | awk '{print $2}' | sort | uniq -c | sort -rn | head -"$NUM"
}
httpDebug () 
{ 
    /usr/bin/curl "$@" -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\\n"
}
httpHeaders () 
{ 
    /usr/bin/curl -I -L "$@"
}
ii () 
{ 
    echo -e "\\nYou are logged on ${_omb_term_brown}$HOST";
    echo -e "\\nAdditionnal information:$NC ";
    uname -a;
    echo -e "\\n${_omb_term_brown}Users logged on:$NC ";
    w -h;
    echo -e "\\n${_omb_term_brown}Current date :$NC ";
    date;
    echo -e "\\n${_omb_term_brown}Machine stats :$NC ";
    uptime;
    [[ "$OSTYPE" == darwin* ]] && echo -e "\\n${_omb_term_brown}Current network location :$NC ";
    scselect;
    echo -e "\\n${_omb_term_brown}Public facing IP Address :$NC ";
    myip;
    [[ "$OSTYPE" == darwin* ]] && echo -e "\\n${_omb_term_brown}DNS Configuration:$NC ";
    scutil --dns;
    echo
}
ips () 
{ 
    if _omb_util_command_exists ifconfig; then
        ifconfig | awk '/inet /{ print $2 }';
    else
        if _omb_util_command_exists ip; then
            ip addr | grep -oP 'inet \K[\d.]+';
        else
            echo "You don't have ifconfig or ip command installed!";
        fi;
    fi
}
is_alias () 
{ 
    local base_dir=$1 name=$2;
    [[ -f $base_dir/aliases/$name/$name.aliases.sh ]]
}
is_completion () 
{ 
    local base_dir=$1 name=$2;
    [[ -f $base_dir/completions/$name/$name.completion.sh ]]
}
is_confirmed () 
{ 
    [[ $REPLY =~ ^[Yy]$ ]]
}
is_os () 
{ 
    [[ $OSTYPE == $1* ]]
}
is_plugin () 
{ 
    local base_dir=$1 name=$2;
    [[ -f $base_dir/plugins/$name/$name.plugin.sh || -f $base_dir/plugins/$name/_$name ]]
}
is_vim_shell () 
{ 
    if [ ! -z "$VIMRUNTIME" ]; then
        echo "[${_omb_prompt_teal}vim shell${_omb_prompt_normal}]";
    fi
}
lsgrep () 
{ 
    ls | grep "$*"
}
mans () 
{ 
    man "$1" | grep -iC2 --color=always "$2" | less
}
mcd () 
{ 
    mkdir -p -- "$*";
    cd -- "$*" || exit
}
mkiso () 
{ 
    if _omb_util_command_exists mkisofs; then
        if [ -z ${1+x} ]; then
            local isoname=${PWD##*/};
        else
            local isoname=$1;
        fi;
        if [ -z ${2+x} ]; then
            local destpath=../;
        else
            local destpath=$2;
        fi;
        if [ -z ${3+x} ]; then
            local srcpath=${PWD};
        else
            local srcpath=$3;
        fi;
        if [ ! -f "${destpath}${isoname}.iso" ]; then
            echo "writing ${isoname}.iso to ${destpath} from ${srcpath}";
            mkisofs -V "${isoname}" -iso-level 3 -r -o "${destpath}${isoname}.iso" "${srcpath}";
        else
            echo "${destpath}${isoname}.iso already exists";
        fi;
    else
        echo "mkisofs cmd does not exist, please install cdrtools";
    fi
}
mo () 
{ 
    local moContent f2source files doubleHyphens;
    IFS=' 
	';
    files=();
    doubleHyphens=false;
    if [[ $# -gt 0 ]]; then
        for arg in "$@";
        do
            if $doubleHyphens; then
                files=("${files[@]}" "$arg");
            else
                case "$arg" in 
                    -h | --h | --he | --hel | --help | -\?)
                        _moUsage "$0";
                        exit 0
                    ;;
                    --false)
                        MO_FALSE_IS_EMPTY=true
                    ;;
                    --source=*)
                        f2source="${arg#--source=}";
                        if [[ -f "$f2source" ]]; then
                            . "$f2source";
                        else
                            echo "No such file: $f2source" 1>&2;
                            exit 1;
                        fi
                    ;;
                    --)
                        doubleHyphens=true
                    ;;
                    *)
                        files=("${files[@]}" "$arg")
                    ;;
                esac;
            fi;
        done;
    fi;
    _moGetContent moContent "${files[@]}";
    _moParse "$moContent" "" true
}
modern_scm_prompt () 
{ 
    CHAR=$(scm_char);
    if [ $CHAR = $SCM_NONE_CHAR ]; then
        return;
    else
        echo "[$(scm_char)][$(scm_prompt_info)]";
    fi
}
my_ps () 
{ 
    ps "$@" -u "$USER" -o pid,%cpu,%mem,start,time,bsdtime,command
}
my_ve () 
{ 
    if [ -n "$VIRTUAL_ENV" ]; then
        my_ps_ve="${_omb_prompt_bold_purple}$ve${_omb_prompt_normal}";
        echo "($my_ps_ve)";
    fi;
    echo ""
}
myip () 
{ 
    res=$(curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+');
    echo -e "Your public IP is: ${_omb_term_bold_green} $res ${_omb_term_normal}"
}
no_term_spinner () 
{ 
    local pid=$!;
    local delay=0.1;
    local spinstr='|/-\';
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        printf ".";
        sleep 2;
    done;
    echo " ✓ "
}
nvm () 
{ 
    if [ "$#" -lt 1 ]; then
        nvm --help;
        return;
    fi;
    local DEFAULT_IFS;
    DEFAULT_IFS=" $(nvm_echo t | command tr t \\t)
";
    if [ "${-#*e}" != "$-" ]; then
        set +e;
        local EXIT_CODE;
        IFS="${DEFAULT_IFS}" nvm "$@";
        EXIT_CODE="$?";
        set -e;
        return "$EXIT_CODE";
    else
        if [ "${-#*a}" != "$-" ]; then
            set +a;
            local EXIT_CODE;
            IFS="${DEFAULT_IFS}" nvm "$@";
            EXIT_CODE="$?";
            set -a;
            return "$EXIT_CODE";
        else
            if [ -n "${BASH-}" ] && [ "${-#*E}" != "$-" ]; then
                set +E;
                local EXIT_CODE;
                IFS="${DEFAULT_IFS}" nvm "$@";
                EXIT_CODE="$?";
                set -E;
                return "$EXIT_CODE";
            else
                if [ "${IFS}" != "${DEFAULT_IFS}" ]; then
                    IFS="${DEFAULT_IFS}" nvm "$@";
                    return "$?";
                fi;
            fi;
        fi;
    fi;
    local i;
    for i in "$@";
    do
        case $i in 
            --)
                break
            ;;
            '-h' | 'help' | '--help')
                NVM_NO_COLORS="";
                for j in "$@";
                do
                    if [ "${j}" = '--no-colors' ]; then
                        NVM_NO_COLORS="${j}";
                        break;
                    fi;
                done;
                local NVM_IOJS_PREFIX;
                NVM_IOJS_PREFIX="$(nvm_iojs_prefix)";
                local NVM_NODE_PREFIX;
                NVM_NODE_PREFIX="$(nvm_node_prefix)";
                NVM_VERSION="$(nvm --version)";
                nvm_echo;
                nvm_echo "Node Version Manager (v${NVM_VERSION})";
                nvm_echo;
                nvm_echo 'Note: <version> refers to any version-like string nvm understands. This includes:';
                nvm_echo '  - full or partial version numbers, starting with an optional "v" (0.10, v0.1.2, v1)';
                nvm_echo "  - default (built-in) aliases: ${NVM_NODE_PREFIX}, stable, unstable, ${NVM_IOJS_PREFIX}, system";
                nvm_echo '  - custom aliases you define with `nvm alias foo`';
                nvm_echo;
                nvm_echo ' Any options that produce colorized output should respect the `--no-colors` option.';
                nvm_echo;
                nvm_echo 'Usage:';
                nvm_echo '  nvm --help                                  Show this message';
                nvm_echo '    --no-colors                               Suppress colored output';
                nvm_echo '  nvm --version                               Print out the installed version of nvm';
                nvm_echo '  nvm install [<version>]                     Download and install a <version>. Uses .nvmrc if available and version is omitted.';
                nvm_echo '   The following optional arguments, if provided, must appear directly after `nvm install`:';
                nvm_echo '    -s                                        Skip binary download, install from source only.';
                nvm_echo '    -b                                        Skip source download, install from binary only.';
                nvm_echo '    --reinstall-packages-from=<version>       When installing, reinstall packages installed in <node|iojs|node version number>';
                nvm_echo '    --lts                                     When installing, only select from LTS (long-term support) versions';
                nvm_echo '    --lts=<LTS name>                          When installing, only select from versions for a specific LTS line';
                nvm_echo '    --skip-default-packages                   When installing, skip the default-packages file if it exists';
                nvm_echo '    --latest-npm                              After installing, attempt to upgrade to the latest working npm on the given node version';
                nvm_echo '    --no-progress                             Disable the progress bar on any downloads';
                nvm_echo '    --alias=<name>                            After installing, set the alias specified to the version specified. (same as: nvm alias <name> <version>)';
                nvm_echo '    --default                                 After installing, set default alias to the version specified. (same as: nvm alias default <version>)';
                nvm_echo '  nvm uninstall <version>                     Uninstall a version';
                nvm_echo '  nvm uninstall --lts                         Uninstall using automatic LTS (long-term support) alias `lts/*`, if available.';
                nvm_echo '  nvm uninstall --lts=<LTS name>              Uninstall using automatic alias for provided LTS line, if available.';
                nvm_echo '  nvm use [<version>]                         Modify PATH to use <version>. Uses .nvmrc if available and version is omitted.';
                nvm_echo '   The following optional arguments, if provided, must appear directly after `nvm use`:';
                nvm_echo '    --silent                                  Silences stdout/stderr output';
                nvm_echo '    --lts                                     Uses automatic LTS (long-term support) alias `lts/*`, if available.';
                nvm_echo '    --lts=<LTS name>                          Uses automatic alias for provided LTS line, if available.';
                nvm_echo '  nvm exec [<version>] [<command>]            Run <command> on <version>. Uses .nvmrc if available and version is omitted.';
                nvm_echo '   The following optional arguments, if provided, must appear directly after `nvm exec`:';
                nvm_echo '    --silent                                  Silences stdout/stderr output';
                nvm_echo '    --lts                                     Uses automatic LTS (long-term support) alias `lts/*`, if available.';
                nvm_echo '    --lts=<LTS name>                          Uses automatic alias for provided LTS line, if available.';
                nvm_echo '  nvm run [<version>] [<args>]                Run `node` on <version> with <args> as arguments. Uses .nvmrc if available and version is omitted.';
                nvm_echo '   The following optional arguments, if provided, must appear directly after `nvm run`:';
                nvm_echo '    --silent                                  Silences stdout/stderr output';
                nvm_echo '    --lts                                     Uses automatic LTS (long-term support) alias `lts/*`, if available.';
                nvm_echo '    --lts=<LTS name>                          Uses automatic alias for provided LTS line, if available.';
                nvm_echo '  nvm current                                 Display currently activated version of Node';
                nvm_echo '  nvm ls [<version>]                          List installed versions, matching a given <version> if provided';
                nvm_echo '    --no-colors                               Suppress colored output';
                nvm_echo '    --no-alias                                Suppress `nvm alias` output';
                nvm_echo '  nvm ls-remote [<version>]                   List remote versions available for install, matching a given <version> if provided';
                nvm_echo '    --lts                                     When listing, only show LTS (long-term support) versions';
                nvm_echo '    --lts=<LTS name>                          When listing, only show versions for a specific LTS line';
                nvm_echo '    --no-colors                               Suppress colored output';
                nvm_echo '  nvm version <version>                       Resolve the given description to a single local version';
                nvm_echo '  nvm version-remote <version>                Resolve the given description to a single remote version';
                nvm_echo '    --lts                                     When listing, only select from LTS (long-term support) versions';
                nvm_echo '    --lts=<LTS name>                          When listing, only select from versions for a specific LTS line';
                nvm_echo '  nvm deactivate                              Undo effects of `nvm` on current shell';
                nvm_echo '    --silent                                  Silences stdout/stderr output';
                nvm_echo '  nvm alias [<pattern>]                       Show all aliases beginning with <pattern>';
                nvm_echo '    --no-colors                               Suppress colored output';
                nvm_echo '  nvm alias <name> <version>                  Set an alias named <name> pointing to <version>';
                nvm_echo '  nvm unalias <name>                          Deletes the alias named <name>';
                nvm_echo '  nvm install-latest-npm                      Attempt to upgrade to the latest working `npm` on the current node version';
                nvm_echo '  nvm reinstall-packages <version>            Reinstall global `npm` packages contained in <version> to current version';
                nvm_echo '  nvm unload                                  Unload `nvm` from shell';
                nvm_echo '  nvm which [current | <version>]             Display path to installed node version. Uses .nvmrc if available and version is omitted.';
                nvm_echo '    --silent                                  Silences stdout/stderr output when a version is omitted';
                nvm_echo '  nvm cache dir                               Display path to the cache directory for nvm';
                nvm_echo '  nvm cache clear                             Empty cache directory for nvm';
                nvm_echo '  nvm set-colors [<color codes>]              Set five text colors using format "yMeBg". Available when supported.';
                nvm_echo '                                               Initial colors are:';
                nvm_echo_with_colors "                                                  $(nvm_wrap_with_color_code b b)$(nvm_wrap_with_color_code y y)$(nvm_wrap_with_color_code g g)$(nvm_wrap_with_color_code r r)$(nvm_wrap_with_color_code e e)";
                nvm_echo '                                               Color codes:';
                nvm_echo_with_colors "                                                $(nvm_wrap_with_color_code r r)/$(nvm_wrap_with_color_code R R) = $(nvm_wrap_with_color_code r red) / $(nvm_wrap_with_color_code R 'bold red')";
                nvm_echo_with_colors "                                                $(nvm_wrap_with_color_code g g)/$(nvm_wrap_with_color_code G G) = $(nvm_wrap_with_color_code g green) / $(nvm_wrap_with_color_code G 'bold green')";
                nvm_echo_with_colors "                                                $(nvm_wrap_with_color_code b b)/$(nvm_wrap_with_color_code B B) = $(nvm_wrap_with_color_code b blue) / $(nvm_wrap_with_color_code B 'bold blue')";
                nvm_echo_with_colors "                                                $(nvm_wrap_with_color_code c c)/$(nvm_wrap_with_color_code C C) = $(nvm_wrap_with_color_code c cyan) / $(nvm_wrap_with_color_code C 'bold cyan')";
                nvm_echo_with_colors "                                                $(nvm_wrap_with_color_code m m)/$(nvm_wrap_with_color_code M M) = $(nvm_wrap_with_color_code m magenta) / $(nvm_wrap_with_color_code M 'bold magenta')";
                nvm_echo_with_colors "                                                $(nvm_wrap_with_color_code y y)/$(nvm_wrap_with_color_code Y Y) = $(nvm_wrap_with_color_code y yellow) / $(nvm_wrap_with_color_code Y 'bold yellow')";
                nvm_echo_with_colors "                                                $(nvm_wrap_with_color_code k k)/$(nvm_wrap_with_color_code K K) = $(nvm_wrap_with_color_code k black) / $(nvm_wrap_with_color_code K 'bold black')";
                nvm_echo_with_colors "                                                $(nvm_wrap_with_color_code e e)/$(nvm_wrap_with_color_code W W) = $(nvm_wrap_with_color_code e 'light grey') / $(nvm_wrap_with_color_code W white)";
                nvm_echo 'Example:';
                nvm_echo '  nvm install 8.0.0                     Install a specific version number';
                nvm_echo '  nvm use 8.0                           Use the latest available 8.0.x release';
                nvm_echo '  nvm run 6.10.3 app.js                 Run app.js using node 6.10.3';
                nvm_echo '  nvm exec 4.8.3 node app.js            Run `node app.js` with the PATH pointing to node 4.8.3';
                nvm_echo '  nvm alias default 8.1.0               Set default node version on a shell';
                nvm_echo '  nvm alias default node                Always default to the latest available node version on a shell';
                nvm_echo;
                nvm_echo '  nvm install node                      Install the latest available version';
                nvm_echo '  nvm use node                          Use the latest version';
                nvm_echo '  nvm install --lts                     Install the latest LTS version';
                nvm_echo '  nvm use --lts                         Use the latest LTS version';
                nvm_echo;
                nvm_echo '  nvm set-colors cgYmW                  Set text colors to cyan, green, bold yellow, magenta, and white';
                nvm_echo;
                nvm_echo 'Note:';
                nvm_echo '  to remove, delete, or uninstall nvm - just remove the `$NVM_DIR` folder (usually `~/.nvm`)';
                nvm_echo;
                return 0
            ;;
        esac;
    done;
    local COMMAND;
    COMMAND="${1-}";
    shift;
    local VERSION;
    local ADDITIONAL_PARAMETERS;
    case $COMMAND in 
        "cache")
            case "${1-}" in 
                dir)
                    nvm_cache_dir
                ;;
                clear)
                    local DIR;
                    DIR="$(nvm_cache_dir)";
                    if command rm -rf "${DIR}" && command mkdir -p "${DIR}"; then
                        nvm_echo 'nvm cache cleared.';
                    else
                        nvm_err "Unable to clear nvm cache: ${DIR}";
                        return 1;
                    fi
                ;;
                *)
                    nvm --help 1>&2;
                    return 127
                ;;
            esac
        ;;
        "debug")
            local OS_VERSION;
            nvm_is_zsh && setopt local_options shwordsplit;
            nvm_err "nvm --version: v$(nvm --version)";
            if [ -n "${TERM_PROGRAM-}" ]; then
                nvm_err "\$TERM_PROGRAM: ${TERM_PROGRAM}";
            fi;
            nvm_err "\$SHELL: ${SHELL}";
            nvm_err "\$SHLVL: ${SHLVL-}";
            nvm_err "whoami: '$(whoami)'";
            nvm_err "\${HOME}: ${HOME}";
            nvm_err "\${NVM_DIR}: '$(nvm_sanitize_path "${NVM_DIR}")'";
            nvm_err "\${PATH}: $(nvm_sanitize_path "${PATH}")";
            nvm_err "\$PREFIX: '$(nvm_sanitize_path "${PREFIX}")'";
            nvm_err "\${NPM_CONFIG_PREFIX}: '$(nvm_sanitize_path "${NPM_CONFIG_PREFIX}")'";
            nvm_err "\$NVM_NODEJS_ORG_MIRROR: '${NVM_NODEJS_ORG_MIRROR}'";
            nvm_err "\$NVM_IOJS_ORG_MIRROR: '${NVM_IOJS_ORG_MIRROR}'";
            nvm_err "shell version: '$(${SHELL} --version | command head -n 1)'";
            nvm_err "uname -a: '$(command uname -a | command awk '{$2=""; print}' | command xargs)'";
            nvm_err "checksum binary: '$(nvm_get_checksum_binary 2>/dev/null)'";
            if [ "$(nvm_get_os)" = "darwin" ] && nvm_has sw_vers; then
                OS_VERSION="$(sw_vers | command awk '{print $2}' | command xargs)";
            else
                if [ -r "/etc/issue" ]; then
                    OS_VERSION="$(command head -n 1 /etc/issue | command sed 's/\\.//g')";
                    if [ -z "${OS_VERSION}" ] && [ -r "/etc/os-release" ]; then
                        OS_VERSION="$(. /etc/os-release && echo "${NAME}" "${VERSION}")";
                    fi;
                fi;
            fi;
            if [ -n "${OS_VERSION}" ]; then
                nvm_err "OS version: ${OS_VERSION}";
            fi;
            if nvm_has "awk"; then
                nvm_err "awk: $(nvm_command_info awk), $({ command awk --version 2>/dev/null || command awk -W version; }           | command head -n 1)";
            else
                nvm_err "awk: not found";
            fi;
            if nvm_has "curl"; then
                nvm_err "curl: $(nvm_command_info curl), $(command curl -V | command head -n 1)";
            else
                nvm_err "curl: not found";
            fi;
            if nvm_has "wget"; then
                nvm_err "wget: $(nvm_command_info wget), $(command wget -V | command head -n 1)";
            else
                nvm_err "wget: not found";
            fi;
            local TEST_TOOLS ADD_TEST_TOOLS;
            TEST_TOOLS="git grep";
            ADD_TEST_TOOLS="sed cut basename rm mkdir xargs";
            if [ "darwin" != "$(nvm_get_os)" ] && [ "freebsd" != "$(nvm_get_os)" ]; then
                TEST_TOOLS="${TEST_TOOLS} ${ADD_TEST_TOOLS}";
            else
                for tool in ${ADD_TEST_TOOLS};
                do
                    if nvm_has "${tool}"; then
                        nvm_err "${tool}: $(nvm_command_info "${tool}")";
                    else
                        nvm_err "${tool}: not found";
                    fi;
                done;
            fi;
            for tool in ${TEST_TOOLS};
            do
                local NVM_TOOL_VERSION;
                if nvm_has "${tool}"; then
                    if command ls -l "$(nvm_command_info "${tool}" | command awk '{print $1}')" | command grep -q busybox; then
                        NVM_TOOL_VERSION="$(command "${tool}" --help 2>&1 | command head -n 1)";
                    else
                        NVM_TOOL_VERSION="$(command "${tool}" --version 2>&1 | command head -n 1)";
                    fi;
                    nvm_err "${tool}: $(nvm_command_info "${tool}"), ${NVM_TOOL_VERSION}";
                else
                    nvm_err "${tool}: not found";
                fi;
                unset NVM_TOOL_VERSION;
            done;
            unset TEST_TOOLS ADD_TEST_TOOLS;
            local NVM_DEBUG_OUTPUT;
            for NVM_DEBUG_COMMAND in 'nvm current' 'which node' 'which iojs' 'which npm' 'npm config get prefix' 'npm root -g';
            do
                NVM_DEBUG_OUTPUT="$(${NVM_DEBUG_COMMAND} 2>&1)";
                nvm_err "${NVM_DEBUG_COMMAND}: $(nvm_sanitize_path "${NVM_DEBUG_OUTPUT}")";
            done;
            return 42
        ;;
        "install" | "i")
            local version_not_provided;
            version_not_provided=0;
            local NVM_OS;
            NVM_OS="$(nvm_get_os)";
            if ! nvm_has "curl" && ! nvm_has "wget"; then
                nvm_err 'nvm needs curl or wget to proceed.';
                return 1;
            fi;
            if [ $# -lt 1 ]; then
                version_not_provided=1;
            fi;
            local nobinary;
            local nosource;
            local noprogress;
            nobinary=0;
            noprogress=0;
            nosource=0;
            local LTS;
            local ALIAS;
            local NVM_UPGRADE_NPM;
            NVM_UPGRADE_NPM=0;
            local PROVIDED_REINSTALL_PACKAGES_FROM;
            local REINSTALL_PACKAGES_FROM;
            local SKIP_DEFAULT_PACKAGES;
            while [ $# -ne 0 ]; do
                case "$1" in 
                    ---*)
                        nvm_err 'arguments with `---` are not supported - this is likely a typo';
                        return 55
                    ;;
                    -s)
                        shift;
                        nobinary=1;
                        if [ $nosource -eq 1 ]; then
                            nvm err '-s and -b cannot be set together since they would skip install from both binary and source';
                            return 6;
                        fi
                    ;;
                    -b)
                        shift;
                        nosource=1;
                        if [ $nobinary -eq 1 ]; then
                            nvm err '-s and -b cannot be set together since they would skip install from both binary and source';
                            return 6;
                        fi
                    ;;
                    -j)
                        shift;
                        nvm_get_make_jobs "$1";
                        shift
                    ;;
                    --no-progress)
                        noprogress=1;
                        shift
                    ;;
                    --lts)
                        LTS='*';
                        shift
                    ;;
                    --lts=*)
                        LTS="${1##--lts=}";
                        shift
                    ;;
                    --latest-npm)
                        NVM_UPGRADE_NPM=1;
                        shift
                    ;;
                    --default)
                        if [ -n "${ALIAS-}" ]; then
                            nvm_err '--default and --alias are mutually exclusive, and may not be provided more than once';
                            return 6;
                        fi;
                        ALIAS='default';
                        shift
                    ;;
                    --alias=*)
                        if [ -n "${ALIAS-}" ]; then
                            nvm_err '--default and --alias are mutually exclusive, and may not be provided more than once';
                            return 6;
                        fi;
                        ALIAS="${1##--alias=}";
                        shift
                    ;;
                    --reinstall-packages-from=*)
                        if [ -n "${PROVIDED_REINSTALL_PACKAGES_FROM-}" ]; then
                            nvm_err '--reinstall-packages-from may not be provided more than once';
                            return 6;
                        fi;
                        PROVIDED_REINSTALL_PACKAGES_FROM="$(nvm_echo "$1" | command cut -c 27-)";
                        if [ -z "${PROVIDED_REINSTALL_PACKAGES_FROM}" ]; then
                            nvm_err 'If --reinstall-packages-from is provided, it must point to an installed version of node.';
                            return 6;
                        fi;
                        REINSTALL_PACKAGES_FROM="$(nvm_version "${PROVIDED_REINSTALL_PACKAGES_FROM}")" || :;
                        shift
                    ;;
                    --copy-packages-from=*)
                        if [ -n "${PROVIDED_REINSTALL_PACKAGES_FROM-}" ]; then
                            nvm_err '--reinstall-packages-from may not be provided more than once, or combined with `--copy-packages-from`';
                            return 6;
                        fi;
                        PROVIDED_REINSTALL_PACKAGES_FROM="$(nvm_echo "$1" | command cut -c 22-)";
                        if [ -z "${PROVIDED_REINSTALL_PACKAGES_FROM}" ]; then
                            nvm_err 'If --copy-packages-from is provided, it must point to an installed version of node.';
                            return 6;
                        fi;
                        REINSTALL_PACKAGES_FROM="$(nvm_version "${PROVIDED_REINSTALL_PACKAGES_FROM}")" || :;
                        shift
                    ;;
                    --reinstall-packages-from | --copy-packages-from)
                        nvm_err "If ${1} is provided, it must point to an installed version of node using \`=\`.";
                        return 6
                    ;;
                    --skip-default-packages)
                        SKIP_DEFAULT_PACKAGES=true;
                        shift
                    ;;
                    *)
                        break
                    ;;
                esac;
            done;
            local provided_version;
            provided_version="${1-}";
            if [ -z "${provided_version}" ]; then
                if [ "_${LTS-}" = '_*' ]; then
                    nvm_echo 'Installing latest LTS version.';
                    if [ $# -gt 0 ]; then
                        shift;
                    fi;
                else
                    if [ "_${LTS-}" != '_' ]; then
                        nvm_echo "Installing with latest version of LTS line: ${LTS}";
                        if [ $# -gt 0 ]; then
                            shift;
                        fi;
                    else
                        nvm_rc_version;
                        if [ $version_not_provided -eq 1 ] && [ -z "${NVM_RC_VERSION}" ]; then
                            unset NVM_RC_VERSION;
                            nvm --help 1>&2;
                            return 127;
                        fi;
                        provided_version="${NVM_RC_VERSION}";
                        unset NVM_RC_VERSION;
                    fi;
                fi;
            else
                if [ $# -gt 0 ]; then
                    shift;
                fi;
            fi;
            case "${provided_version}" in 
                'lts/*')
                    LTS='*';
                    provided_version=''
                ;;
                lts/*)
                    LTS="${provided_version##lts/}";
                    provided_version=''
                ;;
            esac;
            VERSION="$(NVM_VERSION_ONLY=true NVM_LTS="${LTS-}" nvm_remote_version "${provided_version}")";
            if [ "${VERSION}" = 'N/A' ]; then
                local LTS_MSG;
                local REMOTE_CMD;
                if [ "${LTS-}" = '*' ]; then
                    LTS_MSG='(with LTS filter) ';
                    REMOTE_CMD='nvm ls-remote --lts';
                else
                    if [ -n "${LTS-}" ]; then
                        LTS_MSG="(with LTS filter '${LTS}') ";
                        REMOTE_CMD="nvm ls-remote --lts=${LTS}";
                    else
                        REMOTE_CMD='nvm ls-remote';
                    fi;
                fi;
                nvm_err "Version '${provided_version}' ${LTS_MSG-}not found - try \`${REMOTE_CMD}\` to browse available versions.";
                return 3;
            fi;
            ADDITIONAL_PARAMETERS='';
            while [ $# -ne 0 ]; do
                case "$1" in 
                    --reinstall-packages-from=*)
                        if [ -n "${PROVIDED_REINSTALL_PACKAGES_FROM-}" ]; then
                            nvm_err '--reinstall-packages-from may not be provided more than once';
                            return 6;
                        fi;
                        PROVIDED_REINSTALL_PACKAGES_FROM="$(nvm_echo "$1" | command cut -c 27-)";
                        if [ -z "${PROVIDED_REINSTALL_PACKAGES_FROM}" ]; then
                            nvm_err 'If --reinstall-packages-from is provided, it must point to an installed version of node.';
                            return 6;
                        fi;
                        REINSTALL_PACKAGES_FROM="$(nvm_version "${PROVIDED_REINSTALL_PACKAGES_FROM}")" || :
                    ;;
                    --copy-packages-from=*)
                        if [ -n "${PROVIDED_REINSTALL_PACKAGES_FROM-}" ]; then
                            nvm_err '--reinstall-packages-from may not be provided more than once, or combined with `--copy-packages-from`';
                            return 6;
                        fi;
                        PROVIDED_REINSTALL_PACKAGES_FROM="$(nvm_echo "$1" | command cut -c 22-)";
                        if [ -z "${PROVIDED_REINSTALL_PACKAGES_FROM}" ]; then
                            nvm_err 'If --copy-packages-from is provided, it must point to an installed version of node.';
                            return 6;
                        fi;
                        REINSTALL_PACKAGES_FROM="$(nvm_version "${PROVIDED_REINSTALL_PACKAGES_FROM}")" || :
                    ;;
                    --reinstall-packages-from | --copy-packages-from)
                        nvm_err "If ${1} is provided, it must point to an installed version of node using \`=\`.";
                        return 6
                    ;;
                    --skip-default-packages)
                        SKIP_DEFAULT_PACKAGES=true
                    ;;
                    *)
                        ADDITIONAL_PARAMETERS="${ADDITIONAL_PARAMETERS} $1"
                    ;;
                esac;
                shift;
            done;
            if [ -n "${PROVIDED_REINSTALL_PACKAGES_FROM-}" ] && [ "$(nvm_ensure_version_prefix "${PROVIDED_REINSTALL_PACKAGES_FROM}")" = "${VERSION}" ]; then
                nvm_err "You can't reinstall global packages from the same version of node you're installing.";
                return 4;
            else
                if [ "${REINSTALL_PACKAGES_FROM-}" = 'N/A' ]; then
                    nvm_err "If --reinstall-packages-from is provided, it must point to an installed version of node.";
                    return 5;
                fi;
            fi;
            local FLAVOR;
            if nvm_is_iojs_version "${VERSION}"; then
                FLAVOR="$(nvm_iojs_prefix)";
            else
                FLAVOR="$(nvm_node_prefix)";
            fi;
            local EXIT_CODE;
            EXIT_CODE=0;
            if nvm_is_version_installed "${VERSION}"; then
                nvm_err "${VERSION} is already installed.";
                nvm use "${VERSION}";
                EXIT_CODE=$?;
                if [ $EXIT_CODE -eq 0 ]; then
                    if [ "${NVM_UPGRADE_NPM}" = 1 ]; then
                        nvm install-latest-npm;
                        EXIT_CODE=$?;
                    fi;
                    if [ $EXIT_CODE -ne 0 ] && [ -z "${SKIP_DEFAULT_PACKAGES-}" ]; then
                        nvm_install_default_packages;
                    fi;
                    if [ $EXIT_CODE -ne 0 ] && [ -n "${REINSTALL_PACKAGES_FROM-}" ] && [ "_${REINSTALL_PACKAGES_FROM}" != "_N/A" ]; then
                        nvm reinstall-packages "${REINSTALL_PACKAGES_FROM}";
                        EXIT_CODE=$?;
                    fi;
                fi;
                if [ -n "${LTS-}" ]; then
                    LTS="$(echo "${LTS}" | tr '[:upper:]' '[:lower:]')";
                    nvm_ensure_default_set "lts/${LTS}";
                else
                    nvm_ensure_default_set "${provided_version}";
                fi;
                if [ $EXIT_CODE -ne 0 ] && [ -n "${ALIAS-}" ]; then
                    nvm alias "${ALIAS}" "${provided_version}";
                    EXIT_CODE=$?;
                fi;
                return $EXIT_CODE;
            fi;
            if [ -n "${NVM_INSTALL_THIRD_PARTY_HOOK-}" ]; then
                nvm_err '** $NVM_INSTALL_THIRD_PARTY_HOOK env var set; dispatching to third-party installation method **';
                local NVM_METHOD_PREFERENCE;
                NVM_METHOD_PREFERENCE='binary';
                if [ $nobinary -eq 1 ]; then
                    NVM_METHOD_PREFERENCE='source';
                fi;
                local VERSION_PATH;
                VERSION_PATH="$(nvm_version_path "${VERSION}")";
                "${NVM_INSTALL_THIRD_PARTY_HOOK}" "${VERSION}" "${FLAVOR}" std "${NVM_METHOD_PREFERENCE}" "${VERSION_PATH}" || { 
                    EXIT_CODE=$?;
                    nvm_err '*** Third-party $NVM_INSTALL_THIRD_PARTY_HOOK env var failed to install! ***';
                    return $EXIT_CODE
                };
                if ! nvm_is_version_installed "${VERSION}"; then
                    nvm_err '*** Third-party $NVM_INSTALL_THIRD_PARTY_HOOK env var claimed to succeed, but failed to install! ***';
                    return 33;
                fi;
                EXIT_CODE=0;
            else
                if [ "_${NVM_OS}" = "_freebsd" ]; then
                    nobinary=1;
                    nvm_err "Currently, there is no binary for FreeBSD";
                else
                    if [ "_$NVM_OS" = "_openbsd" ]; then
                        nobinary=1;
                        nvm_err "Currently, there is no binary for OpenBSD";
                    else
                        if [ "_${NVM_OS}" = "_sunos" ]; then
                            if ! nvm_has_solaris_binary "${VERSION}"; then
                                nobinary=1;
                                nvm_err "Currently, there is no binary of version ${VERSION} for SunOS";
                            fi;
                        fi;
                    fi;
                fi;
                if [ $nobinary -ne 1 ] && nvm_binary_available "${VERSION}"; then
                    NVM_NO_PROGRESS="${NVM_NO_PROGRESS:-${noprogress}}" nvm_install_binary "${FLAVOR}" std "${VERSION}" "${nosource}";
                    EXIT_CODE=$?;
                else
                    EXIT_CODE=-1;
                fi;
                if [ $EXIT_CODE -ne 0 ]; then
                    if [ -z "${NVM_MAKE_JOBS-}" ]; then
                        nvm_get_make_jobs;
                    fi;
                    if [ "_${NVM_OS}" = "_win" ]; then
                        nvm_err 'Installing from source on non-WSL Windows is not supported';
                        EXIT_CODE=87;
                    else
                        NVM_NO_PROGRESS="${NVM_NO_PROGRESS:-${noprogress}}" nvm_install_source "${FLAVOR}" std "${VERSION}" "${NVM_MAKE_JOBS}" "${ADDITIONAL_PARAMETERS}";
                        EXIT_CODE=$?;
                    fi;
                fi;
            fi;
            if [ $EXIT_CODE -eq 0 ] && nvm_use_if_needed "${VERSION}" && nvm_install_npm_if_needed "${VERSION}"; then
                if [ -n "${LTS-}" ]; then
                    nvm_ensure_default_set "lts/${LTS}";
                else
                    nvm_ensure_default_set "${provided_version}";
                fi;
                if [ "${NVM_UPGRADE_NPM}" = 1 ]; then
                    nvm install-latest-npm;
                    EXIT_CODE=$?;
                fi;
                if [ $EXIT_CODE -eq 0 ] && [ -z "${SKIP_DEFAULT_PACKAGES-}" ]; then
                    nvm_install_default_packages;
                fi;
                if [ $EXIT_CODE -eq 0 ] && [ -n "${REINSTALL_PACKAGES_FROM-}" ] && [ "_${REINSTALL_PACKAGES_FROM}" != "_N/A" ]; then
                    nvm reinstall-packages "${REINSTALL_PACKAGES_FROM}";
                    EXIT_CODE=$?;
                fi;
            else
                EXIT_CODE=$?;
            fi;
            return $EXIT_CODE
        ;;
        "uninstall")
            if [ $# -ne 1 ]; then
                nvm --help 1>&2;
                return 127;
            fi;
            local PATTERN;
            PATTERN="${1-}";
            case "${PATTERN-}" in 
                --)

                ;;
                --lts | 'lts/*')
                    VERSION="$(nvm_match_version "lts/*")"
                ;;
                lts/*)
                    VERSION="$(nvm_match_version "lts/${PATTERN##lts/}")"
                ;;
                --lts=*)
                    VERSION="$(nvm_match_version "lts/${PATTERN##--lts=}")"
                ;;
                *)
                    VERSION="$(nvm_version "${PATTERN}")"
                ;;
            esac;
            if [ "_${VERSION}" = "_$(nvm_ls_current)" ]; then
                if nvm_is_iojs_version "${VERSION}"; then
                    nvm_err "nvm: Cannot uninstall currently-active io.js version, ${VERSION} (inferred from ${PATTERN}).";
                else
                    nvm_err "nvm: Cannot uninstall currently-active node version, ${VERSION} (inferred from ${PATTERN}).";
                fi;
                return 1;
            fi;
            if ! nvm_is_version_installed "${VERSION}"; then
                nvm_err "${VERSION} version is not installed...";
                return;
            fi;
            local SLUG_BINARY;
            local SLUG_SOURCE;
            if nvm_is_iojs_version "${VERSION}"; then
                SLUG_BINARY="$(nvm_get_download_slug iojs binary std "${VERSION}")";
                SLUG_SOURCE="$(nvm_get_download_slug iojs source std "${VERSION}")";
            else
                SLUG_BINARY="$(nvm_get_download_slug node binary std "${VERSION}")";
                SLUG_SOURCE="$(nvm_get_download_slug node source std "${VERSION}")";
            fi;
            local NVM_SUCCESS_MSG;
            if nvm_is_iojs_version "${VERSION}"; then
                NVM_SUCCESS_MSG="Uninstalled io.js $(nvm_strip_iojs_prefix "${VERSION}")";
            else
                NVM_SUCCESS_MSG="Uninstalled node ${VERSION}";
            fi;
            local VERSION_PATH;
            VERSION_PATH="$(nvm_version_path "${VERSION}")";
            if ! nvm_check_file_permissions "${VERSION_PATH}"; then
                nvm_err 'Cannot uninstall, incorrect permissions on installation folder.';
                nvm_err 'This is usually caused by running `npm install -g` as root. Run the following commands as root to fix the permissions and then try again.';
                nvm_err;
                nvm_err "  chown -R $(whoami) \"$(nvm_sanitize_path "${VERSION_PATH}")\"";
                nvm_err "  chmod -R u+w \"$(nvm_sanitize_path "${VERSION_PATH}")\"";
                return 1;
            fi;
            local CACHE_DIR;
            CACHE_DIR="$(nvm_cache_dir)";
            command rm -rf "${CACHE_DIR}/bin/${SLUG_BINARY}/files" "${CACHE_DIR}/src/${SLUG_SOURCE}/files" "${VERSION_PATH}" 2> /dev/null;
            nvm_echo "${NVM_SUCCESS_MSG}";
            for ALIAS in $(nvm_grep -l "${VERSION}" "$(nvm_alias_path)/*" 2>/dev/null);
            do
                nvm unalias "$(command basename "${ALIAS}")";
            done
        ;;
        "deactivate")
            local NVM_SILENT;
            while [ $# -ne 0 ]; do
                case "${1}" in 
                    --silent)
                        NVM_SILENT=1
                    ;;
                    --)

                    ;;
                esac;
                shift;
            done;
            local NEWPATH;
            NEWPATH="$(nvm_strip_path "${PATH}" "/bin")";
            if [ "_${PATH}" = "_${NEWPATH}" ]; then
                if [ "${NVM_SILENT:-0}" -ne 1 ]; then
                    nvm_err "Could not find ${NVM_DIR}/*/bin in \${PATH}";
                fi;
            else
                export PATH="${NEWPATH}";
                hash -r;
                if [ "${NVM_SILENT:-0}" -ne 1 ]; then
                    nvm_echo "${NVM_DIR}/*/bin removed from \${PATH}";
                fi;
            fi;
            if [ -n "${MANPATH-}" ]; then
                NEWPATH="$(nvm_strip_path "${MANPATH}" "/share/man")";
                if [ "_${MANPATH}" = "_${NEWPATH}" ]; then
                    if [ "${NVM_SILENT:-0}" -ne 1 ]; then
                        nvm_err "Could not find ${NVM_DIR}/*/share/man in \${MANPATH}";
                    fi;
                else
                    export MANPATH="${NEWPATH}";
                    if [ "${NVM_SILENT:-0}" -ne 1 ]; then
                        nvm_echo "${NVM_DIR}/*/share/man removed from \${MANPATH}";
                    fi;
                fi;
            fi;
            if [ -n "${NODE_PATH-}" ]; then
                NEWPATH="$(nvm_strip_path "${NODE_PATH}" "/lib/node_modules")";
                if [ "_${NODE_PATH}" != "_${NEWPATH}" ]; then
                    export NODE_PATH="${NEWPATH}";
                    if [ "${NVM_SILENT:-0}" -ne 1 ]; then
                        nvm_echo "${NVM_DIR}/*/lib/node_modules removed from \${NODE_PATH}";
                    fi;
                fi;
            fi;
            unset NVM_BIN;
            unset NVM_INC
        ;;
        "use")
            local PROVIDED_VERSION;
            local NVM_SILENT;
            local NVM_SILENT_ARG;
            local NVM_DELETE_PREFIX;
            NVM_DELETE_PREFIX=0;
            local NVM_LTS;
            local IS_VERSION_FROM_NVMRC;
            IS_VERSION_FROM_NVMRC=0;
            while [ $# -ne 0 ]; do
                case "$1" in 
                    --silent)
                        NVM_SILENT=1;
                        NVM_SILENT_ARG='--silent'
                    ;;
                    --delete-prefix)
                        NVM_DELETE_PREFIX=1
                    ;;
                    --)

                    ;;
                    --lts)
                        NVM_LTS='*'
                    ;;
                    --lts=*)
                        NVM_LTS="${1##--lts=}"
                    ;;
                    --*)

                    ;;
                    *)
                        if [ -n "${1-}" ]; then
                            PROVIDED_VERSION="$1";
                        fi
                    ;;
                esac;
                shift;
            done;
            if [ -n "${NVM_LTS-}" ]; then
                VERSION="$(nvm_match_version "lts/${NVM_LTS:-*}")";
            else
                if [ -z "${PROVIDED_VERSION-}" ]; then
                    NVM_SILENT="${NVM_SILENT:-0}" nvm_rc_version;
                    if [ -n "${NVM_RC_VERSION-}" ]; then
                        PROVIDED_VERSION="${NVM_RC_VERSION}";
                        IS_VERSION_FROM_NVMRC=1;
                        VERSION="$(nvm_version "${PROVIDED_VERSION}")";
                    fi;
                    unset NVM_RC_VERSION;
                    if [ -z "${VERSION}" ]; then
                        nvm_err 'Please see `nvm --help` or https://github.com/nvm-sh/nvm#nvmrc for more information.';
                        return 127;
                    fi;
                else
                    VERSION="$(nvm_match_version "${PROVIDED_VERSION}")";
                fi;
            fi;
            if [ -z "${VERSION}" ]; then
                nvm --help 1>&2;
                return 127;
            fi;
            if [ "_${VERSION}" = '_system' ]; then
                if nvm_has_system_node && nvm deactivate "${NVM_SILENT_ARG-}" > /dev/null 2>&1; then
                    if [ "${NVM_SILENT:-0}" -ne 1 ]; then
                        nvm_echo "Now using system version of node: $(node -v 2>/dev/null)$(nvm_print_npm_version)";
                    fi;
                    return;
                else
                    if nvm_has_system_iojs && nvm deactivate "${NVM_SILENT_ARG-}" > /dev/null 2>&1; then
                        if [ "${NVM_SILENT:-0}" -ne 1 ]; then
                            nvm_echo "Now using system version of io.js: $(iojs --version 2>/dev/null)$(nvm_print_npm_version)";
                        fi;
                        return;
                    else
                        if [ "${NVM_SILENT:-0}" -ne 1 ]; then
                            nvm_err 'System version of node not found.';
                        fi;
                    fi;
                fi;
                return 127;
            else
                if [ "_${VERSION}" = "_∞" ]; then
                    if [ "${NVM_SILENT:-0}" -ne 1 ]; then
                        nvm_err "The alias \"${PROVIDED_VERSION}\" leads to an infinite loop. Aborting.";
                    fi;
                    return 8;
                fi;
            fi;
            if [ "${VERSION}" = 'N/A' ]; then
                if [ "${NVM_SILENT:-0}" -ne 1 ]; then
                    nvm_ensure_version_installed "${PROVIDED_VERSION}" "${IS_VERSION_FROM_NVMRC}";
                fi;
                return 3;
            else
                if ! nvm_ensure_version_installed "${VERSION}" "${IS_VERSION_FROM_NVMRC}"; then
                    return $?;
                fi;
            fi;
            local NVM_VERSION_DIR;
            NVM_VERSION_DIR="$(nvm_version_path "${VERSION}")";
            PATH="$(nvm_change_path "${PATH}" "/bin" "${NVM_VERSION_DIR}")";
            if nvm_has manpath; then
                if [ -z "${MANPATH-}" ]; then
                    local MANPATH;
                    MANPATH=$(manpath);
                fi;
                MANPATH="$(nvm_change_path "${MANPATH}" "/share/man" "${NVM_VERSION_DIR}")";
                export MANPATH;
            fi;
            export PATH;
            hash -r;
            export NVM_BIN="${NVM_VERSION_DIR}/bin";
            export NVM_INC="${NVM_VERSION_DIR}/include/node";
            if [ "${NVM_SYMLINK_CURRENT-}" = true ]; then
                command rm -f "${NVM_DIR}/current" && ln -s "${NVM_VERSION_DIR}" "${NVM_DIR}/current";
            fi;
            local NVM_USE_OUTPUT;
            NVM_USE_OUTPUT='';
            if [ "${NVM_SILENT:-0}" -ne 1 ]; then
                if nvm_is_iojs_version "${VERSION}"; then
                    NVM_USE_OUTPUT="Now using io.js $(nvm_strip_iojs_prefix "${VERSION}")$(nvm_print_npm_version)";
                else
                    NVM_USE_OUTPUT="Now using node ${VERSION}$(nvm_print_npm_version)";
                fi;
            fi;
            if [ "_${VERSION}" != "_system" ]; then
                local NVM_USE_CMD;
                NVM_USE_CMD="nvm use --delete-prefix";
                if [ -n "${PROVIDED_VERSION}" ]; then
                    NVM_USE_CMD="${NVM_USE_CMD} ${VERSION}";
                fi;
                if [ "${NVM_SILENT:-0}" -eq 1 ]; then
                    NVM_USE_CMD="${NVM_USE_CMD} --silent";
                fi;
                if ! nvm_die_on_prefix "${NVM_DELETE_PREFIX}" "${NVM_USE_CMD}" "${NVM_VERSION_DIR}"; then
                    return 11;
                fi;
            fi;
            if [ -n "${NVM_USE_OUTPUT-}" ] && [ "${NVM_SILENT:-0}" -ne 1 ]; then
                nvm_echo "${NVM_USE_OUTPUT}";
            fi
        ;;
        "run")
            local provided_version;
            local has_checked_nvmrc;
            has_checked_nvmrc=0;
            local IS_VERSION_FROM_NVMRC;
            IS_VERSION_FROM_NVMRC=0;
            local NVM_SILENT;
            local NVM_SILENT_ARG;
            local NVM_LTS;
            while [ $# -gt 0 ]; do
                case "$1" in 
                    --silent)
                        NVM_SILENT=1;
                        NVM_SILENT_ARG='--silent';
                        shift
                    ;;
                    --lts)
                        NVM_LTS='*';
                        shift
                    ;;
                    --lts=*)
                        NVM_LTS="${1##--lts=}";
                        shift
                    ;;
                    *)
                        if [ -n "$1" ]; then
                            break;
                        else
                            shift;
                        fi
                    ;;
                esac;
            done;
            if [ $# -lt 1 ] && [ -z "${NVM_LTS-}" ]; then
                NVM_SILENT="${NVM_SILENT:-0}" nvm_rc_version && has_checked_nvmrc=1;
                if [ -n "${NVM_RC_VERSION-}" ]; then
                    VERSION="$(nvm_version "${NVM_RC_VERSION-}")" || :;
                fi;
                unset NVM_RC_VERSION;
                if [ "${VERSION:-N/A}" = 'N/A' ]; then
                    nvm --help 1>&2;
                    return 127;
                fi;
            fi;
            if [ -z "${NVM_LTS-}" ]; then
                provided_version="$1";
                if [ -n "${provided_version}" ]; then
                    VERSION="$(nvm_version "${provided_version}")" || :;
                    if [ "_${VERSION:-N/A}" = '_N/A' ] && ! nvm_is_valid_version "${provided_version}"; then
                        provided_version='';
                        if [ $has_checked_nvmrc -ne 1 ]; then
                            NVM_SILENT="${NVM_SILENT:-0}" nvm_rc_version && has_checked_nvmrc=1;
                        fi;
                        provided_version="${NVM_RC_VERSION}";
                        IS_VERSION_FROM_NVMRC=1;
                        VERSION="$(nvm_version "${NVM_RC_VERSION}")" || :;
                        unset NVM_RC_VERSION;
                    else
                        shift;
                    fi;
                fi;
            fi;
            local NVM_IOJS;
            if nvm_is_iojs_version "${VERSION}"; then
                NVM_IOJS=true;
            fi;
            local EXIT_CODE;
            nvm_is_zsh && setopt local_options shwordsplit;
            local LTS_ARG;
            if [ -n "${NVM_LTS-}" ]; then
                LTS_ARG="--lts=${NVM_LTS-}";
                VERSION='';
            fi;
            if [ "_${VERSION}" = "_N/A" ]; then
                nvm_ensure_version_installed "${provided_version}" "${IS_VERSION_FROM_NVMRC}";
            else
                if [ "${NVM_IOJS}" = true ]; then
                    nvm exec "${NVM_SILENT_ARG-}" "${LTS_ARG-}" "${VERSION}" iojs "$@";
                else
                    nvm exec "${NVM_SILENT_ARG-}" "${LTS_ARG-}" "${VERSION}" node "$@";
                fi;
            fi;
            EXIT_CODE="$?";
            return $EXIT_CODE
        ;;
        "exec")
            local NVM_SILENT;
            local NVM_LTS;
            while [ $# -gt 0 ]; do
                case "$1" in 
                    --silent)
                        NVM_SILENT=1;
                        shift
                    ;;
                    --lts)
                        NVM_LTS='*';
                        shift
                    ;;
                    --lts=*)
                        NVM_LTS="${1##--lts=}";
                        shift
                    ;;
                    --)
                        break
                    ;;
                    --*)
                        nvm_err "Unsupported option \"$1\".";
                        return 55
                    ;;
                    *)
                        if [ -n "$1" ]; then
                            break;
                        else
                            shift;
                        fi
                    ;;
                esac;
            done;
            local provided_version;
            provided_version="$1";
            if [ "${NVM_LTS-}" != '' ]; then
                provided_version="lts/${NVM_LTS:-*}";
                VERSION="${provided_version}";
            else
                if [ -n "${provided_version}" ]; then
                    VERSION="$(nvm_version "${provided_version}")" || :;
                    if [ "_${VERSION}" = '_N/A' ] && ! nvm_is_valid_version "${provided_version}"; then
                        NVM_SILENT="${NVM_SILENT:-0}" nvm_rc_version && has_checked_nvmrc=1;
                        provided_version="${NVM_RC_VERSION}";
                        unset NVM_RC_VERSION;
                        VERSION="$(nvm_version "${provided_version}")" || :;
                    else
                        shift;
                    fi;
                fi;
            fi;
            nvm_ensure_version_installed "${provided_version}";
            EXIT_CODE=$?;
            if [ "${EXIT_CODE}" != "0" ]; then
                return $EXIT_CODE;
            fi;
            if [ "${NVM_SILENT:-0}" -ne 1 ]; then
                if [ "${NVM_LTS-}" = '*' ]; then
                    nvm_echo "Running node latest LTS -> $(nvm_version "${VERSION}")$(nvm use --silent "${VERSION}" && nvm_print_npm_version)";
                else
                    if [ -n "${NVM_LTS-}" ]; then
                        nvm_echo "Running node LTS \"${NVM_LTS-}\" -> $(nvm_version "${VERSION}")$(nvm use --silent "${VERSION}" && nvm_print_npm_version)";
                    else
                        if nvm_is_iojs_version "${VERSION}"; then
                            nvm_echo "Running io.js $(nvm_strip_iojs_prefix "${VERSION}")$(nvm use --silent "${VERSION}" && nvm_print_npm_version)";
                        else
                            nvm_echo "Running node ${VERSION}$(nvm use --silent "${VERSION}" && nvm_print_npm_version)";
                        fi;
                    fi;
                fi;
            fi;
            NODE_VERSION="${VERSION}" "${NVM_DIR}/nvm-exec" "$@"
        ;;
        "ls" | "list")
            local PATTERN;
            local NVM_NO_COLORS;
            local NVM_NO_ALIAS;
            while [ $# -gt 0 ]; do
                case "${1}" in 
                    --)

                    ;;
                    --no-colors)
                        NVM_NO_COLORS="${1}"
                    ;;
                    --no-alias)
                        NVM_NO_ALIAS="${1}"
                    ;;
                    --*)
                        nvm_err "Unsupported option \"${1}\".";
                        return 55
                    ;;
                    *)
                        PATTERN="${PATTERN:-$1}"
                    ;;
                esac;
                shift;
            done;
            if [ -n "${PATTERN-}" ] && [ -n "${NVM_NO_ALIAS-}" ]; then
                nvm_err '`--no-alias` is not supported when a pattern is provided.';
                return 55;
            fi;
            local NVM_LS_OUTPUT;
            local NVM_LS_EXIT_CODE;
            NVM_LS_OUTPUT=$(nvm_ls "${PATTERN-}");
            NVM_LS_EXIT_CODE=$?;
            NVM_NO_COLORS="${NVM_NO_COLORS-}" nvm_print_versions "${NVM_LS_OUTPUT}";
            if [ -z "${NVM_NO_ALIAS-}" ] && [ -z "${PATTERN-}" ]; then
                if [ -n "${NVM_NO_COLORS-}" ]; then
                    nvm alias --no-colors;
                else
                    nvm alias;
                fi;
            fi;
            return $NVM_LS_EXIT_CODE
        ;;
        "ls-remote" | "list-remote")
            local NVM_LTS;
            local PATTERN;
            local NVM_NO_COLORS;
            while [ $# -gt 0 ]; do
                case "${1-}" in 
                    --)

                    ;;
                    --lts)
                        NVM_LTS='*'
                    ;;
                    --lts=*)
                        NVM_LTS="${1##--lts=}"
                    ;;
                    --no-colors)
                        NVM_NO_COLORS="${1}"
                    ;;
                    --*)
                        nvm_err "Unsupported option \"${1}\".";
                        return 55
                    ;;
                    *)
                        if [ -z "${PATTERN-}" ]; then
                            PATTERN="${1-}";
                            if [ -z "${NVM_LTS-}" ]; then
                                case "${PATTERN}" in 
                                    'lts/*')
                                        NVM_LTS='*';
                                        PATTERN=''
                                    ;;
                                    lts/*)
                                        NVM_LTS="${PATTERN##lts/}";
                                        PATTERN=''
                                    ;;
                                esac;
                            fi;
                        fi
                    ;;
                esac;
                shift;
            done;
            local NVM_OUTPUT;
            local EXIT_CODE;
            NVM_OUTPUT="$(NVM_LTS="${NVM_LTS-}" nvm_remote_versions "${PATTERN}" &&:)";
            EXIT_CODE=$?;
            if [ -n "${NVM_OUTPUT}" ]; then
                NVM_NO_COLORS="${NVM_NO_COLORS-}" nvm_print_versions "${NVM_OUTPUT}";
                return $EXIT_CODE;
            fi;
            NVM_NO_COLORS="${NVM_NO_COLORS-}" nvm_print_versions "N/A";
            return 3
        ;;
        "current")
            nvm_version current
        ;;
        "which")
            local NVM_SILENT;
            local provided_version;
            while [ $# -ne 0 ]; do
                case "${1}" in 
                    --silent)
                        NVM_SILENT=1
                    ;;
                    --)

                    ;;
                    *)
                        provided_version="${1-}"
                    ;;
                esac;
                shift;
            done;
            if [ -z "${provided_version-}" ]; then
                NVM_SILENT="${NVM_SILENT:-0}" nvm_rc_version;
                if [ -n "${NVM_RC_VERSION}" ]; then
                    provided_version="${NVM_RC_VERSION}";
                    VERSION=$(nvm_version "${NVM_RC_VERSION}") || :;
                fi;
                unset NVM_RC_VERSION;
            else
                if [ "${provided_version}" != 'system' ]; then
                    VERSION="$(nvm_version "${provided_version}")" || :;
                else
                    VERSION="${provided_version-}";
                fi;
            fi;
            if [ -z "${VERSION}" ]; then
                nvm --help 1>&2;
                return 127;
            fi;
            if [ "_${VERSION}" = '_system' ]; then
                if nvm_has_system_iojs > /dev/null 2>&1 || nvm_has_system_node > /dev/null 2>&1; then
                    local NVM_BIN;
                    NVM_BIN="$(nvm use system >/dev/null 2>&1 && command which node)";
                    if [ -n "${NVM_BIN}" ]; then
                        nvm_echo "${NVM_BIN}";
                        return;
                    fi;
                    return 1;
                fi;
                nvm_err 'System version of node not found.';
                return 127;
            else
                if [ "${VERSION}" = '∞' ]; then
                    nvm_err "The alias \"${2}\" leads to an infinite loop. Aborting.";
                    return 8;
                fi;
            fi;
            nvm_ensure_version_installed "${provided_version}";
            EXIT_CODE=$?;
            if [ "${EXIT_CODE}" != "0" ]; then
                return $EXIT_CODE;
            fi;
            local NVM_VERSION_DIR;
            NVM_VERSION_DIR="$(nvm_version_path "${VERSION}")";
            nvm_echo "${NVM_VERSION_DIR}/bin/node"
        ;;
        "alias")
            local NVM_ALIAS_DIR;
            NVM_ALIAS_DIR="$(nvm_alias_path)";
            local NVM_CURRENT;
            NVM_CURRENT="$(nvm_ls_current)";
            command mkdir -p "${NVM_ALIAS_DIR}/lts";
            local ALIAS;
            local TARGET;
            local NVM_NO_COLORS;
            ALIAS='--';
            TARGET='--';
            while [ $# -gt 0 ]; do
                case "${1-}" in 
                    --)

                    ;;
                    --no-colors)
                        NVM_NO_COLORS="${1}"
                    ;;
                    --*)
                        nvm_err "Unsupported option \"${1}\".";
                        return 55
                    ;;
                    *)
                        if [ "${ALIAS}" = '--' ]; then
                            ALIAS="${1-}";
                        else
                            if [ "${TARGET}" = '--' ]; then
                                TARGET="${1-}";
                            fi;
                        fi
                    ;;
                esac;
                shift;
            done;
            if [ -z "${TARGET}" ]; then
                nvm unalias "${ALIAS}";
                return $?;
            else
                if [ "${TARGET}" != '--' ]; then
                    if [ "${ALIAS#*\/}" != "${ALIAS}" ]; then
                        nvm_err 'Aliases in subdirectories are not supported.';
                        return 1;
                    fi;
                    VERSION="$(nvm_version "${TARGET}")" || :;
                    if [ "${VERSION}" = 'N/A' ]; then
                        nvm_err "! WARNING: Version '${TARGET}' does not exist.";
                    fi;
                    nvm_make_alias "${ALIAS}" "${TARGET}";
                    NVM_NO_COLORS="${NVM_NO_COLORS-}" NVM_CURRENT="${NVM_CURRENT-}" DEFAULT=false nvm_print_formatted_alias "${ALIAS}" "${TARGET}" "${VERSION}";
                else
                    if [ "${ALIAS-}" = '--' ]; then
                        unset ALIAS;
                    fi;
                    nvm_list_aliases "${ALIAS-}";
                fi;
            fi
        ;;
        "unalias")
            local NVM_ALIAS_DIR;
            NVM_ALIAS_DIR="$(nvm_alias_path)";
            command mkdir -p "${NVM_ALIAS_DIR}";
            if [ $# -ne 1 ]; then
                nvm --help 1>&2;
                return 127;
            fi;
            if [ "${1#*\/}" != "${1-}" ]; then
                nvm_err 'Aliases in subdirectories are not supported.';
                return 1;
            fi;
            local NVM_IOJS_PREFIX;
            local NVM_NODE_PREFIX;
            NVM_IOJS_PREFIX="$(nvm_iojs_prefix)";
            NVM_NODE_PREFIX="$(nvm_node_prefix)";
            local NVM_ALIAS_EXISTS;
            NVM_ALIAS_EXISTS=0;
            if [ -f "${NVM_ALIAS_DIR}/${1-}" ]; then
                NVM_ALIAS_EXISTS=1;
            fi;
            if [ $NVM_ALIAS_EXISTS -eq 0 ]; then
                case "$1" in 
                    "stable" | "unstable" | "${NVM_IOJS_PREFIX}" | "${NVM_NODE_PREFIX}" | "system")
                        nvm_err "${1-} is a default (built-in) alias and cannot be deleted.";
                        return 1
                    ;;
                esac;
                nvm_err "Alias ${1-} doesn't exist!";
                return;
            fi;
            local NVM_ALIAS_ORIGINAL;
            NVM_ALIAS_ORIGINAL="$(nvm_alias "${1}")";
            command rm -f "${NVM_ALIAS_DIR}/${1}";
            nvm_echo "Deleted alias ${1} - restore it with \`nvm alias \"${1}\" \"${NVM_ALIAS_ORIGINAL}\"\`"
        ;;
        "install-latest-npm")
            if [ $# -ne 0 ]; then
                nvm --help 1>&2;
                return 127;
            fi;
            nvm_install_latest_npm
        ;;
        "reinstall-packages" | "copy-packages")
            if [ $# -ne 1 ]; then
                nvm --help 1>&2;
                return 127;
            fi;
            local PROVIDED_VERSION;
            PROVIDED_VERSION="${1-}";
            if [ "${PROVIDED_VERSION}" = "$(nvm_ls_current)" ] || [ "$(nvm_version "${PROVIDED_VERSION}" ||:)" = "$(nvm_ls_current)" ]; then
                nvm_err 'Can not reinstall packages from the current version of node.';
                return 2;
            fi;
            local VERSION;
            if [ "_${PROVIDED_VERSION}" = "_system" ]; then
                if ! nvm_has_system_node && ! nvm_has_system_iojs; then
                    nvm_err 'No system version of node or io.js detected.';
                    return 3;
                fi;
                VERSION="system";
            else
                VERSION="$(nvm_version "${PROVIDED_VERSION}")" || :;
            fi;
            local NPMLIST;
            NPMLIST="$(nvm_npm_global_modules "${VERSION}")";
            local INSTALLS;
            local LINKS;
            INSTALLS="${NPMLIST%% //// *}";
            LINKS="${NPMLIST##* //// }";
            nvm_echo "Reinstalling global packages from ${VERSION}...";
            if [ -n "${INSTALLS}" ]; then
                nvm_echo "${INSTALLS}" | command xargs npm install -g --quiet;
            else
                nvm_echo "No installed global packages found...";
            fi;
            nvm_echo "Linking global packages from ${VERSION}...";
            if [ -n "${LINKS}" ]; then
                ( set -f;
                IFS='
';
                for LINK in ${LINKS};
                do
                    set +f;
                    unset IFS;
                    if [ -n "${LINK}" ]; then
                        case "${LINK}" in 
                            '/'*)
                                ( nvm_cd "${LINK}" && npm link )
                            ;;
                            *)
                                ( nvm_cd "$(npm root -g)/../${LINK}" && npm link )
                            ;;
                        esac;
                    fi;
                done );
            else
                nvm_echo "No linked global packages found...";
            fi
        ;;
        "clear-cache")
            command rm -f "${NVM_DIR}/v*" "$(nvm_version_dir)" 2> /dev/null;
            nvm_echo 'nvm cache cleared.'
        ;;
        "version")
            nvm_version "${1}"
        ;;
        "version-remote")
            local NVM_LTS;
            local PATTERN;
            while [ $# -gt 0 ]; do
                case "${1-}" in 
                    --)

                    ;;
                    --lts)
                        NVM_LTS='*'
                    ;;
                    --lts=*)
                        NVM_LTS="${1##--lts=}"
                    ;;
                    --*)
                        nvm_err "Unsupported option \"${1}\".";
                        return 55
                    ;;
                    *)
                        PATTERN="${PATTERN:-${1}}"
                    ;;
                esac;
                shift;
            done;
            case "${PATTERN-}" in 
                'lts/*')
                    NVM_LTS='*';
                    unset PATTERN
                ;;
                lts/*)
                    NVM_LTS="${PATTERN##lts/}";
                    unset PATTERN
                ;;
            esac;
            NVM_VERSION_ONLY=true NVM_LTS="${NVM_LTS-}" nvm_remote_version "${PATTERN:-node}"
        ;;
        "--version" | "-v")
            nvm_echo '0.39.3'
        ;;
        "unload")
            nvm deactivate > /dev/null 2>&1;
            unset -f nvm nvm_iojs_prefix nvm_node_prefix nvm_add_iojs_prefix nvm_strip_iojs_prefix nvm_is_iojs_version nvm_is_alias nvm_has_non_aliased nvm_ls_remote nvm_ls_remote_iojs nvm_ls_remote_index_tab nvm_ls nvm_remote_version nvm_remote_versions nvm_install_binary nvm_install_source nvm_clang_version nvm_get_mirror nvm_get_download_slug nvm_download_artifact nvm_install_npm_if_needed nvm_use_if_needed nvm_check_file_permissions nvm_print_versions nvm_compute_checksum nvm_get_checksum_binary nvm_get_checksum_alg nvm_get_checksum nvm_compare_checksum nvm_version nvm_rc_version nvm_match_version nvm_ensure_default_set nvm_get_arch nvm_get_os nvm_print_implicit_alias nvm_validate_implicit_alias nvm_resolve_alias nvm_ls_current nvm_alias nvm_binary_available nvm_change_path nvm_strip_path nvm_num_version_groups nvm_format_version nvm_ensure_version_prefix nvm_normalize_version nvm_is_valid_version nvm_normalize_lts nvm_ensure_version_installed nvm_cache_dir nvm_version_path nvm_alias_path nvm_version_dir nvm_find_nvmrc nvm_find_up nvm_find_project_dir nvm_tree_contains_path nvm_version_greater nvm_version_greater_than_or_equal_to nvm_print_npm_version nvm_install_latest_npm nvm_npm_global_modules nvm_has_system_node nvm_has_system_iojs nvm_download nvm_get_latest nvm_has nvm_install_default_packages nvm_get_default_packages nvm_curl_use_compression nvm_curl_version nvm_auto nvm_supports_xz nvm_echo nvm_err nvm_grep nvm_cd nvm_die_on_prefix nvm_get_make_jobs nvm_get_minor_version nvm_has_solaris_binary nvm_is_merged_node_version nvm_is_natural_num nvm_is_version_installed nvm_list_aliases nvm_make_alias nvm_print_alias_path nvm_print_default_alias nvm_print_formatted_alias nvm_resolve_local_alias nvm_sanitize_path nvm_has_colors nvm_process_parameters nvm_node_version_has_solaris_binary nvm_iojs_version_has_solaris_binary nvm_curl_libz_support nvm_command_info nvm_is_zsh nvm_stdout_is_terminal nvm_npmrc_bad_news_bears nvm_get_colors nvm_set_colors nvm_print_color_code nvm_wrap_with_color_code nvm_format_help_message_colors nvm_echo_with_colors nvm_err_with_colors nvm_get_artifact_compression nvm_install_binary_extract nvm_extract_tarball > /dev/null 2>&1;
            unset NVM_RC_VERSION NVM_NODEJS_ORG_MIRROR NVM_IOJS_ORG_MIRROR NVM_DIR NVM_CD_FLAGS NVM_BIN NVM_INC NVM_MAKE_JOBS NVM_COLORS INSTALLED_COLOR SYSTEM_COLOR CURRENT_COLOR NOT_INSTALLED_COLOR DEFAULT_COLOR LTS_COLOR > /dev/null 2>&1
        ;;
        "set-colors")
            local EXIT_CODE;
            nvm_set_colors "${1-}";
            EXIT_CODE=$?;
            if [ "$EXIT_CODE" -eq 17 ]; then
                nvm --help 1>&2;
                nvm_echo;
                nvm_err_with_colors "\033[1;37mPlease pass in five \033[1;31mvalid color codes\033[1;37m. Choose from: rRgGbBcCyYmMkKeW\033[0m";
            fi
        ;;
        *)
            nvm --help 1>&2;
            return 127
        ;;
    esac
}
nvm_add_iojs_prefix () 
{ 
    nvm_echo "$(nvm_iojs_prefix)-$(nvm_ensure_version_prefix "$(nvm_strip_iojs_prefix "${1-}")")"
}
nvm_alias () 
{ 
    local ALIAS;
    ALIAS="${1-}";
    if [ -z "${ALIAS}" ]; then
        nvm_err 'An alias is required.';
        return 1;
    fi;
    ALIAS="$(nvm_normalize_lts "${ALIAS}")";
    if [ -z "${ALIAS}" ]; then
        return 2;
    fi;
    local NVM_ALIAS_PATH;
    NVM_ALIAS_PATH="$(nvm_alias_path)/${ALIAS}";
    if [ ! -f "${NVM_ALIAS_PATH}" ]; then
        nvm_err 'Alias does not exist.';
        return 2;
    fi;
    command cat "${NVM_ALIAS_PATH}"
}
nvm_alias_path () 
{ 
    nvm_echo "$(nvm_version_dir old)/alias"
}
nvm_auto () 
{ 
    local NVM_MODE;
    NVM_MODE="${1-}";
    local VERSION;
    local NVM_CURRENT;
    if [ "_${NVM_MODE}" = '_install' ]; then
        VERSION="$(nvm_alias default 2>/dev/null || nvm_echo)";
        if [ -n "${VERSION}" ]; then
            nvm install "${VERSION}" > /dev/null;
        else
            if nvm_rc_version > /dev/null 2>&1; then
                nvm install > /dev/null;
            fi;
        fi;
    else
        if [ "_$NVM_MODE" = '_use' ]; then
            NVM_CURRENT="$(nvm_ls_current)";
            if [ "_${NVM_CURRENT}" = '_none' ] || [ "_${NVM_CURRENT}" = '_system' ]; then
                VERSION="$(nvm_resolve_local_alias default 2>/dev/null || nvm_echo)";
                if [ -n "${VERSION}" ]; then
                    nvm use --silent "${VERSION}" > /dev/null;
                else
                    if nvm_rc_version > /dev/null 2>&1; then
                        nvm use --silent > /dev/null;
                    fi;
                fi;
            else
                nvm use --silent "${NVM_CURRENT}" > /dev/null;
            fi;
        else
            if [ "_${NVM_MODE}" != '_none' ]; then
                nvm_err 'Invalid auto mode supplied.';
                return 1;
            fi;
        fi;
    fi
}
nvm_binary_available () 
{ 
    nvm_version_greater_than_or_equal_to "$(nvm_strip_iojs_prefix "${1-}")" v0.8.6
}
nvm_cache_dir () 
{ 
    nvm_echo "${NVM_DIR}/.cache"
}
nvm_cd () 
{ 
    \cd "$@"
}
nvm_change_path () 
{ 
    if [ -z "${1-}" ]; then
        nvm_echo "${3-}${2-}";
    else
        if ! nvm_echo "${1-}" | nvm_grep -q "${NVM_DIR}/[^/]*${2-}" && ! nvm_echo "${1-}" | nvm_grep -q "${NVM_DIR}/versions/[^/]*/[^/]*${2-}"; then
            nvm_echo "${3-}${2-}:${1-}";
        else
            if nvm_echo "${1-}" | nvm_grep -Eq "(^|:)(/usr(/local)?)?${2-}:.*${NVM_DIR}/[^/]*${2-}" || nvm_echo "${1-}" | nvm_grep -Eq "(^|:)(/usr(/local)?)?${2-}:.*${NVM_DIR}/versions/[^/]*/[^/]*${2-}"; then
                nvm_echo "${3-}${2-}:${1-}";
            else
                nvm_echo "${1-}" | command sed -e "s#${NVM_DIR}/[^/]*${2-}[^:]*#${3-}${2-}#" -e "s#${NVM_DIR}/versions/[^/]*/[^/]*${2-}[^:]*#${3-}${2-}#";
            fi;
        fi;
    fi
}
nvm_check_file_permissions () 
{ 
    nvm_is_zsh && setopt local_options nonomatch;
    for FILE in "$1"/* "$1"/.[!.]* "$1"/..?*;
    do
        if [ -d "$FILE" ]; then
            if [ -n "${NVM_DEBUG-}" ]; then
                nvm_err "${FILE}";
            fi;
            if ! nvm_check_file_permissions "${FILE}"; then
                return 2;
            fi;
        else
            if [ -e "$FILE" ] && [ ! -w "$FILE" ] && [ ! -O "$FILE" ]; then
                nvm_err "file is not writable or self-owned: $(nvm_sanitize_path "$FILE")";
                return 1;
            fi;
        fi;
    done;
    return 0
}
nvm_clang_version () 
{ 
    clang --version | command awk '{ if ($2 == "version") print $3; else if ($3 == "version") print $4 }' | command sed 's/-.*$//g'
}
nvm_command_info () 
{ 
    local COMMAND;
    local INFO;
    COMMAND="${1}";
    if type "${COMMAND}" | nvm_grep -q hashed; then
        INFO="$(type "${COMMAND}" | command sed -E 's/\(|\)//g' | command awk '{print $4}')";
    else
        if type "${COMMAND}" | nvm_grep -q aliased; then
            INFO="$(which "${COMMAND}") ($(type "${COMMAND}" | command awk '{ $1=$2=$3=$4="" ;print }' | command sed -e 's/^\ *//g' -Ee "s/\`|'//g"))";
        else
            if type "${COMMAND}" | nvm_grep -q "^${COMMAND} is an alias for"; then
                INFO="$(which "${COMMAND}") ($(type "${COMMAND}" | command awk '{ $1=$2=$3=$4=$5="" ;print }' | command sed 's/^\ *//g'))";
            else
                if type "${COMMAND}" | nvm_grep -q "^${COMMAND} is /"; then
                    INFO="$(type "${COMMAND}" | command awk '{print $3}')";
                else
                    INFO="$(type "${COMMAND}")";
                fi;
            fi;
        fi;
    fi;
    nvm_echo "${INFO}"
}
nvm_compare_checksum () 
{ 
    local FILE;
    FILE="${1-}";
    if [ -z "${FILE}" ]; then
        nvm_err 'Provided file to checksum is empty.';
        return 4;
    else
        if ! [ -f "${FILE}" ]; then
            nvm_err 'Provided file to checksum does not exist.';
            return 3;
        fi;
    fi;
    local COMPUTED_SUM;
    COMPUTED_SUM="$(nvm_compute_checksum "${FILE}")";
    local CHECKSUM;
    CHECKSUM="${2-}";
    if [ -z "${CHECKSUM}" ]; then
        nvm_err 'Provided checksum to compare to is empty.';
        return 2;
    fi;
    if [ -z "${COMPUTED_SUM}" ]; then
        nvm_err "Computed checksum of '${FILE}' is empty.";
        nvm_err 'WARNING: Continuing *without checksum verification*';
        return;
    else
        if [ "${COMPUTED_SUM}" != "${CHECKSUM}" ]; then
            nvm_err "Checksums do not match: '${COMPUTED_SUM}' found, '${CHECKSUM}' expected.";
            return 1;
        fi;
    fi;
    nvm_err 'Checksums matched!'
}
nvm_compute_checksum () 
{ 
    local FILE;
    FILE="${1-}";
    if [ -z "${FILE}" ]; then
        nvm_err 'Provided file to checksum is empty.';
        return 2;
    else
        if ! [ -f "${FILE}" ]; then
            nvm_err 'Provided file to checksum does not exist.';
            return 1;
        fi;
    fi;
    if nvm_has_non_aliased "sha256sum"; then
        nvm_err 'Computing checksum with sha256sum';
        command sha256sum "${FILE}" | command awk '{print $1}';
    else
        if nvm_has_non_aliased "shasum"; then
            nvm_err 'Computing checksum with shasum -a 256';
            command shasum -a 256 "${FILE}" | command awk '{print $1}';
        else
            if nvm_has_non_aliased "sha256"; then
                nvm_err 'Computing checksum with sha256 -q';
                command sha256 -q "${FILE}" | command awk '{print $1}';
            else
                if nvm_has_non_aliased "gsha256sum"; then
                    nvm_err 'Computing checksum with gsha256sum';
                    command gsha256sum "${FILE}" | command awk '{print $1}';
                else
                    if nvm_has_non_aliased "openssl"; then
                        nvm_err 'Computing checksum with openssl dgst -sha256';
                        command openssl dgst -sha256 "${FILE}" | command awk '{print $NF}';
                    else
                        if nvm_has_non_aliased "bssl"; then
                            nvm_err 'Computing checksum with bssl sha256sum';
                            command bssl sha256sum "${FILE}" | command awk '{print $1}';
                        else
                            if nvm_has_non_aliased "sha1sum"; then
                                nvm_err 'Computing checksum with sha1sum';
                                command sha1sum "${FILE}" | command awk '{print $1}';
                            else
                                if nvm_has_non_aliased "sha1"; then
                                    nvm_err 'Computing checksum with sha1 -q';
                                    command sha1 -q "${FILE}";
                                fi;
                            fi;
                        fi;
                    fi;
                fi;
            fi;
        fi;
    fi
}
nvm_curl_libz_support () 
{ 
    curl -V 2> /dev/null | nvm_grep "^Features:" | nvm_grep -q "libz"
}
nvm_curl_use_compression () 
{ 
    nvm_curl_libz_support && nvm_version_greater_than_or_equal_to "$(nvm_curl_version)" 7.21.0
}
nvm_curl_version () 
{ 
    curl -V | command awk '{ if ($1 == "curl") print $2 }' | command sed 's/-.*$//g'
}
nvm_die_on_prefix () 
{ 
    local NVM_DELETE_PREFIX;
    NVM_DELETE_PREFIX="${1-}";
    case "${NVM_DELETE_PREFIX}" in 
        0 | 1)

        ;;
        *)
            nvm_err 'First argument "delete the prefix" must be zero or one';
            return 1
        ;;
    esac;
    local NVM_COMMAND;
    NVM_COMMAND="${2-}";
    local NVM_VERSION_DIR;
    NVM_VERSION_DIR="${3-}";
    if [ -z "${NVM_COMMAND}" ] || [ -z "${NVM_VERSION_DIR}" ]; then
        nvm_err 'Second argument "nvm command", and third argument "nvm version dir", must both be nonempty';
        return 2;
    fi;
    if [ -n "${PREFIX-}" ] && [ "$(nvm_version_path "$(node -v)")" != "${PREFIX}" ]; then
        nvm deactivate > /dev/null 2>&1;
        nvm_err "nvm is not compatible with the \"PREFIX\" environment variable: currently set to \"${PREFIX}\"";
        nvm_err 'Run `unset PREFIX` to unset it.';
        return 3;
    fi;
    local NVM_OS;
    NVM_OS="$(nvm_get_os)";
    local NVM_NPM_CONFIG_x_PREFIX_ENV;
    NVM_NPM_CONFIG_x_PREFIX_ENV="$(command awk 'BEGIN { for (name in ENVIRON) if (toupper(name) == "NPM_CONFIG_PREFIX") { print name; break } }')";
    if [ -n "${NVM_NPM_CONFIG_x_PREFIX_ENV-}" ]; then
        local NVM_CONFIG_VALUE;
        eval "NVM_CONFIG_VALUE=\"\$${NVM_NPM_CONFIG_x_PREFIX_ENV}\"";
        if [ -n "${NVM_CONFIG_VALUE-}" ] && [ "_${NVM_OS}" = "_win" ]; then
            NVM_CONFIG_VALUE="$(cd "$NVM_CONFIG_VALUE" 2>/dev/null && pwd)";
        fi;
        if [ -n "${NVM_CONFIG_VALUE-}" ] && ! nvm_tree_contains_path "${NVM_DIR}" "${NVM_CONFIG_VALUE}"; then
            nvm deactivate > /dev/null 2>&1;
            nvm_err "nvm is not compatible with the \"${NVM_NPM_CONFIG_x_PREFIX_ENV}\" environment variable: currently set to \"${NVM_CONFIG_VALUE}\"";
            nvm_err "Run \`unset ${NVM_NPM_CONFIG_x_PREFIX_ENV}\` to unset it.";
            return 4;
        fi;
    fi;
    local NVM_NPM_BUILTIN_NPMRC;
    NVM_NPM_BUILTIN_NPMRC="${NVM_VERSION_DIR}/lib/node_modules/npm/npmrc";
    if nvm_npmrc_bad_news_bears "${NVM_NPM_BUILTIN_NPMRC}"; then
        if [ "_${NVM_DELETE_PREFIX}" = "_1" ]; then
            npm config --loglevel=warn delete prefix --userconfig="${NVM_NPM_BUILTIN_NPMRC}";
            npm config --loglevel=warn delete globalconfig --userconfig="${NVM_NPM_BUILTIN_NPMRC}";
        else
            nvm_err "Your builtin npmrc file ($(nvm_sanitize_path "${NVM_NPM_BUILTIN_NPMRC}"))";
            nvm_err 'has a `globalconfig` and/or a `prefix` setting, which are incompatible with nvm.';
            nvm_err "Run \`${NVM_COMMAND}\` to unset it.";
            return 10;
        fi;
    fi;
    local NVM_NPM_GLOBAL_NPMRC;
    NVM_NPM_GLOBAL_NPMRC="${NVM_VERSION_DIR}/etc/npmrc";
    if nvm_npmrc_bad_news_bears "${NVM_NPM_GLOBAL_NPMRC}"; then
        if [ "_${NVM_DELETE_PREFIX}" = "_1" ]; then
            npm config --global --loglevel=warn delete prefix;
            npm config --global --loglevel=warn delete globalconfig;
        else
            nvm_err "Your global npmrc file ($(nvm_sanitize_path "${NVM_NPM_GLOBAL_NPMRC}"))";
            nvm_err 'has a `globalconfig` and/or a `prefix` setting, which are incompatible with nvm.';
            nvm_err "Run \`${NVM_COMMAND}\` to unset it.";
            return 10;
        fi;
    fi;
    local NVM_NPM_USER_NPMRC;
    NVM_NPM_USER_NPMRC="${HOME}/.npmrc";
    if nvm_npmrc_bad_news_bears "${NVM_NPM_USER_NPMRC}"; then
        if [ "_${NVM_DELETE_PREFIX}" = "_1" ]; then
            npm config --loglevel=warn delete prefix --userconfig="${NVM_NPM_USER_NPMRC}";
            npm config --loglevel=warn delete globalconfig --userconfig="${NVM_NPM_USER_NPMRC}";
        else
            nvm_err "Your user’s .npmrc file ($(nvm_sanitize_path "${NVM_NPM_USER_NPMRC}"))";
            nvm_err 'has a `globalconfig` and/or a `prefix` setting, which are incompatible with nvm.';
            nvm_err "Run \`${NVM_COMMAND}\` to unset it.";
            return 10;
        fi;
    fi;
    local NVM_NPM_PROJECT_NPMRC;
    NVM_NPM_PROJECT_NPMRC="$(nvm_find_project_dir)/.npmrc";
    if nvm_npmrc_bad_news_bears "${NVM_NPM_PROJECT_NPMRC}"; then
        if [ "_${NVM_DELETE_PREFIX}" = "_1" ]; then
            npm config --loglevel=warn delete prefix;
            npm config --loglevel=warn delete globalconfig;
        else
            nvm_err "Your project npmrc file ($(nvm_sanitize_path "${NVM_NPM_PROJECT_NPMRC}"))";
            nvm_err 'has a `globalconfig` and/or a `prefix` setting, which are incompatible with nvm.';
            nvm_err "Run \`${NVM_COMMAND}\` to unset it.";
            return 10;
        fi;
    fi
}
nvm_download () 
{ 
    local CURL_COMPRESSED_FLAG;
    if nvm_has "curl"; then
        if nvm_curl_use_compression; then
            CURL_COMPRESSED_FLAG="--compressed";
        fi;
        curl --fail ${CURL_COMPRESSED_FLAG:-} -q "$@";
    else
        if nvm_has "wget"; then
            ARGS=$(nvm_echo "$@" | command sed -e 's/--progress-bar /--progress=bar /'                             -e 's/--compressed //'                             -e 's/--fail //'                             -e 's/-L //'                             -e 's/-I /--server-response /'                             -e 's/-s /-q /'                             -e 's/-sS /-nv /'                             -e 's/-o /-O /'                             -e 's/-C - /-c /');
            eval wget $ARGS;
        fi;
    fi
}
nvm_download_artifact () 
{ 
    local FLAVOR;
    case "${1-}" in 
        node | iojs)
            FLAVOR="${1}"
        ;;
        *)
            nvm_err 'supported flavors: node, iojs';
            return 1
        ;;
    esac;
    local KIND;
    case "${2-}" in 
        binary | source)
            KIND="${2}"
        ;;
        *)
            nvm_err 'supported kinds: binary, source';
            return 1
        ;;
    esac;
    local TYPE;
    TYPE="${3-}";
    local MIRROR;
    MIRROR="$(nvm_get_mirror "${FLAVOR}" "${TYPE}")";
    if [ -z "${MIRROR}" ]; then
        return 2;
    fi;
    local VERSION;
    VERSION="${4}";
    if [ -z "${VERSION}" ]; then
        nvm_err 'A version number is required.';
        return 3;
    fi;
    if [ "${KIND}" = 'binary' ] && ! nvm_binary_available "${VERSION}"; then
        nvm_err "No precompiled binary available for ${VERSION}.";
        return;
    fi;
    local SLUG;
    SLUG="$(nvm_get_download_slug "${FLAVOR}" "${KIND}" "${VERSION}")";
    local COMPRESSION;
    COMPRESSION="$(nvm_get_artifact_compression "${VERSION}")";
    local CHECKSUM;
    CHECKSUM="$(nvm_get_checksum "${FLAVOR}" "${TYPE}" "${VERSION}" "${SLUG}" "${COMPRESSION}")";
    local tmpdir;
    if [ "${KIND}" = 'binary' ]; then
        tmpdir="$(nvm_cache_dir)/bin/${SLUG}";
    else
        tmpdir="$(nvm_cache_dir)/src/${SLUG}";
    fi;
    command mkdir -p "${tmpdir}/files" || ( nvm_err "creating directory ${tmpdir}/files failed";
    return 3 );
    local TARBALL;
    TARBALL="${tmpdir}/${SLUG}.${COMPRESSION}";
    local TARBALL_URL;
    if nvm_version_greater_than_or_equal_to "${VERSION}" 0.1.14; then
        TARBALL_URL="${MIRROR}/${VERSION}/${SLUG}.${COMPRESSION}";
    else
        TARBALL_URL="${MIRROR}/${SLUG}.${COMPRESSION}";
    fi;
    if [ -r "${TARBALL}" ]; then
        nvm_err "Local cache found: $(nvm_sanitize_path "${TARBALL}")";
        if nvm_compare_checksum "${TARBALL}" "${CHECKSUM}" > /dev/null 2>&1; then
            nvm_err "Checksums match! Using existing downloaded archive $(nvm_sanitize_path "${TARBALL}")";
            nvm_echo "${TARBALL}";
            return 0;
        fi;
        nvm_compare_checksum "${TARBALL}" "${CHECKSUM}";
        nvm_err "Checksum check failed!";
        nvm_err "Removing the broken local cache...";
        command rm -rf "${TARBALL}";
    fi;
    nvm_err "Downloading ${TARBALL_URL}...";
    nvm_download -L -C - "${PROGRESS_BAR}" "${TARBALL_URL}" -o "${TARBALL}" || ( command rm -rf "${TARBALL}" "${tmpdir}";
    nvm_err "Binary download from ${TARBALL_URL} failed, trying source.";
    return 4 );
    if nvm_grep '404 Not Found' "${TARBALL}" > /dev/null; then
        command rm -rf "${TARBALL}" "${tmpdir}";
        nvm_err "HTTP 404 at URL ${TARBALL_URL}";
        return 5;
    fi;
    nvm_compare_checksum "${TARBALL}" "${CHECKSUM}" || ( command rm -rf "${tmpdir}/files";
    return 6 );
    nvm_echo "${TARBALL}"
}
nvm_echo () 
{ 
    command printf %s\\n "$*" 2> /dev/null
}
nvm_echo_with_colors () 
{ 
    command printf %b\\n "$*" 2> /dev/null
}
nvm_ensure_default_set () 
{ 
    local VERSION;
    VERSION="$1";
    if [ -z "${VERSION}" ]; then
        nvm_err 'nvm_ensure_default_set: a version is required';
        return 1;
    else
        if nvm_alias default > /dev/null 2>&1; then
            return 0;
        fi;
    fi;
    local OUTPUT;
    OUTPUT="$(nvm alias default "${VERSION}")";
    local EXIT_CODE;
    EXIT_CODE="$?";
    nvm_echo "Creating default alias: ${OUTPUT}";
    return $EXIT_CODE
}
nvm_ensure_version_installed () 
{ 
    local PROVIDED_VERSION;
    PROVIDED_VERSION="${1-}";
    local IS_VERSION_FROM_NVMRC;
    IS_VERSION_FROM_NVMRC="${2-}";
    if [ "${PROVIDED_VERSION}" = 'system' ]; then
        if nvm_has_system_iojs || nvm_has_system_node; then
            return 0;
        fi;
        nvm_err "N/A: no system version of node/io.js is installed.";
        return 1;
    fi;
    local LOCAL_VERSION;
    local EXIT_CODE;
    LOCAL_VERSION="$(nvm_version "${PROVIDED_VERSION}")";
    EXIT_CODE="$?";
    local NVM_VERSION_DIR;
    if [ "${EXIT_CODE}" != "0" ] || ! nvm_is_version_installed "${LOCAL_VERSION}"; then
        if VERSION="$(nvm_resolve_alias "${PROVIDED_VERSION}")"; then
            nvm_err "N/A: version \"${PROVIDED_VERSION} -> ${VERSION}\" is not yet installed.";
        else
            local PREFIXED_VERSION;
            PREFIXED_VERSION="$(nvm_ensure_version_prefix "${PROVIDED_VERSION}")";
            nvm_err "N/A: version \"${PREFIXED_VERSION:-$PROVIDED_VERSION}\" is not yet installed.";
        fi;
        nvm_err "";
        if [ "${IS_VERSION_FROM_NVMRC}" != '1' ]; then
            nvm_err "You need to run \`nvm install ${PROVIDED_VERSION}\` to install and use it.";
        else
            nvm_err 'You need to run `nvm install` to install and use the node version specified in `.nvmrc`.';
        fi;
        return 1;
    fi
}
nvm_ensure_version_prefix () 
{ 
    local NVM_VERSION;
    NVM_VERSION="$(nvm_strip_iojs_prefix "${1-}" | command sed -e 's/^\([0-9]\)/v\1/g')";
    if nvm_is_iojs_version "${1-}"; then
        nvm_add_iojs_prefix "${NVM_VERSION}";
    else
        nvm_echo "${NVM_VERSION}";
    fi
}
nvm_err () 
{ 
    nvm_echo "$@" 1>&2
}
nvm_err_with_colors () 
{ 
    nvm_echo_with_colors "$@" 1>&2
}
nvm_extract_tarball () 
{ 
    if [ "$#" -ne 4 ]; then
        nvm_err 'nvm_extract_tarball requires exactly 4 arguments';
        return 5;
    fi;
    local NVM_OS;
    NVM_OS="${1-}";
    local VERSION;
    VERSION="${2-}";
    local TARBALL;
    TARBALL="${3-}";
    local TMPDIR;
    TMPDIR="${4-}";
    local tar_compression_flag;
    tar_compression_flag='z';
    if nvm_supports_xz "${VERSION}"; then
        tar_compression_flag='J';
    fi;
    local tar;
    tar='tar';
    if [ "${NVM_OS}" = 'aix' ]; then
        tar='gtar';
    fi;
    if [ "${NVM_OS}" = 'openbsd' ]; then
        if [ "${tar_compression_flag}" = 'J' ]; then
            command xzcat "${TARBALL}" | "${tar}" -xf - -C "${TMPDIR}" -s '/[^\/]*\///' || return 1;
        else
            command "${tar}" -x${tar_compression_flag}f "${TARBALL}" -C "${TMPDIR}" -s '/[^\/]*\///' || return 1;
        fi;
    else
        command "${tar}" -x${tar_compression_flag}f "${TARBALL}" -C "${TMPDIR}" --strip-components 1 || return 1;
    fi
}
nvm_find_nvmrc () 
{ 
    local dir;
    dir="$(nvm_find_up '.nvmrc')";
    if [ -e "${dir}/.nvmrc" ]; then
        nvm_echo "${dir}/.nvmrc";
    fi
}
nvm_find_project_dir () 
{ 
    local path_;
    path_="${PWD}";
    while [ "${path_}" != "" ] && [ ! -f "${path_}/package.json" ] && [ ! -d "${path_}/node_modules" ]; do
        path_=${path_%/*};
    done;
    nvm_echo "${path_}"
}
nvm_find_up () 
{ 
    local path_;
    path_="${PWD}";
    while [ "${path_}" != "" ] && [ ! -f "${path_}/${1-}" ]; do
        path_=${path_%/*};
    done;
    nvm_echo "${path_}"
}
nvm_format_version () 
{ 
    local VERSION;
    VERSION="$(nvm_ensure_version_prefix "${1-}")";
    local NUM_GROUPS;
    NUM_GROUPS="$(nvm_num_version_groups "${VERSION}")";
    if [ "${NUM_GROUPS}" -lt 3 ]; then
        nvm_format_version "${VERSION%.}.0";
    else
        nvm_echo "${VERSION}" | command cut -f1-3 -d.;
    fi
}
nvm_get_arch () 
{ 
    local HOST_ARCH;
    local NVM_OS;
    local EXIT_CODE;
    NVM_OS="$(nvm_get_os)";
    if [ "_${NVM_OS}" = "_sunos" ]; then
        if HOST_ARCH=$(pkg_info -Q MACHINE_ARCH pkg_install); then
            HOST_ARCH=$(nvm_echo "${HOST_ARCH}" | command tail -1);
        else
            HOST_ARCH=$(isainfo -n);
        fi;
    else
        if [ "_${NVM_OS}" = "_aix" ]; then
            HOST_ARCH=ppc64;
        else
            HOST_ARCH="$(command uname -m)";
        fi;
    fi;
    local NVM_ARCH;
    case "${HOST_ARCH}" in 
        x86_64 | amd64)
            NVM_ARCH="x64"
        ;;
        i*86)
            NVM_ARCH="x86"
        ;;
        aarch64)
            NVM_ARCH="arm64"
        ;;
        *)
            NVM_ARCH="${HOST_ARCH}"
        ;;
    esac;
    local L;
    if [ "$(uname)" = "Linux" ] && [ "${NVM_ARCH}" = arm64 ] && L="$(command ls -dl /sbin/init 2>/dev/null)" && [ "$(od -An -t x1 -j 4 -N 1 "${L#*-> }")" = ' 01' ]; then
        NVM_ARCH=armv7l;
        HOST_ARCH=armv7l;
    fi;
    nvm_echo "${NVM_ARCH}"
}
nvm_get_artifact_compression () 
{ 
    local VERSION;
    VERSION="${1-}";
    local NVM_OS;
    NVM_OS="$(nvm_get_os)";
    local COMPRESSION;
    COMPRESSION='tar.gz';
    if [ "_${NVM_OS}" = '_win' ]; then
        COMPRESSION='zip';
    else
        if nvm_supports_xz "${VERSION}"; then
            COMPRESSION='tar.xz';
        fi;
    fi;
    nvm_echo "${COMPRESSION}"
}
nvm_get_checksum () 
{ 
    local FLAVOR;
    case "${1-}" in 
        node | iojs)
            FLAVOR="${1}"
        ;;
        *)
            nvm_err 'supported flavors: node, iojs';
            return 2
        ;;
    esac;
    local MIRROR;
    MIRROR="$(nvm_get_mirror "${FLAVOR}" "${2-}")";
    if [ -z "${MIRROR}" ]; then
        return 1;
    fi;
    local SHASUMS_URL;
    if [ "$(nvm_get_checksum_alg)" = 'sha-256' ]; then
        SHASUMS_URL="${MIRROR}/${3}/SHASUMS256.txt";
    else
        SHASUMS_URL="${MIRROR}/${3}/SHASUMS.txt";
    fi;
    nvm_download -L -s "${SHASUMS_URL}" -o - | command awk "{ if (\"${4}.${5}\" == \$2) print \$1}"
}
nvm_get_checksum_alg () 
{ 
    local NVM_CHECKSUM_BIN;
    NVM_CHECKSUM_BIN="$(nvm_get_checksum_binary 2>/dev/null)";
    case "${NVM_CHECKSUM_BIN-}" in 
        sha256sum | shasum | sha256 | gsha256sum | openssl | bssl)
            nvm_echo 'sha-256'
        ;;
        sha1sum | sha1)
            nvm_echo 'sha-1'
        ;;
        *)
            nvm_get_checksum_binary;
            return $?
        ;;
    esac
}
nvm_get_checksum_binary () 
{ 
    if nvm_has_non_aliased 'sha256sum'; then
        nvm_echo 'sha256sum';
    else
        if nvm_has_non_aliased 'shasum'; then
            nvm_echo 'shasum';
        else
            if nvm_has_non_aliased 'sha256'; then
                nvm_echo 'sha256';
            else
                if nvm_has_non_aliased 'gsha256sum'; then
                    nvm_echo 'gsha256sum';
                else
                    if nvm_has_non_aliased 'openssl'; then
                        nvm_echo 'openssl';
                    else
                        if nvm_has_non_aliased 'bssl'; then
                            nvm_echo 'bssl';
                        else
                            if nvm_has_non_aliased 'sha1sum'; then
                                nvm_echo 'sha1sum';
                            else
                                if nvm_has_non_aliased 'sha1'; then
                                    nvm_echo 'sha1';
                                else
                                    nvm_err 'Unaliased sha256sum, shasum, sha256, gsha256sum, openssl, or bssl not found.';
                                    nvm_err 'Unaliased sha1sum or sha1 not found.';
                                    return 1;
                                fi;
                            fi;
                        fi;
                    fi;
                fi;
            fi;
        fi;
    fi
}
nvm_get_colors () 
{ 
    local COLOR;
    local SYS_COLOR;
    local COLORS;
    COLORS="${NVM_COLORS:-bygre}";
    case $1 in 
        1)
            COLOR=$(nvm_print_color_code "$(echo "$COLORS" | awk '{ print substr($0, 1, 1); }')")
        ;;
        2)
            COLOR=$(nvm_print_color_code "$(echo "$COLORS" | awk '{ print substr($0, 2, 1); }')")
        ;;
        3)
            COLOR=$(nvm_print_color_code "$(echo "$COLORS" | awk '{ print substr($0, 3, 1); }')")
        ;;
        4)
            COLOR=$(nvm_print_color_code "$(echo "$COLORS" | awk '{ print substr($0, 4, 1); }')")
        ;;
        5)
            COLOR=$(nvm_print_color_code "$(echo "$COLORS" | awk '{ print substr($0, 5, 1); }')")
        ;;
        6)
            SYS_COLOR=$(nvm_print_color_code "$(echo "$COLORS" | awk '{ print substr($0, 2, 1); }')");
            COLOR=$(nvm_echo "$SYS_COLOR" | command tr '0;' '1;')
        ;;
        *)
            nvm_err "Invalid color index, ${1-}";
            return 1
        ;;
    esac;
    nvm_echo "$COLOR"
}
nvm_get_default_packages () 
{ 
    local NVM_DEFAULT_PACKAGE_FILE="${NVM_DIR}/default-packages";
    if [ -f "${NVM_DEFAULT_PACKAGE_FILE}" ]; then
        local DEFAULT_PACKAGES;
        DEFAULT_PACKAGES='';
        local line;
        WORK=$(mktemp -d) || exit $?;
        trap "command rm -rf '$WORK'" EXIT;
        sed -e '$a\' "${NVM_DEFAULT_PACKAGE_FILE}" > "${WORK}/default-packages";
        while IFS=' ' read -r line; do
            [ -n "${line-}" ] || continue;
            [ "$(nvm_echo "${line}" | command cut -c1)" != "#" ] || continue;
            case $line in 
                *\ *)
                    nvm_err "Only one package per line is allowed in the ${NVM_DIR}/default-packages file. Please remove any lines with multiple space-separated values.";
                    return 1
                ;;
            esac;
            DEFAULT_PACKAGES="${DEFAULT_PACKAGES}${line} ";
        done < "${WORK}/default-packages";
        echo "${DEFAULT_PACKAGES}" | command xargs;
    fi
}
nvm_get_download_slug () 
{ 
    local FLAVOR;
    case "${1-}" in 
        node | iojs)
            FLAVOR="${1}"
        ;;
        *)
            nvm_err 'supported flavors: node, iojs';
            return 1
        ;;
    esac;
    local KIND;
    case "${2-}" in 
        binary | source)
            KIND="${2}"
        ;;
        *)
            nvm_err 'supported kinds: binary, source';
            return 2
        ;;
    esac;
    local VERSION;
    VERSION="${3-}";
    local NVM_OS;
    NVM_OS="$(nvm_get_os)";
    local NVM_ARCH;
    NVM_ARCH="$(nvm_get_arch)";
    if ! nvm_is_merged_node_version "${VERSION}"; then
        if [ "${NVM_ARCH}" = 'armv6l' ] || [ "${NVM_ARCH}" = 'armv7l' ]; then
            NVM_ARCH="arm-pi";
        fi;
    fi;
    if nvm_version_greater '14.17.0' "${VERSION}" || ( nvm_version_greater_than_or_equal_to "${VERSION}" '15.0.0' && nvm_version_greater '16.0.0' "${VERSION}" ); then
        if [ "_${NVM_OS}" = '_darwin' ] && [ "${NVM_ARCH}" = 'arm64' ]; then
            NVM_ARCH=x64;
        fi;
    fi;
    if [ "${KIND}" = 'binary' ]; then
        nvm_echo "${FLAVOR}-${VERSION}-${NVM_OS}-${NVM_ARCH}";
    else
        if [ "${KIND}" = 'source' ]; then
            nvm_echo "${FLAVOR}-${VERSION}";
        fi;
    fi
}
nvm_get_latest () 
{ 
    local NVM_LATEST_URL;
    local CURL_COMPRESSED_FLAG;
    if nvm_has "curl"; then
        if nvm_curl_use_compression; then
            CURL_COMPRESSED_FLAG="--compressed";
        fi;
        NVM_LATEST_URL="$(curl ${CURL_COMPRESSED_FLAG:-} -q -w "%{url_effective}\\n" -L -s -S https://latest.nvm.sh -o /dev/null)";
    else
        if nvm_has "wget"; then
            NVM_LATEST_URL="$(wget -q https://latest.nvm.sh --server-response -O /dev/null 2>&1 | command awk '/^  Location: /{DEST=$2} END{ print DEST }')";
        else
            nvm_err 'nvm needs curl or wget to proceed.';
            return 1;
        fi;
    fi;
    if [ -z "${NVM_LATEST_URL}" ]; then
        nvm_err "https://latest.nvm.sh did not redirect to the latest release on GitHub";
        return 2;
    fi;
    nvm_echo "${NVM_LATEST_URL##*/}"
}
nvm_get_make_jobs () 
{ 
    if nvm_is_natural_num "${1-}"; then
        NVM_MAKE_JOBS="$1";
        nvm_echo "number of \`make\` jobs: ${NVM_MAKE_JOBS}";
        return;
    else
        if [ -n "${1-}" ]; then
            unset NVM_MAKE_JOBS;
            nvm_err "$1 is invalid for number of \`make\` jobs, must be a natural number";
        fi;
    fi;
    local NVM_OS;
    NVM_OS="$(nvm_get_os)";
    local NVM_CPU_CORES;
    case "_${NVM_OS}" in 
        "_linux")
            NVM_CPU_CORES="$(nvm_grep -c -E '^processor.+: [0-9]+' /proc/cpuinfo)"
        ;;
        "_freebsd" | "_darwin" | "_openbsd")
            NVM_CPU_CORES="$(sysctl -n hw.ncpu)"
        ;;
        "_sunos")
            NVM_CPU_CORES="$(psrinfo | wc -l)"
        ;;
        "_aix")
            NVM_CPU_CORES="$(pmcycles -m | wc -l)"
        ;;
    esac;
    if ! nvm_is_natural_num "${NVM_CPU_CORES}"; then
        nvm_err 'Can not determine how many core(s) are available, running in single-threaded mode.';
        nvm_err 'Please report an issue on GitHub to help us make nvm run faster on your computer!';
        NVM_MAKE_JOBS=1;
    else
        nvm_echo "Detected that you have ${NVM_CPU_CORES} CPU core(s)";
        if [ "${NVM_CPU_CORES}" -gt 2 ]; then
            NVM_MAKE_JOBS=$((NVM_CPU_CORES - 1));
            nvm_echo "Running with ${NVM_MAKE_JOBS} threads to speed up the build";
        else
            NVM_MAKE_JOBS=1;
            nvm_echo 'Number of CPU core(s) less than or equal to 2, running in single-threaded mode';
        fi;
    fi
}
nvm_get_minor_version () 
{ 
    local VERSION;
    VERSION="$1";
    if [ -z "${VERSION}" ]; then
        nvm_err 'a version is required';
        return 1;
    fi;
    case "${VERSION}" in 
        v | .* | *..* | v*[!.0123456789]* | [!v]*[!.0123456789]* | [!v0123456789]* | v[!0123456789]*)
            nvm_err 'invalid version number';
            return 2
        ;;
    esac;
    local PREFIXED_VERSION;
    PREFIXED_VERSION="$(nvm_format_version "${VERSION}")";
    local MINOR;
    MINOR="$(nvm_echo "${PREFIXED_VERSION}" | nvm_grep -e '^v' | command cut -c2- | command cut -d . -f 1,2)";
    if [ -z "${MINOR}" ]; then
        nvm_err 'invalid version number! (please report this)';
        return 3;
    fi;
    nvm_echo "${MINOR}"
}
nvm_get_mirror () 
{ 
    case "${1}-${2}" in 
        node-std)
            nvm_echo "${NVM_NODEJS_ORG_MIRROR:-https://nodejs.org/dist}"
        ;;
        iojs-std)
            nvm_echo "${NVM_IOJS_ORG_MIRROR:-https://iojs.org/dist}"
        ;;
        *)
            nvm_err 'unknown type of node.js or io.js release';
            return 1
        ;;
    esac
}
nvm_get_os () 
{ 
    local NVM_UNAME;
    NVM_UNAME="$(command uname -a)";
    local NVM_OS;
    case "${NVM_UNAME}" in 
        Linux\ *)
            NVM_OS=linux
        ;;
        Darwin\ *)
            NVM_OS=darwin
        ;;
        SunOS\ *)
            NVM_OS=sunos
        ;;
        FreeBSD\ *)
            NVM_OS=freebsd
        ;;
        OpenBSD\ *)
            NVM_OS=openbsd
        ;;
        AIX\ *)
            NVM_OS=aix
        ;;
        CYGWIN* | MSYS* | MINGW*)
            NVM_OS=win
        ;;
    esac;
    nvm_echo "${NVM_OS-}"
}
nvm_grep () 
{ 
    GREP_OPTIONS='' command grep "$@"
}
nvm_has () 
{ 
    type "${1-}" > /dev/null 2>&1
}
nvm_has_colors () 
{ 
    local NVM_NUM_COLORS;
    if nvm_has tput; then
        NVM_NUM_COLORS="$(tput -T "${TERM:-vt100}" colors)";
    fi;
    [ "${NVM_NUM_COLORS:--1}" -ge 8 ]
}
nvm_has_non_aliased () 
{ 
    nvm_has "${1-}" && ! nvm_is_alias "${1-}"
}
nvm_has_solaris_binary () 
{ 
    local VERSION="${1-}";
    if nvm_is_merged_node_version "${VERSION}"; then
        return 0;
    else
        if nvm_is_iojs_version "${VERSION}"; then
            nvm_iojs_version_has_solaris_binary "${VERSION}";
        else
            nvm_node_version_has_solaris_binary "${VERSION}";
        fi;
    fi
}
nvm_has_system_iojs () 
{ 
    [ "$(nvm deactivate >/dev/null 2>&1 && command -v iojs)" != '' ]
}
nvm_has_system_node () 
{ 
    [ "$(nvm deactivate >/dev/null 2>&1 && command -v node)" != '' ]
}
nvm_install_binary () 
{ 
    local FLAVOR;
    case "${1-}" in 
        node | iojs)
            FLAVOR="${1}"
        ;;
        *)
            nvm_err 'supported flavors: node, iojs';
            return 4
        ;;
    esac;
    local TYPE;
    TYPE="${2-}";
    local PREFIXED_VERSION;
    PREFIXED_VERSION="${3-}";
    if [ -z "${PREFIXED_VERSION}" ]; then
        nvm_err 'A version number is required.';
        return 3;
    fi;
    local nosource;
    nosource="${4-}";
    local VERSION;
    VERSION="$(nvm_strip_iojs_prefix "${PREFIXED_VERSION}")";
    local NVM_OS;
    NVM_OS="$(nvm_get_os)";
    if [ -z "${NVM_OS}" ]; then
        return 2;
    fi;
    local TARBALL;
    local TMPDIR;
    local PROGRESS_BAR;
    local NODE_OR_IOJS;
    if [ "${FLAVOR}" = 'node' ]; then
        NODE_OR_IOJS="${FLAVOR}";
    else
        if [ "${FLAVOR}" = 'iojs' ]; then
            NODE_OR_IOJS="io.js";
        fi;
    fi;
    if [ "${NVM_NO_PROGRESS-}" = "1" ]; then
        PROGRESS_BAR="-sS";
    else
        PROGRESS_BAR="--progress-bar";
    fi;
    nvm_echo "Downloading and installing ${NODE_OR_IOJS-} ${VERSION}...";
    TARBALL="$(PROGRESS_BAR="${PROGRESS_BAR}" nvm_download_artifact "${FLAVOR}" binary "${TYPE-}" "${VERSION}" | command tail -1)";
    if [ -f "${TARBALL}" ]; then
        TMPDIR="$(dirname "${TARBALL}")/files";
    fi;
    if nvm_install_binary_extract "${NVM_OS}" "${PREFIXED_VERSION}" "${VERSION}" "${TARBALL}" "${TMPDIR}"; then
        if [ -n "${ALIAS-}" ]; then
            nvm alias "${ALIAS}" "${provided_version}";
        fi;
        return 0;
    fi;
    if [ "${nosource-}" = '1' ]; then
        nvm_err 'Binary download failed. Download from source aborted.';
        return 0;
    fi;
    nvm_err 'Binary download failed, trying source.';
    if [ -n "${TMPDIR-}" ]; then
        command rm -rf "${TMPDIR}";
    fi;
    return 1
}
nvm_install_binary_extract () 
{ 
    if [ "$#" -ne 5 ]; then
        nvm_err 'nvm_install_binary_extract needs 5 parameters';
        return 1;
    fi;
    local NVM_OS;
    local PREFIXED_VERSION;
    local VERSION;
    local TARBALL;
    local TMPDIR;
    NVM_OS="${1}";
    PREFIXED_VERSION="${2}";
    VERSION="${3}";
    TARBALL="${4}";
    TMPDIR="${5}";
    local VERSION_PATH;
    [ -n "${TMPDIR-}" ] && command mkdir -p "${TMPDIR}" && VERSION_PATH="$(nvm_version_path "${PREFIXED_VERSION}")" || return 1;
    if [ "${NVM_OS}" = 'win' ]; then
        VERSION_PATH="${VERSION_PATH}/bin";
        command unzip -q "${TARBALL}" -d "${TMPDIR}" || return 1;
    else
        nvm_extract_tarball "${NVM_OS}" "${VERSION}" "${TARBALL}" "${TMPDIR}";
    fi;
    command mkdir -p "${VERSION_PATH}" || return 1;
    if [ "${NVM_OS}" = 'win' ]; then
        command mv "${TMPDIR}/"*/* "${VERSION_PATH}" || return 1;
        command chmod +x "${VERSION_PATH}"/node.exe || return 1;
        command chmod +x "${VERSION_PATH}"/npm || return 1;
        command chmod +x "${VERSION_PATH}"/npx 2> /dev/null;
    else
        command mv "${TMPDIR}/"* "${VERSION_PATH}" || return 1;
    fi;
    command rm -rf "${TMPDIR}";
    return 0
}
nvm_install_default_packages () 
{ 
    local DEFAULT_PACKAGES;
    DEFAULT_PACKAGES="$(nvm_get_default_packages)";
    EXIT_CODE=$?;
    if [ $EXIT_CODE -ne 0 ] || [ -z "${DEFAULT_PACKAGES}" ]; then
        return $EXIT_CODE;
    fi;
    nvm_echo "Installing default global packages from ${NVM_DIR}/default-packages...";
    nvm_echo "npm install -g --quiet ${DEFAULT_PACKAGES}";
    if ! nvm_echo "${DEFAULT_PACKAGES}" | command xargs npm install -g --quiet; then
        nvm_err "Failed installing default packages. Please check if your default-packages file or a package in it has problems!";
        return 1;
    fi
}
nvm_install_latest_npm () 
{ 
    nvm_echo 'Attempting to upgrade to the latest working version of npm...';
    local NODE_VERSION;
    NODE_VERSION="$(nvm_strip_iojs_prefix "$(nvm_ls_current)")";
    if [ "${NODE_VERSION}" = 'system' ]; then
        NODE_VERSION="$(node --version)";
    else
        if [ "${NODE_VERSION}" = 'none' ]; then
            nvm_echo "Detected node version ${NODE_VERSION}, npm version v${NPM_VERSION}";
            NODE_VERSION='';
        fi;
    fi;
    if [ -z "${NODE_VERSION}" ]; then
        nvm_err 'Unable to obtain node version.';
        return 1;
    fi;
    local NPM_VERSION;
    NPM_VERSION="$(npm --version 2>/dev/null)";
    if [ -z "${NPM_VERSION}" ]; then
        nvm_err 'Unable to obtain npm version.';
        return 2;
    fi;
    local NVM_NPM_CMD;
    NVM_NPM_CMD='npm';
    if [ "${NVM_DEBUG-}" = 1 ]; then
        nvm_echo "Detected node version ${NODE_VERSION}, npm version v${NPM_VERSION}";
        NVM_NPM_CMD='nvm_echo npm';
    fi;
    local NVM_IS_0_6;
    NVM_IS_0_6=0;
    if nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 0.6.0 && nvm_version_greater 0.7.0 "${NODE_VERSION}"; then
        NVM_IS_0_6=1;
    fi;
    local NVM_IS_0_9;
    NVM_IS_0_9=0;
    if nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 0.9.0 && nvm_version_greater 0.10.0 "${NODE_VERSION}"; then
        NVM_IS_0_9=1;
    fi;
    if [ $NVM_IS_0_6 -eq 1 ]; then
        nvm_echo '* `node` v0.6.x can only upgrade to `npm` v1.3.x';
        $NVM_NPM_CMD install -g npm@1.3;
    else
        if [ $NVM_IS_0_9 -eq 0 ]; then
            if nvm_version_greater_than_or_equal_to "${NPM_VERSION}" 1.0.0 && nvm_version_greater 2.0.0 "${NPM_VERSION}"; then
                nvm_echo '* `npm` v1.x needs to first jump to `npm` v1.4.28 to be able to upgrade further';
                $NVM_NPM_CMD install -g npm@1.4.28;
            else
                if nvm_version_greater_than_or_equal_to "${NPM_VERSION}" 2.0.0 && nvm_version_greater 3.0.0 "${NPM_VERSION}"; then
                    nvm_echo '* `npm` v2.x needs to first jump to the latest v2 to be able to upgrade further';
                    $NVM_NPM_CMD install -g npm@2;
                fi;
            fi;
        fi;
    fi;
    if [ $NVM_IS_0_9 -eq 1 ] || [ $NVM_IS_0_6 -eq 1 ]; then
        nvm_echo '* node v0.6 and v0.9 are unable to upgrade further';
    else
        if nvm_version_greater 1.1.0 "${NODE_VERSION}"; then
            nvm_echo '* `npm` v4.5.x is the last version that works on `node` versions < v1.1.0';
            $NVM_NPM_CMD install -g npm@4.5;
        else
            if nvm_version_greater 4.0.0 "${NODE_VERSION}"; then
                nvm_echo '* `npm` v5 and higher do not work on `node` versions below v4.0.0';
                $NVM_NPM_CMD install -g npm@4;
            else
                if [ $NVM_IS_0_9 -eq 0 ] && [ $NVM_IS_0_6 -eq 0 ]; then
                    local NVM_IS_4_4_OR_BELOW;
                    NVM_IS_4_4_OR_BELOW=0;
                    if nvm_version_greater 4.5.0 "${NODE_VERSION}"; then
                        NVM_IS_4_4_OR_BELOW=1;
                    fi;
                    local NVM_IS_5_OR_ABOVE;
                    NVM_IS_5_OR_ABOVE=0;
                    if [ $NVM_IS_4_4_OR_BELOW -eq 0 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 5.0.0; then
                        NVM_IS_5_OR_ABOVE=1;
                    fi;
                    local NVM_IS_6_OR_ABOVE;
                    NVM_IS_6_OR_ABOVE=0;
                    local NVM_IS_6_2_OR_ABOVE;
                    NVM_IS_6_2_OR_ABOVE=0;
                    if [ $NVM_IS_5_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 6.0.0; then
                        NVM_IS_6_OR_ABOVE=1;
                        if nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 6.2.0; then
                            NVM_IS_6_2_OR_ABOVE=1;
                        fi;
                    fi;
                    local NVM_IS_9_OR_ABOVE;
                    NVM_IS_9_OR_ABOVE=0;
                    local NVM_IS_9_3_OR_ABOVE;
                    NVM_IS_9_3_OR_ABOVE=0;
                    if [ $NVM_IS_6_2_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 9.0.0; then
                        NVM_IS_9_OR_ABOVE=1;
                        if nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 9.3.0; then
                            NVM_IS_9_3_OR_ABOVE=1;
                        fi;
                    fi;
                    local NVM_IS_10_OR_ABOVE;
                    NVM_IS_10_OR_ABOVE=0;
                    if [ $NVM_IS_9_3_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 10.0.0; then
                        NVM_IS_10_OR_ABOVE=1;
                    fi;
                    local NVM_IS_12_LTS_OR_ABOVE;
                    NVM_IS_12_LTS_OR_ABOVE=0;
                    if [ $NVM_IS_10_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 12.13.0; then
                        NVM_IS_12_LTS_OR_ABOVE=1;
                    fi;
                    local NVM_IS_13_OR_ABOVE;
                    NVM_IS_13_OR_ABOVE=0;
                    if [ $NVM_IS_12_LTS_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 13.0.0; then
                        NVM_IS_13_OR_ABOVE=1;
                    fi;
                    local NVM_IS_14_LTS_OR_ABOVE;
                    NVM_IS_14_LTS_OR_ABOVE=0;
                    if [ $NVM_IS_13_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 14.15.0; then
                        NVM_IS_14_LTS_OR_ABOVE=1;
                    fi;
                    local NVM_IS_14_17_OR_ABOVE;
                    NVM_IS_14_17_OR_ABOVE=0;
                    if [ $NVM_IS_14_LTS_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 14.17.0; then
                        NVM_IS_14_17_OR_ABOVE=1;
                    fi;
                    local NVM_IS_15_OR_ABOVE;
                    NVM_IS_15_OR_ABOVE=0;
                    if [ $NVM_IS_14_LTS_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 15.0.0; then
                        NVM_IS_15_OR_ABOVE=1;
                    fi;
                    local NVM_IS_16_OR_ABOVE;
                    NVM_IS_16_OR_ABOVE=0;
                    if [ $NVM_IS_15_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 16.0.0; then
                        NVM_IS_16_OR_ABOVE=1;
                    fi;
                    local NVM_IS_16_LTS_OR_ABOVE;
                    NVM_IS_16_LTS_OR_ABOVE=0;
                    if [ $NVM_IS_16_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 16.13.0; then
                        NVM_IS_16_LTS_OR_ABOVE=1;
                    fi;
                    local NVM_IS_17_OR_ABOVE;
                    NVM_IS_17_OR_ABOVE=0;
                    if [ $NVM_IS_16_LTS_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 17.0.0; then
                        NVM_IS_17_OR_ABOVE=1;
                    fi;
                    local NVM_IS_18_OR_ABOVE;
                    NVM_IS_18_OR_ABOVE=0;
                    if [ $NVM_IS_17_OR_ABOVE -eq 1 ] && nvm_version_greater_than_or_equal_to "${NODE_VERSION}" 18.0.0; then
                        NVM_IS_18_OR_ABOVE=1;
                    fi;
                    if [ $NVM_IS_4_4_OR_BELOW -eq 1 ] || { 
                        [ $NVM_IS_5_OR_ABOVE -eq 1 ] && nvm_version_greater 5.10.0 "${NODE_VERSION}"
                    }; then
                        nvm_echo '* `npm` `v5.3.x` is the last version that works on `node` 4.x versions below v4.4, or 5.x versions below v5.10, due to `Buffer.alloc`';
                        $NVM_NPM_CMD install -g npm@5.3;
                    else
                        if [ $NVM_IS_4_4_OR_BELOW -eq 0 ] && nvm_version_greater 4.7.0 "${NODE_VERSION}"; then
                            nvm_echo '* `npm` `v5.4.1` is the last version that works on `node` `v4.5` and `v4.6`';
                            $NVM_NPM_CMD install -g npm@5.4.1;
                        else
                            if [ $NVM_IS_6_OR_ABOVE -eq 0 ]; then
                                nvm_echo '* `npm` `v5.x` is the last version that works on `node` below `v6.0.0`';
                                $NVM_NPM_CMD install -g npm@5;
                            else
                                if { 
                                    [ $NVM_IS_6_OR_ABOVE -eq 1 ] && [ $NVM_IS_6_2_OR_ABOVE -eq 0 ]
                                } || { 
                                    [ $NVM_IS_9_OR_ABOVE -eq 1 ] && [ $NVM_IS_9_3_OR_ABOVE -eq 0 ]
                                }; then
                                    nvm_echo '* `npm` `v6.9` is the last version that works on `node` `v6.0.x`, `v6.1.x`, `v9.0.x`, `v9.1.x`, or `v9.2.x`';
                                    $NVM_NPM_CMD install -g npm@6.9;
                                else
                                    if [ $NVM_IS_10_OR_ABOVE -eq 0 ]; then
                                        if nvm_version_greater 4.4.4 "${NPM_VERSION}"; then
                                            nvm_echo '* `npm` `v4.4.4` or later is required to install npm v6.14.18';
                                            $NVM_NPM_CMD install -g npm@4;
                                        fi;
                                        nvm_echo '* `npm` `v6.x` is the last version that works on `node` below `v10.0.0`';
                                        $NVM_NPM_CMD install -g npm@6;
                                    else
                                        if [ $NVM_IS_12_LTS_OR_ABOVE -eq 0 ] || { 
                                            [ $NVM_IS_13_OR_ABOVE -eq 1 ] && [ $NVM_IS_14_LTS_OR_ABOVE -eq 0 ]
                                        } || { 
                                            [ $NVM_IS_15_OR_ABOVE -eq 1 ] && [ $NVM_IS_16_OR_ABOVE -eq 0 ]
                                        }; then
                                            nvm_echo '* `npm` `v7.x` is the last version that works on `node` `v13`, `v15`, below `v12.13`, or `v14.0` - `v14.15`';
                                            $NVM_NPM_CMD install -g npm@7;
                                        else
                                            if { 
                                                [ $NVM_IS_12_LTS_OR_ABOVE -eq 1 ] && [ $NVM_IS_13_OR_ABOVE -eq 0 ]
                                            } || { 
                                                [ $NVM_IS_14_LTS_OR_ABOVE -eq 1 ] && [ $NVM_IS_14_17_OR_ABOVE -eq 0 ]
                                            } || { 
                                                [ $NVM_IS_16_OR_ABOVE -eq 1 ] && [ $NVM_IS_16_LTS_OR_ABOVE -eq 0 ]
                                            } || { 
                                                [ $NVM_IS_17_OR_ABOVE -eq 1 ] && [ $NVM_IS_18_OR_ABOVE -eq 0 ]
                                            }; then
                                                nvm_echo '* `npm` `v8.x` is the last version that works on `node` `v12`, `v14.13` - `v14.16`, or `v16.0` - `v16.12`';
                                                $NVM_NPM_CMD install -g npm@8;
                                            else
                                                nvm_echo '* Installing latest `npm`; if this does not work on your node version, please report a bug!';
                                                $NVM_NPM_CMD install -g npm;
                                            fi;
                                        fi;
                                    fi;
                                fi;
                            fi;
                        fi;
                    fi;
                fi;
            fi;
        fi;
    fi;
    nvm_echo "* npm upgraded to: v$(npm --version 2>/dev/null)"
}
nvm_install_npm_if_needed () 
{ 
    local VERSION;
    VERSION="$(nvm_ls_current)";
    if ! nvm_has "npm"; then
        nvm_echo 'Installing npm...';
        if nvm_version_greater 0.2.0 "${VERSION}"; then
            nvm_err 'npm requires node v0.2.3 or higher';
        else
            if nvm_version_greater_than_or_equal_to "${VERSION}" 0.2.0; then
                if nvm_version_greater 0.2.3 "${VERSION}"; then
                    nvm_err 'npm requires node v0.2.3 or higher';
                else
                    nvm_download -L https://npmjs.org/install.sh -o - | clean=yes npm_install=0.2.19 sh;
                fi;
            else
                nvm_download -L https://npmjs.org/install.sh -o - | clean=yes sh;
            fi;
        fi;
    fi;
    return $?
}
nvm_install_source () 
{ 
    local FLAVOR;
    case "${1-}" in 
        node | iojs)
            FLAVOR="${1}"
        ;;
        *)
            nvm_err 'supported flavors: node, iojs';
            return 4
        ;;
    esac;
    local TYPE;
    TYPE="${2-}";
    local PREFIXED_VERSION;
    PREFIXED_VERSION="${3-}";
    if [ -z "${PREFIXED_VERSION}" ]; then
        nvm_err 'A version number is required.';
        return 3;
    fi;
    local VERSION;
    VERSION="$(nvm_strip_iojs_prefix "${PREFIXED_VERSION}")";
    local NVM_MAKE_JOBS;
    NVM_MAKE_JOBS="${4-}";
    local ADDITIONAL_PARAMETERS;
    ADDITIONAL_PARAMETERS="${5-}";
    local NVM_ARCH;
    NVM_ARCH="$(nvm_get_arch)";
    if [ "${NVM_ARCH}" = 'armv6l' ] || [ "${NVM_ARCH}" = 'armv7l' ]; then
        if [ -n "${ADDITIONAL_PARAMETERS}" ]; then
            ADDITIONAL_PARAMETERS="--without-snapshot ${ADDITIONAL_PARAMETERS}";
        else
            ADDITIONAL_PARAMETERS='--without-snapshot';
        fi;
    fi;
    if [ -n "${ADDITIONAL_PARAMETERS}" ]; then
        nvm_echo "Additional options while compiling: ${ADDITIONAL_PARAMETERS}";
    fi;
    local NVM_OS;
    NVM_OS="$(nvm_get_os)";
    local make;
    make='make';
    local MAKE_CXX;
    case "${NVM_OS}" in 
        'freebsd' | 'openbsd')
            make='gmake';
            MAKE_CXX="CC=${CC:-cc} CXX=${CXX:-c++}"
        ;;
        'darwin')
            MAKE_CXX="CC=${CC:-cc} CXX=${CXX:-c++}"
        ;;
        'aix')
            make='gmake'
        ;;
    esac;
    if nvm_has "clang++" && nvm_has "clang" && nvm_version_greater_than_or_equal_to "$(nvm_clang_version)" 3.5; then
        if [ -z "${CC-}" ] || [ -z "${CXX-}" ]; then
            nvm_echo "Clang v3.5+ detected! CC or CXX not specified, will use Clang as C/C++ compiler!";
            MAKE_CXX="CC=${CC:-cc} CXX=${CXX:-c++}";
        fi;
    fi;
    local TARBALL;
    local TMPDIR;
    local VERSION_PATH;
    if [ "${NVM_NO_PROGRESS-}" = "1" ]; then
        PROGRESS_BAR="-sS";
    else
        PROGRESS_BAR="--progress-bar";
    fi;
    nvm_is_zsh && setopt local_options shwordsplit;
    TARBALL="$(PROGRESS_BAR="${PROGRESS_BAR}" nvm_download_artifact "${FLAVOR}" source "${TYPE}" "${VERSION}" | command tail -1)" && [ -f "${TARBALL}" ] && TMPDIR="$(dirname "${TARBALL}")/files" && if ! ( command mkdir -p "${TMPDIR}" && nvm_extract_tarball "${NVM_OS}" "${VERSION}" "${TARBALL}" "${TMPDIR}" && VERSION_PATH="$(nvm_version_path "${PREFIXED_VERSION}")" && nvm_cd "${TMPDIR}" && nvm_echo '$>'./configure --prefix="${VERSION_PATH}" $ADDITIONAL_PARAMETERS'<' && ./configure --prefix="${VERSION_PATH}" $ADDITIONAL_PARAMETERS && $make -j "${NVM_MAKE_JOBS}" ${MAKE_CXX-} && command rm -f "${VERSION_PATH}" 2> /dev/null && $make -j "${NVM_MAKE_JOBS}" ${MAKE_CXX-} install ); then
        nvm_err "nvm: install ${VERSION} failed!";
        command rm -rf "${TMPDIR-}";
        return 1;
    fi
}
nvm_iojs_prefix () 
{ 
    nvm_echo 'iojs'
}
nvm_iojs_version_has_solaris_binary () 
{ 
    local IOJS_VERSION;
    IOJS_VERSION="$1";
    local STRIPPED_IOJS_VERSION;
    STRIPPED_IOJS_VERSION="$(nvm_strip_iojs_prefix "${IOJS_VERSION}")";
    if [ "_${STRIPPED_IOJS_VERSION}" = "${IOJS_VERSION}" ]; then
        return 1;
    fi;
    nvm_version_greater_than_or_equal_to "${STRIPPED_IOJS_VERSION}" v3.3.1
}
nvm_is_alias () 
{ 
    \alias "${1-}" > /dev/null 2>&1
}
nvm_is_iojs_version () 
{ 
    case "${1-}" in 
        iojs-*)
            return 0
        ;;
    esac;
    return 1
}
nvm_is_merged_node_version () 
{ 
    nvm_version_greater_than_or_equal_to "$1" v4.0.0
}
nvm_is_natural_num () 
{ 
    if [ -z "$1" ]; then
        return 4;
    fi;
    case "$1" in 
        0)
            return 1
        ;;
        -*)
            return 3
        ;;
        *)
            [ "$1" -eq "$1" ] 2> /dev/null
        ;;
    esac
}
nvm_is_valid_version () 
{ 
    if nvm_validate_implicit_alias "${1-}" 2> /dev/null; then
        return 0;
    fi;
    case "${1-}" in 
        "$(nvm_iojs_prefix)" | "$(nvm_node_prefix)")
            return 0
        ;;
        *)
            local VERSION;
            VERSION="$(nvm_strip_iojs_prefix "${1-}")";
            nvm_version_greater_than_or_equal_to "${VERSION}" 0
        ;;
    esac
}
nvm_is_version_installed () 
{ 
    if [ -z "${1-}" ]; then
        return 1;
    fi;
    local NVM_NODE_BINARY;
    NVM_NODE_BINARY='node';
    if [ "_$(nvm_get_os)" = '_win' ]; then
        NVM_NODE_BINARY='node.exe';
    fi;
    if [ -x "$(nvm_version_path "$1" 2>/dev/null)/bin/${NVM_NODE_BINARY}" ]; then
        return 0;
    fi;
    return 1
}
nvm_is_zsh () 
{ 
    [ -n "${ZSH_VERSION-}" ]
}
nvm_list_aliases () 
{ 
    local ALIAS;
    ALIAS="${1-}";
    local NVM_CURRENT;
    NVM_CURRENT="$(nvm_ls_current)";
    local NVM_ALIAS_DIR;
    NVM_ALIAS_DIR="$(nvm_alias_path)";
    command mkdir -p "${NVM_ALIAS_DIR}/lts";
    if [ "${ALIAS}" != "${ALIAS#lts/}" ]; then
        nvm_alias "${ALIAS}";
        return $?;
    fi;
    nvm_is_zsh && unsetopt local_options nomatch;
    ( local ALIAS_PATH;
    for ALIAS_PATH in "${NVM_ALIAS_DIR}/${ALIAS}"*;
    do
        NVM_NO_COLORS="${NVM_NO_COLORS-}" NVM_CURRENT="${NVM_CURRENT}" nvm_print_alias_path "${NVM_ALIAS_DIR}" "${ALIAS_PATH}" &
    done;
    wait ) | sort;
    ( local ALIAS_NAME;
    for ALIAS_NAME in "$(nvm_node_prefix)" "stable" "unstable";
    do
        { 
            if [ ! -f "${NVM_ALIAS_DIR}/${ALIAS_NAME}" ] && { 
                [ -z "${ALIAS}" ] || [ "${ALIAS_NAME}" = "${ALIAS}" ]
            }; then
                NVM_NO_COLORS="${NVM_NO_COLORS-}" NVM_CURRENT="${NVM_CURRENT}" nvm_print_default_alias "${ALIAS_NAME}";
            fi
        } &
    done;
    wait;
    ALIAS_NAME="$(nvm_iojs_prefix)";
    if [ ! -f "${NVM_ALIAS_DIR}/${ALIAS_NAME}" ] && { 
        [ -z "${ALIAS}" ] || [ "${ALIAS_NAME}" = "${ALIAS}" ]
    }; then
        NVM_NO_COLORS="${NVM_NO_COLORS-}" NVM_CURRENT="${NVM_CURRENT}" nvm_print_default_alias "${ALIAS_NAME}";
    fi ) | sort;
    ( local LTS_ALIAS;
    for ALIAS_PATH in "${NVM_ALIAS_DIR}/lts/${ALIAS}"*;
    do
        { 
            LTS_ALIAS="$(NVM_NO_COLORS="${NVM_NO_COLORS-}" NVM_LTS=true nvm_print_alias_path "${NVM_ALIAS_DIR}" "${ALIAS_PATH}")";
            if [ -n "${LTS_ALIAS}" ]; then
                nvm_echo "${LTS_ALIAS}";
            fi
        } &
    done;
    wait ) | sort;
    return
}
nvm_ls () 
{ 
    local PATTERN;
    PATTERN="${1-}";
    local VERSIONS;
    VERSIONS='';
    if [ "${PATTERN}" = 'current' ]; then
        nvm_ls_current;
        return;
    fi;
    local NVM_IOJS_PREFIX;
    NVM_IOJS_PREFIX="$(nvm_iojs_prefix)";
    local NVM_NODE_PREFIX;
    NVM_NODE_PREFIX="$(nvm_node_prefix)";
    local NVM_VERSION_DIR_IOJS;
    NVM_VERSION_DIR_IOJS="$(nvm_version_dir "${NVM_IOJS_PREFIX}")";
    local NVM_VERSION_DIR_NEW;
    NVM_VERSION_DIR_NEW="$(nvm_version_dir new)";
    local NVM_VERSION_DIR_OLD;
    NVM_VERSION_DIR_OLD="$(nvm_version_dir old)";
    case "${PATTERN}" in 
        "${NVM_IOJS_PREFIX}" | "${NVM_NODE_PREFIX}")
            PATTERN="${PATTERN}-"
        ;;
        *)
            if nvm_resolve_local_alias "${PATTERN}"; then
                return;
            fi;
            PATTERN="$(nvm_ensure_version_prefix "${PATTERN}")"
        ;;
    esac;
    if [ "${PATTERN}" = 'N/A' ]; then
        return;
    fi;
    local NVM_PATTERN_STARTS_WITH_V;
    case $PATTERN in 
        v*)
            NVM_PATTERN_STARTS_WITH_V=true
        ;;
        *)
            NVM_PATTERN_STARTS_WITH_V=false
        ;;
    esac;
    if [ $NVM_PATTERN_STARTS_WITH_V = true ] && [ "_$(nvm_num_version_groups "${PATTERN}")" = "_3" ]; then
        if nvm_is_version_installed "${PATTERN}"; then
            VERSIONS="${PATTERN}";
        else
            if nvm_is_version_installed "$(nvm_add_iojs_prefix "${PATTERN}")"; then
                VERSIONS="$(nvm_add_iojs_prefix "${PATTERN}")";
            fi;
        fi;
    else
        case "${PATTERN}" in 
            "${NVM_IOJS_PREFIX}-" | "${NVM_NODE_PREFIX}-" | "system")

            ;;
            *)
                local NUM_VERSION_GROUPS;
                NUM_VERSION_GROUPS="$(nvm_num_version_groups "${PATTERN}")";
                if [ "${NUM_VERSION_GROUPS}" = "2" ] || [ "${NUM_VERSION_GROUPS}" = "1" ]; then
                    PATTERN="${PATTERN%.}.";
                fi
            ;;
        esac;
        nvm_is_zsh && setopt local_options shwordsplit;
        nvm_is_zsh && unsetopt local_options markdirs;
        local NVM_DIRS_TO_SEARCH1;
        NVM_DIRS_TO_SEARCH1='';
        local NVM_DIRS_TO_SEARCH2;
        NVM_DIRS_TO_SEARCH2='';
        local NVM_DIRS_TO_SEARCH3;
        NVM_DIRS_TO_SEARCH3='';
        local NVM_ADD_SYSTEM;
        NVM_ADD_SYSTEM=false;
        if nvm_is_iojs_version "${PATTERN}"; then
            NVM_DIRS_TO_SEARCH1="${NVM_VERSION_DIR_IOJS}";
            PATTERN="$(nvm_strip_iojs_prefix "${PATTERN}")";
            if nvm_has_system_iojs; then
                NVM_ADD_SYSTEM=true;
            fi;
        else
            if [ "${PATTERN}" = "${NVM_NODE_PREFIX}-" ]; then
                NVM_DIRS_TO_SEARCH1="${NVM_VERSION_DIR_OLD}";
                NVM_DIRS_TO_SEARCH2="${NVM_VERSION_DIR_NEW}";
                PATTERN='';
                if nvm_has_system_node; then
                    NVM_ADD_SYSTEM=true;
                fi;
            else
                NVM_DIRS_TO_SEARCH1="${NVM_VERSION_DIR_OLD}";
                NVM_DIRS_TO_SEARCH2="${NVM_VERSION_DIR_NEW}";
                NVM_DIRS_TO_SEARCH3="${NVM_VERSION_DIR_IOJS}";
                if nvm_has_system_iojs || nvm_has_system_node; then
                    NVM_ADD_SYSTEM=true;
                fi;
            fi;
        fi;
        if ! [ -d "${NVM_DIRS_TO_SEARCH1}" ] || ! ( command ls -1qA "${NVM_DIRS_TO_SEARCH1}" | nvm_grep -q . ); then
            NVM_DIRS_TO_SEARCH1='';
        fi;
        if ! [ -d "${NVM_DIRS_TO_SEARCH2}" ] || ! ( command ls -1qA "${NVM_DIRS_TO_SEARCH2}" | nvm_grep -q . ); then
            NVM_DIRS_TO_SEARCH2="${NVM_DIRS_TO_SEARCH1}";
        fi;
        if ! [ -d "${NVM_DIRS_TO_SEARCH3}" ] || ! ( command ls -1qA "${NVM_DIRS_TO_SEARCH3}" | nvm_grep -q . ); then
            NVM_DIRS_TO_SEARCH3="${NVM_DIRS_TO_SEARCH2}";
        fi;
        local SEARCH_PATTERN;
        if [ -z "${PATTERN}" ]; then
            PATTERN='v';
            SEARCH_PATTERN='.*';
        else
            SEARCH_PATTERN="$(nvm_echo "${PATTERN}" | command sed 's#\.#\\\.#g;')";
        fi;
        if [ -n "${NVM_DIRS_TO_SEARCH1}${NVM_DIRS_TO_SEARCH2}${NVM_DIRS_TO_SEARCH3}" ]; then
            VERSIONS="$(command find "${NVM_DIRS_TO_SEARCH1}"/* "${NVM_DIRS_TO_SEARCH2}"/* "${NVM_DIRS_TO_SEARCH3}"/* -name . -o -type d -prune -o -path "${PATTERN}*"         | command sed -e "
            s#${NVM_VERSION_DIR_IOJS}/#versions/${NVM_IOJS_PREFIX}/#;
            s#^${NVM_DIR}/##;
            \\#^[^v]# d;
            \\#^versions\$# d;
            s#^versions/##;
            s#^v#${NVM_NODE_PREFIX}/v#;
            \\#${SEARCH_PATTERN}# !d;
          "           -e 's#^\([^/]\{1,\}\)/\(.*\)$#\2.\1#;'         | command sort -t. -u -k 1.2,1n -k 2,2n -k 3,3n         | command sed -e 's#\(.*\)\.\([^\.]\{1,\}\)$#\2-\1#;'                       -e "s#^${NVM_NODE_PREFIX}-##;"       )";
        fi;
    fi;
    if [ "${NVM_ADD_SYSTEM-}" = true ]; then
        if [ -z "${PATTERN}" ] || [ "${PATTERN}" = 'v' ]; then
            VERSIONS="${VERSIONS}$(command printf '\n%s' 'system')";
        else
            if [ "${PATTERN}" = 'system' ]; then
                VERSIONS="$(command printf '%s' 'system')";
            fi;
        fi;
    fi;
    if [ -z "${VERSIONS}" ]; then
        nvm_echo 'N/A';
        return 3;
    fi;
    nvm_echo "${VERSIONS}"
}
nvm_ls_current () 
{ 
    local NVM_LS_CURRENT_NODE_PATH;
    if ! NVM_LS_CURRENT_NODE_PATH="$(command which node 2>/dev/null)"; then
        nvm_echo 'none';
    else
        if nvm_tree_contains_path "$(nvm_version_dir iojs)" "${NVM_LS_CURRENT_NODE_PATH}"; then
            nvm_add_iojs_prefix "$(iojs --version 2>/dev/null)";
        else
            if nvm_tree_contains_path "${NVM_DIR}" "${NVM_LS_CURRENT_NODE_PATH}"; then
                local VERSION;
                VERSION="$(node --version 2>/dev/null)";
                if [ "${VERSION}" = "v0.6.21-pre" ]; then
                    nvm_echo 'v0.6.21';
                else
                    nvm_echo "${VERSION}";
                fi;
            else
                nvm_echo 'system';
            fi;
        fi;
    fi
}
nvm_ls_remote () 
{ 
    local PATTERN;
    PATTERN="${1-}";
    if nvm_validate_implicit_alias "${PATTERN}" 2> /dev/null; then
        local IMPLICIT;
        IMPLICIT="$(nvm_print_implicit_alias remote "${PATTERN}")";
        if [ -z "${IMPLICIT-}" ] || [ "${IMPLICIT}" = 'N/A' ]; then
            nvm_echo "N/A";
            return 3;
        fi;
        PATTERN="$(NVM_LTS="${NVM_LTS-}" nvm_ls_remote "${IMPLICIT}" | command tail -1 | command awk '{ print $1 }')";
    else
        if [ -n "${PATTERN}" ]; then
            PATTERN="$(nvm_ensure_version_prefix "${PATTERN}")";
        else
            PATTERN=".*";
        fi;
    fi;
    NVM_LTS="${NVM_LTS-}" nvm_ls_remote_index_tab node std "${PATTERN}"
}
nvm_ls_remote_index_tab () 
{ 
    local LTS;
    LTS="${NVM_LTS-}";
    if [ "$#" -lt 3 ]; then
        nvm_err 'not enough arguments';
        return 5;
    fi;
    local FLAVOR;
    FLAVOR="${1-}";
    local TYPE;
    TYPE="${2-}";
    local MIRROR;
    MIRROR="$(nvm_get_mirror "${FLAVOR}" "${TYPE}")";
    if [ -z "${MIRROR}" ]; then
        return 3;
    fi;
    local PREFIX;
    PREFIX='';
    case "${FLAVOR}-${TYPE}" in 
        iojs-std)
            PREFIX="$(nvm_iojs_prefix)-"
        ;;
        node-std)
            PREFIX=''
        ;;
        iojs-*)
            nvm_err 'unknown type of io.js release';
            return 4
        ;;
        *)
            nvm_err 'unknown type of node.js release';
            return 4
        ;;
    esac;
    local SORT_COMMAND;
    SORT_COMMAND='command sort';
    case "${FLAVOR}" in 
        node)
            SORT_COMMAND='command sort -t. -u -k 1.2,1n -k 2,2n -k 3,3n'
        ;;
    esac;
    local PATTERN;
    PATTERN="${3-}";
    if [ "${PATTERN#"${PATTERN%?}"}" = '.' ]; then
        PATTERN="${PATTERN%.}";
    fi;
    local VERSIONS;
    if [ -n "${PATTERN}" ] && [ "${PATTERN}" != '*' ]; then
        if [ "${FLAVOR}" = 'iojs' ]; then
            PATTERN="$(nvm_ensure_version_prefix "$(nvm_strip_iojs_prefix "${PATTERN}")")";
        else
            PATTERN="$(nvm_ensure_version_prefix "${PATTERN}")";
        fi;
    else
        unset PATTERN;
    fi;
    nvm_is_zsh && setopt local_options shwordsplit;
    local VERSION_LIST;
    VERSION_LIST="$(nvm_download -L -s "${MIRROR}/index.tab" -o -     | command sed "
        1d;
        s/^/${PREFIX}/;
      "   )";
    local LTS_ALIAS;
    local LTS_VERSION;
    command mkdir -p "$(nvm_alias_path)/lts";
    { 
        command awk '{
        if ($10 ~ /^\-?$/) { next }
        if ($10 && !a[tolower($10)]++) {
          if (alias) { print alias, version }
          alias_name = "lts/" tolower($10)
          if (!alias) { print "lts/*", alias_name }
          alias = alias_name
          version = $1
        }
      }
      END {
        if (alias) {
          print alias, version
        }
      }' | while read -r LTS_ALIAS_LINE; do
            LTS_ALIAS="${LTS_ALIAS_LINE%% *}";
            LTS_VERSION="${LTS_ALIAS_LINE#* }";
            nvm_make_alias "${LTS_ALIAS}" "${LTS_VERSION}" > /dev/null 2>&1;
        done
    } <<EOF
$VERSION_LIST
EOF

    if [ -n "${LTS-}" ]; then
        LTS="$(nvm_normalize_lts "lts/${LTS}")";
        LTS="${LTS#lts/}";
    fi;
    VERSIONS="$({ command awk -v lts="${LTS-}" '{
        if (!$1) { next }
        if (lts && $10 ~ /^\-?$/) { next }
        if (lts && lts != "*" && tolower($10) !~ tolower(lts)) { next }
        if ($10 !~ /^\-?$/) {
          if ($10 && $10 != prev) {
            print $1, $10, "*"
          } else {
            print $1, $10
          }
        } else {
          print $1
        }
        prev=$10;
      }'     | nvm_grep -w "${PATTERN:-.*}"     | $SORT_COMMAND; } << EOF
$VERSION_LIST
EOF
)";
    if [ -z "${VERSIONS}" ]; then
        nvm_echo 'N/A';
        return 3;
    fi;
    nvm_echo "${VERSIONS}"
}
nvm_ls_remote_iojs () 
{ 
    NVM_LTS="${NVM_LTS-}" nvm_ls_remote_index_tab iojs std "${1-}"
}
nvm_make_alias () 
{ 
    local ALIAS;
    ALIAS="${1-}";
    if [ -z "${ALIAS}" ]; then
        nvm_err "an alias name is required";
        return 1;
    fi;
    local VERSION;
    VERSION="${2-}";
    if [ -z "${VERSION}" ]; then
        nvm_err "an alias target version is required";
        return 2;
    fi;
    nvm_echo "${VERSION}" | tee "$(nvm_alias_path)/${ALIAS}" > /dev/null
}
nvm_match_version () 
{ 
    local NVM_IOJS_PREFIX;
    NVM_IOJS_PREFIX="$(nvm_iojs_prefix)";
    local PROVIDED_VERSION;
    PROVIDED_VERSION="$1";
    case "_${PROVIDED_VERSION}" in 
        "_${NVM_IOJS_PREFIX}" | '_io.js')
            nvm_version "${NVM_IOJS_PREFIX}"
        ;;
        '_system')
            nvm_echo 'system'
        ;;
        *)
            nvm_version "${PROVIDED_VERSION}"
        ;;
    esac
}
nvm_node_prefix () 
{ 
    nvm_echo 'node'
}
nvm_node_version_has_solaris_binary () 
{ 
    local NODE_VERSION;
    NODE_VERSION="$1";
    local STRIPPED_IOJS_VERSION;
    STRIPPED_IOJS_VERSION="$(nvm_strip_iojs_prefix "${NODE_VERSION}")";
    if [ "_${STRIPPED_IOJS_VERSION}" != "_${NODE_VERSION}" ]; then
        return 1;
    fi;
    nvm_version_greater_than_or_equal_to "${NODE_VERSION}" v0.8.6 && ! nvm_version_greater_than_or_equal_to "${NODE_VERSION}" v1.0.0
}
nvm_normalize_lts () 
{ 
    local LTS;
    LTS="${1-}";
    if [ "$(expr "${LTS}" : '^lts/-[1-9][0-9]*$')" -gt 0 ]; then
        local N;
        N="$(echo "${LTS}" | cut -d '-' -f 2)";
        N=$((N+1));
        local NVM_ALIAS_DIR;
        NVM_ALIAS_DIR="$(nvm_alias_path)";
        local RESULT;
        RESULT="$(command ls "${NVM_ALIAS_DIR}/lts" | command tail -n "${N}" | command head -n 1)";
        if [ "${RESULT}" != '*' ]; then
            nvm_echo "lts/${RESULT}";
        else
            nvm_err 'That many LTS releases do not exist yet.';
            return 2;
        fi;
    else
        nvm_echo "${LTS}";
    fi
}
nvm_normalize_version () 
{ 
    command awk 'BEGIN {
    split(ARGV[1], a, /\./);
    printf "%d%06d%06d\n", a[1], a[2], a[3];
    exit;
  }' "${1#v}"
}
nvm_npm_global_modules () 
{ 
    local NPMLIST;
    local VERSION;
    VERSION="$1";
    NPMLIST=$(nvm use "${VERSION}" >/dev/null && npm list -g --depth=0 2>/dev/null | command sed 1,1d | nvm_grep -v 'UNMET PEER DEPENDENCY');
    local INSTALLS;
    INSTALLS=$(nvm_echo "${NPMLIST}" | command sed -e '/ -> / d' -e '/\(empty\)/ d' -e 's/^.* \(.*@[^ ]*\).*/\1/' -e '/^npm@[^ ]*.*$/ d' | command xargs);
    local LINKS;
    LINKS="$(nvm_echo "${NPMLIST}" | command sed -n 's/.* -> \(.*\)/\1/ p')";
    nvm_echo "${INSTALLS} //// ${LINKS}"
}
nvm_npmrc_bad_news_bears () 
{ 
    local NVM_NPMRC;
    NVM_NPMRC="${1-}";
    if [ -n "${NVM_NPMRC}" ] && [ -f "${NVM_NPMRC}" ] && nvm_grep -Ee '^(prefix|globalconfig) *=' < "${NVM_NPMRC}" > /dev/null; then
        return 0;
    fi;
    return 1
}
nvm_num_version_groups () 
{ 
    local VERSION;
    VERSION="${1-}";
    VERSION="${VERSION#v}";
    VERSION="${VERSION%.}";
    if [ -z "${VERSION}" ]; then
        nvm_echo "0";
        return;
    fi;
    local NVM_NUM_DOTS;
    NVM_NUM_DOTS=$(nvm_echo "${VERSION}" | command sed -e 's/[^\.]//g');
    local NVM_NUM_GROUPS;
    NVM_NUM_GROUPS=".${NVM_NUM_DOTS}";
    nvm_echo "${#NVM_NUM_GROUPS}"
}
nvm_print_alias_path () 
{ 
    local NVM_ALIAS_DIR;
    NVM_ALIAS_DIR="${1-}";
    if [ -z "${NVM_ALIAS_DIR}" ]; then
        nvm_err 'An alias dir is required.';
        return 1;
    fi;
    local ALIAS_PATH;
    ALIAS_PATH="${2-}";
    if [ -z "${ALIAS_PATH}" ]; then
        nvm_err 'An alias path is required.';
        return 2;
    fi;
    local ALIAS;
    ALIAS="${ALIAS_PATH##"${NVM_ALIAS_DIR}"\/}";
    local DEST;
    DEST="$(nvm_alias "${ALIAS}" 2>/dev/null)" || :;
    if [ -n "${DEST}" ]; then
        NVM_NO_COLORS="${NVM_NO_COLORS-}" NVM_LTS="${NVM_LTS-}" DEFAULT=false nvm_print_formatted_alias "${ALIAS}" "${DEST}";
    fi
}
nvm_print_color_code () 
{ 
    case "${1-}" in 
        '0')
            return 0
        ;;
        'r')
            nvm_echo '0;31m'
        ;;
        'R')
            nvm_echo '1;31m'
        ;;
        'g')
            nvm_echo '0;32m'
        ;;
        'G')
            nvm_echo '1;32m'
        ;;
        'b')
            nvm_echo '0;34m'
        ;;
        'B')
            nvm_echo '1;34m'
        ;;
        'c')
            nvm_echo '0;36m'
        ;;
        'C')
            nvm_echo '1;36m'
        ;;
        'm')
            nvm_echo '0;35m'
        ;;
        'M')
            nvm_echo '1;35m'
        ;;
        'y')
            nvm_echo '0;33m'
        ;;
        'Y')
            nvm_echo '1;33m'
        ;;
        'k')
            nvm_echo '0;30m'
        ;;
        'K')
            nvm_echo '1;30m'
        ;;
        'e')
            nvm_echo '0;37m'
        ;;
        'W')
            nvm_echo '1;37m'
        ;;
        *)
            nvm_err "Invalid color code: ${1-}";
            return 1
        ;;
    esac
}
nvm_print_default_alias () 
{ 
    local ALIAS;
    ALIAS="${1-}";
    if [ -z "${ALIAS}" ]; then
        nvm_err 'A default alias is required.';
        return 1;
    fi;
    local DEST;
    DEST="$(nvm_print_implicit_alias local "${ALIAS}")";
    if [ -n "${DEST}" ]; then
        NVM_NO_COLORS="${NVM_NO_COLORS-}" DEFAULT=true nvm_print_formatted_alias "${ALIAS}" "${DEST}";
    fi
}
nvm_print_formatted_alias () 
{ 
    local ALIAS;
    ALIAS="${1-}";
    local DEST;
    DEST="${2-}";
    local VERSION;
    VERSION="${3-}";
    if [ -z "${VERSION}" ]; then
        VERSION="$(nvm_version "${DEST}")" || :;
    fi;
    local VERSION_FORMAT;
    local ALIAS_FORMAT;
    local DEST_FORMAT;
    local INSTALLED_COLOR;
    local SYSTEM_COLOR;
    local CURRENT_COLOR;
    local NOT_INSTALLED_COLOR;
    local DEFAULT_COLOR;
    local LTS_COLOR;
    INSTALLED_COLOR=$(nvm_get_colors 1);
    SYSTEM_COLOR=$(nvm_get_colors 2);
    CURRENT_COLOR=$(nvm_get_colors 3);
    NOT_INSTALLED_COLOR=$(nvm_get_colors 4);
    DEFAULT_COLOR=$(nvm_get_colors 5);
    LTS_COLOR=$(nvm_get_colors 6);
    ALIAS_FORMAT='%s';
    DEST_FORMAT='%s';
    VERSION_FORMAT='%s';
    local NEWLINE;
    NEWLINE='\n';
    if [ "_${DEFAULT}" = '_true' ]; then
        NEWLINE=' (default)\n';
    fi;
    local ARROW;
    ARROW='->';
    if [ -z "${NVM_NO_COLORS}" ] && nvm_has_colors; then
        ARROW='\033[0;90m->\033[0m';
        if [ "_${DEFAULT}" = '_true' ]; then
            NEWLINE=" \033[${DEFAULT_COLOR}(default)\033[0m\n";
        fi;
        if [ "_${VERSION}" = "_${NVM_CURRENT-}" ]; then
            ALIAS_FORMAT="\033[${CURRENT_COLOR}%s\033[0m";
            DEST_FORMAT="\033[${CURRENT_COLOR}%s\033[0m";
            VERSION_FORMAT="\033[${CURRENT_COLOR}%s\033[0m";
        else
            if nvm_is_version_installed "${VERSION}"; then
                ALIAS_FORMAT="\033[${INSTALLED_COLOR}%s\033[0m";
                DEST_FORMAT="\033[${INSTALLED_COLOR}%s\033[0m";
                VERSION_FORMAT="\033[${INSTALLED_COLOR}%s\033[0m";
            else
                if [ "${VERSION}" = '∞' ] || [ "${VERSION}" = 'N/A' ]; then
                    ALIAS_FORMAT="\033[${NOT_INSTALLED_COLOR}%s\033[0m";
                    DEST_FORMAT="\033[${NOT_INSTALLED_COLOR}%s\033[0m";
                    VERSION_FORMAT="\033[${NOT_INSTALLED_COLOR}%s\033[0m";
                fi;
            fi;
        fi;
        if [ "_${NVM_LTS-}" = '_true' ]; then
            ALIAS_FORMAT="\033[${LTS_COLOR}%s\033[0m";
        fi;
        if [ "_${DEST%/*}" = "_lts" ]; then
            DEST_FORMAT="\033[${LTS_COLOR}%s\033[0m";
        fi;
    else
        if [ "_${VERSION}" != '_∞' ] && [ "_${VERSION}" != '_N/A' ]; then
            VERSION_FORMAT='%s *';
        fi;
    fi;
    if [ "${DEST}" = "${VERSION}" ]; then
        command printf -- "${ALIAS_FORMAT} ${ARROW} ${VERSION_FORMAT}${NEWLINE}" "${ALIAS}" "${DEST}";
    else
        command printf -- "${ALIAS_FORMAT} ${ARROW} ${DEST_FORMAT} (${ARROW} ${VERSION_FORMAT})${NEWLINE}" "${ALIAS}" "${DEST}" "${VERSION}";
    fi
}
nvm_print_implicit_alias () 
{ 
    if [ "_$1" != "_local" ] && [ "_$1" != "_remote" ]; then
        nvm_err "nvm_print_implicit_alias must be specified with local or remote as the first argument.";
        return 1;
    fi;
    local NVM_IMPLICIT;
    NVM_IMPLICIT="$2";
    if ! nvm_validate_implicit_alias "${NVM_IMPLICIT}"; then
        return 2;
    fi;
    local NVM_IOJS_PREFIX;
    NVM_IOJS_PREFIX="$(nvm_iojs_prefix)";
    local NVM_NODE_PREFIX;
    NVM_NODE_PREFIX="$(nvm_node_prefix)";
    local NVM_COMMAND;
    local NVM_ADD_PREFIX_COMMAND;
    local LAST_TWO;
    case "${NVM_IMPLICIT}" in 
        "${NVM_IOJS_PREFIX}")
            NVM_COMMAND="nvm_ls_remote_iojs";
            NVM_ADD_PREFIX_COMMAND="nvm_add_iojs_prefix";
            if [ "_$1" = "_local" ]; then
                NVM_COMMAND="nvm_ls ${NVM_IMPLICIT}";
            fi;
            nvm_is_zsh && setopt local_options shwordsplit;
            local NVM_IOJS_VERSION;
            local EXIT_CODE;
            NVM_IOJS_VERSION="$(${NVM_COMMAND})" && :;
            EXIT_CODE="$?";
            if [ "_${EXIT_CODE}" = "_0" ]; then
                NVM_IOJS_VERSION="$(nvm_echo "${NVM_IOJS_VERSION}" | command sed "s/^${NVM_IMPLICIT}-//" | nvm_grep -e '^v' | command cut -c2- | command cut -d . -f 1,2 | uniq | command tail -1)";
            fi;
            if [ "_$NVM_IOJS_VERSION" = "_N/A" ]; then
                nvm_echo 'N/A';
            else
                ${NVM_ADD_PREFIX_COMMAND} "${NVM_IOJS_VERSION}";
            fi;
            return $EXIT_CODE
        ;;
        "${NVM_NODE_PREFIX}")
            nvm_echo 'stable';
            return
        ;;
        *)
            NVM_COMMAND="nvm_ls_remote";
            if [ "_$1" = "_local" ]; then
                NVM_COMMAND="nvm_ls node";
            fi;
            nvm_is_zsh && setopt local_options shwordsplit;
            LAST_TWO=$($NVM_COMMAND | nvm_grep -e '^v' | command cut -c2- | command cut -d . -f 1,2 | uniq)
        ;;
    esac;
    local MINOR;
    local STABLE;
    local UNSTABLE;
    local MOD;
    local NORMALIZED_VERSION;
    nvm_is_zsh && setopt local_options shwordsplit;
    for MINOR in $LAST_TWO;
    do
        NORMALIZED_VERSION="$(nvm_normalize_version "$MINOR")";
        if [ "_0${NORMALIZED_VERSION#?}" != "_$NORMALIZED_VERSION" ]; then
            STABLE="$MINOR";
        else
            MOD="$(awk 'BEGIN { print int(ARGV[1] / 1000000) % 2 ; exit(0) }' "${NORMALIZED_VERSION}")";
            if [ "${MOD}" -eq 0 ]; then
                STABLE="${MINOR}";
            else
                if [ "${MOD}" -eq 1 ]; then
                    UNSTABLE="${MINOR}";
                fi;
            fi;
        fi;
    done;
    if [ "_$2" = '_stable' ]; then
        nvm_echo "${STABLE}";
    else
        if [ "_$2" = '_unstable' ]; then
            nvm_echo "${UNSTABLE:-"N/A"}";
        fi;
    fi
}
nvm_print_npm_version () 
{ 
    if nvm_has "npm"; then
        command printf " (npm v$(npm --version 2>/dev/null))";
    fi
}
nvm_print_versions () 
{ 
    local NVM_CURRENT;
    NVM_CURRENT=$(nvm_ls_current);
    local INSTALLED_COLOR;
    local SYSTEM_COLOR;
    local CURRENT_COLOR;
    local NOT_INSTALLED_COLOR;
    local DEFAULT_COLOR;
    local LTS_COLOR;
    local NVM_HAS_COLORS;
    NVM_HAS_COLORS=0;
    INSTALLED_COLOR=$(nvm_get_colors 1);
    SYSTEM_COLOR=$(nvm_get_colors 2);
    CURRENT_COLOR=$(nvm_get_colors 3);
    NOT_INSTALLED_COLOR=$(nvm_get_colors 4);
    DEFAULT_COLOR=$(nvm_get_colors 5);
    LTS_COLOR=$(nvm_get_colors 6);
    if [ -z "${NVM_NO_COLORS-}" ] && nvm_has_colors; then
        NVM_HAS_COLORS=1;
    fi;
    command awk -v remote_versions="$(printf '%s' "${1-}" | tr '\n' '|')" -v installed_versions="$(nvm_ls | tr '\n' '|')" -v current="$NVM_CURRENT" -v installed_color="$INSTALLED_COLOR" -v system_color="$SYSTEM_COLOR" -v current_color="$CURRENT_COLOR" -v default_color="$DEFAULT_COLOR" -v old_lts_color="$DEFAULT_COLOR" -v has_colors="$NVM_HAS_COLORS" '
function alen(arr, i, len) { len=0; for(i in arr) len++; return len; }
BEGIN {
  fmt_installed = has_colors ? (installed_color ? "\033[" installed_color "%15s\033[0m" : "%15s") : "%15s *";
  fmt_system = has_colors ? (system_color ? "\033[" system_color "%15s\033[0m" : "%15s") : "%15s *";
  fmt_current = has_colors ? (current_color ? "\033[" current_color "->%13s\033[0m" : "%15s") : "->%13s *";

  latest_lts_color = current_color;
  sub(/0;/, "1;", latest_lts_color);

  fmt_latest_lts = has_colors && latest_lts_color ? ("\033[" latest_lts_color " (Latest LTS: %s)\033[0m") : " (Latest LTS: %s)";
  fmt_old_lts = has_colors && old_lts_color ? ("\033[" old_lts_color " (LTS: %s)\033[0m") : " (LTS: %s)";

  split(remote_versions, lines, "|");
  split(installed_versions, installed, "|");
  rows = alen(lines);

  for (n = 1; n <= rows; n++) {
    split(lines[n], fields, "[[:blank:]]+");
    cols = alen(fields);
    version = fields[1];
    is_installed = 0;

    for (i in installed) {
      if (version == installed[i]) {
        is_installed = 1;
        break;
      }
    }

    fmt_version = "%15s";
    if (version == current) {
      fmt_version = fmt_current;
    } else if (version == "system") {
      fmt_version = fmt_system;
    } else if (is_installed) {
      fmt_version = fmt_installed;
    }

    padding = (!has_colors && is_installed) ? "" : "  ";

    if (cols == 1) {
      formatted = sprintf(fmt_version, version);
    } else if (cols == 2) {
      formatted = sprintf((fmt_version padding fmt_old_lts), version, fields[2]);
    } else if (cols == 3 && fields[3] == "*") {
      formatted = sprintf((fmt_version padding fmt_latest_lts), version, fields[2]);
    }

    output[n] = formatted;
  }

  for (n = 1; n <= rows; n++) {
    print output[n]
  }

  exit
}'
}
nvm_process_parameters () 
{ 
    local NVM_AUTO_MODE;
    NVM_AUTO_MODE='use';
    while [ "$#" -ne 0 ]; do
        case "$1" in 
            --install)
                NVM_AUTO_MODE='install'
            ;;
            --no-use)
                NVM_AUTO_MODE='none'
            ;;
        esac;
        shift;
    done;
    nvm_auto "${NVM_AUTO_MODE}"
}
nvm_prompt_info () 
{ 
    [[ -f "$NVM_DIR/nvm.sh" ]] || return;
    local nvm_prompt;
    nvm_prompt=$(node -v 2>/dev/null);
    [[ "${nvm_prompt}x" == "x" ]] && return;
    nvm_prompt=${nvm_prompt:1};
    echo "${OSH_THEME_NVM_PROMPT_PREFIX}${nvm_prompt}${OSH_THEME_NVM_PROMPT_SUFFIX}"
}
nvm_rc_version () 
{ 
    export NVM_RC_VERSION='';
    local NVMRC_PATH;
    NVMRC_PATH="$(nvm_find_nvmrc)";
    if [ ! -e "${NVMRC_PATH}" ]; then
        if [ "${NVM_SILENT:-0}" -ne 1 ]; then
            nvm_err "No .nvmrc file found";
        fi;
        return 1;
    fi;
    NVM_RC_VERSION="$(command head -n 1 "${NVMRC_PATH}" | command tr -d '\r')" || command printf '';
    if [ -z "${NVM_RC_VERSION}" ]; then
        if [ "${NVM_SILENT:-0}" -ne 1 ]; then
            nvm_err "Warning: empty .nvmrc file found at \"${NVMRC_PATH}\"";
        fi;
        return 2;
    fi;
    if [ "${NVM_SILENT:-0}" -ne 1 ]; then
        nvm_echo "Found '${NVMRC_PATH}' with version <${NVM_RC_VERSION}>";
    fi
}
nvm_remote_version () 
{ 
    local PATTERN;
    PATTERN="${1-}";
    local VERSION;
    if nvm_validate_implicit_alias "${PATTERN}" 2> /dev/null; then
        case "${PATTERN}" in 
            "$(nvm_iojs_prefix)")
                VERSION="$(NVM_LTS="${NVM_LTS-}" nvm_ls_remote_iojs | command tail -1)" && :
            ;;
            *)
                VERSION="$(NVM_LTS="${NVM_LTS-}" nvm_ls_remote "${PATTERN}")" && :
            ;;
        esac;
    else
        VERSION="$(NVM_LTS="${NVM_LTS-}" nvm_remote_versions "${PATTERN}" | command tail -1)";
    fi;
    if [ -n "${NVM_VERSION_ONLY-}" ]; then
        command awk 'BEGIN {
      n = split(ARGV[1], a);
      print a[1]
    }' "${VERSION}";
    else
        nvm_echo "${VERSION}";
    fi;
    if [ "${VERSION}" = 'N/A' ]; then
        return 3;
    fi
}
nvm_remote_versions () 
{ 
    local NVM_IOJS_PREFIX;
    NVM_IOJS_PREFIX="$(nvm_iojs_prefix)";
    local NVM_NODE_PREFIX;
    NVM_NODE_PREFIX="$(nvm_node_prefix)";
    local PATTERN;
    PATTERN="${1-}";
    local NVM_FLAVOR;
    if [ -n "${NVM_LTS-}" ]; then
        NVM_FLAVOR="${NVM_NODE_PREFIX}";
    fi;
    case "${PATTERN}" in 
        "${NVM_IOJS_PREFIX}" | "io.js")
            NVM_FLAVOR="${NVM_IOJS_PREFIX}";
            unset PATTERN
        ;;
        "${NVM_NODE_PREFIX}")
            NVM_FLAVOR="${NVM_NODE_PREFIX}";
            unset PATTERN
        ;;
    esac;
    if nvm_validate_implicit_alias "${PATTERN-}" 2> /dev/null; then
        nvm_err 'Implicit aliases are not supported in nvm_remote_versions.';
        return 1;
    fi;
    local NVM_LS_REMOTE_EXIT_CODE;
    NVM_LS_REMOTE_EXIT_CODE=0;
    local NVM_LS_REMOTE_PRE_MERGED_OUTPUT;
    NVM_LS_REMOTE_PRE_MERGED_OUTPUT='';
    local NVM_LS_REMOTE_POST_MERGED_OUTPUT;
    NVM_LS_REMOTE_POST_MERGED_OUTPUT='';
    if [ -z "${NVM_FLAVOR-}" ] || [ "${NVM_FLAVOR-}" = "${NVM_NODE_PREFIX}" ]; then
        local NVM_LS_REMOTE_OUTPUT;
        NVM_LS_REMOTE_OUTPUT="$(NVM_LTS="${NVM_LTS-}" nvm_ls_remote "${PATTERN-}") " && :;
        NVM_LS_REMOTE_EXIT_CODE=$?;
        NVM_LS_REMOTE_PRE_MERGED_OUTPUT="${NVM_LS_REMOTE_OUTPUT%%v4\.0\.0*}";
        NVM_LS_REMOTE_POST_MERGED_OUTPUT="${NVM_LS_REMOTE_OUTPUT#"$NVM_LS_REMOTE_PRE_MERGED_OUTPUT"}";
    fi;
    local NVM_LS_REMOTE_IOJS_EXIT_CODE;
    NVM_LS_REMOTE_IOJS_EXIT_CODE=0;
    local NVM_LS_REMOTE_IOJS_OUTPUT;
    NVM_LS_REMOTE_IOJS_OUTPUT='';
    if [ -z "${NVM_LTS-}" ] && { 
        [ -z "${NVM_FLAVOR-}" ] || [ "${NVM_FLAVOR-}" = "${NVM_IOJS_PREFIX}" ]
    }; then
        NVM_LS_REMOTE_IOJS_OUTPUT=$(nvm_ls_remote_iojs "${PATTERN-}") && :;
        NVM_LS_REMOTE_IOJS_EXIT_CODE=$?;
    fi;
    VERSIONS="$(nvm_echo "${NVM_LS_REMOTE_PRE_MERGED_OUTPUT}
${NVM_LS_REMOTE_IOJS_OUTPUT}
${NVM_LS_REMOTE_POST_MERGED_OUTPUT}" | nvm_grep -v "N/A" | command sed '/^ *$/d')";
    if [ -z "${VERSIONS}" ]; then
        nvm_echo 'N/A';
        return 3;
    fi;
    nvm_echo "${VERSIONS}" | command sed 's/ *$//g';
    return $NVM_LS_REMOTE_EXIT_CODE || $NVM_LS_REMOTE_IOJS_EXIT_CODE
}
nvm_resolve_alias () 
{ 
    if [ -z "${1-}" ]; then
        return 1;
    fi;
    local PATTERN;
    PATTERN="${1-}";
    local ALIAS;
    ALIAS="${PATTERN}";
    local ALIAS_TEMP;
    local SEEN_ALIASES;
    SEEN_ALIASES="${ALIAS}";
    while true; do
        ALIAS_TEMP="$(nvm_alias "${ALIAS}" 2>/dev/null || nvm_echo)";
        if [ -z "${ALIAS_TEMP}" ]; then
            break;
        fi;
        if command printf "${SEEN_ALIASES}" | nvm_grep -q -e "^${ALIAS_TEMP}$"; then
            ALIAS="∞";
            break;
        fi;
        SEEN_ALIASES="${SEEN_ALIASES}\\n${ALIAS_TEMP}";
        ALIAS="${ALIAS_TEMP}";
    done;
    if [ -n "${ALIAS}" ] && [ "_${ALIAS}" != "_${PATTERN}" ]; then
        local NVM_IOJS_PREFIX;
        NVM_IOJS_PREFIX="$(nvm_iojs_prefix)";
        local NVM_NODE_PREFIX;
        NVM_NODE_PREFIX="$(nvm_node_prefix)";
        case "${ALIAS}" in 
            '∞' | "${NVM_IOJS_PREFIX}" | "${NVM_IOJS_PREFIX}-" | "${NVM_NODE_PREFIX}")
                nvm_echo "${ALIAS}"
            ;;
            *)
                nvm_ensure_version_prefix "${ALIAS}"
            ;;
        esac;
        return 0;
    fi;
    if nvm_validate_implicit_alias "${PATTERN}" 2> /dev/null; then
        local IMPLICIT;
        IMPLICIT="$(nvm_print_implicit_alias local "${PATTERN}" 2>/dev/null)";
        if [ -n "${IMPLICIT}" ]; then
            nvm_ensure_version_prefix "${IMPLICIT}";
        fi;
    fi;
    return 2
}
nvm_resolve_local_alias () 
{ 
    if [ -z "${1-}" ]; then
        return 1;
    fi;
    local VERSION;
    local EXIT_CODE;
    VERSION="$(nvm_resolve_alias "${1-}")";
    EXIT_CODE=$?;
    if [ -z "${VERSION}" ]; then
        return $EXIT_CODE;
    fi;
    if [ "_${VERSION}" != '_∞' ]; then
        nvm_version "${VERSION}";
    else
        nvm_echo "${VERSION}";
    fi
}
nvm_sanitize_path () 
{ 
    local SANITIZED_PATH;
    SANITIZED_PATH="${1-}";
    if [ "_${SANITIZED_PATH}" != "_${NVM_DIR}" ]; then
        SANITIZED_PATH="$(nvm_echo "${SANITIZED_PATH}" | command sed -e "s#${NVM_DIR}#\${NVM_DIR}#g")";
    fi;
    if [ "_${SANITIZED_PATH}" != "_${HOME}" ]; then
        SANITIZED_PATH="$(nvm_echo "${SANITIZED_PATH}" | command sed -e "s#${HOME}#\${HOME}#g")";
    fi;
    nvm_echo "${SANITIZED_PATH}"
}
nvm_set_colors () 
{ 
    if [ "${#1}" -eq 5 ] && nvm_echo "$1" | nvm_grep -E "^[rRgGbBcCyYmMkKeW]{1,}$" > /dev/null; then
        local INSTALLED_COLOR;
        local LTS_AND_SYSTEM_COLOR;
        local CURRENT_COLOR;
        local NOT_INSTALLED_COLOR;
        local DEFAULT_COLOR;
        INSTALLED_COLOR="$(echo "$1" | awk '{ print substr($0, 1, 1); }')";
        LTS_AND_SYSTEM_COLOR="$(echo "$1" | awk '{ print substr($0, 2, 1); }')";
        CURRENT_COLOR="$(echo "$1" | awk '{ print substr($0, 3, 1); }')";
        NOT_INSTALLED_COLOR="$(echo "$1" | awk '{ print substr($0, 4, 1); }')";
        DEFAULT_COLOR="$(echo "$1" | awk '{ print substr($0, 5, 1); }')";
        if ! nvm_has_colors; then
            nvm_echo "Setting colors to: ${INSTALLED_COLOR} ${LTS_AND_SYSTEM_COLOR} ${CURRENT_COLOR} ${NOT_INSTALLED_COLOR} ${DEFAULT_COLOR}";
            nvm_echo "WARNING: Colors may not display because they are not supported in this shell.";
        else
            nvm_echo_with_colors "Setting colors to: $(nvm_wrap_with_color_code "${INSTALLED_COLOR}" "${INSTALLED_COLOR}")$(nvm_wrap_with_color_code "${LTS_AND_SYSTEM_COLOR}" "${LTS_AND_SYSTEM_COLOR}")$(nvm_wrap_with_color_code "${CURRENT_COLOR}" "${CURRENT_COLOR}")$(nvm_wrap_with_color_code "${NOT_INSTALLED_COLOR}" "${NOT_INSTALLED_COLOR}")$(nvm_wrap_with_color_code "${DEFAULT_COLOR}" "${DEFAULT_COLOR}")";
        fi;
        export NVM_COLORS="$1";
    else
        return 17;
    fi
}
nvm_stdout_is_terminal () 
{ 
    [ -t 1 ]
}
nvm_strip_iojs_prefix () 
{ 
    local NVM_IOJS_PREFIX;
    NVM_IOJS_PREFIX="$(nvm_iojs_prefix)";
    if [ "${1-}" = "${NVM_IOJS_PREFIX}" ]; then
        nvm_echo;
    else
        nvm_echo "${1#"${NVM_IOJS_PREFIX}"-}";
    fi
}
nvm_strip_path () 
{ 
    if [ -z "${NVM_DIR-}" ]; then
        nvm_err '${NVM_DIR} not set!';
        return 1;
    fi;
    command printf %s "${1-}" | command awk -v NVM_DIR="${NVM_DIR}" -v RS=: '
  index($0, NVM_DIR) == 1 {
    path = substr($0, length(NVM_DIR) + 1)
    if (path ~ "^(/versions/[^/]*)?/[^/]*'"${2-}"'.*$") { next }
  }
  { print }' | command paste -s -d: -
}
nvm_supports_xz () 
{ 
    if [ -z "${1-}" ]; then
        return 1;
    fi;
    local NVM_OS;
    NVM_OS="$(nvm_get_os)";
    if [ "_${NVM_OS}" = '_darwin' ]; then
        local MACOS_VERSION;
        MACOS_VERSION="$(sw_vers -productVersion)";
        if nvm_version_greater "10.9.0" "${MACOS_VERSION}"; then
            return 1;
        fi;
    else
        if [ "_${NVM_OS}" = '_freebsd' ]; then
            if ! [ -e '/usr/lib/liblzma.so' ]; then
                return 1;
            fi;
        else
            if ! command which xz > /dev/null 2>&1; then
                return 1;
            fi;
        fi;
    fi;
    if nvm_is_merged_node_version "${1}"; then
        return 0;
    fi;
    if nvm_version_greater_than_or_equal_to "${1}" "0.12.10" && nvm_version_greater "0.13.0" "${1}"; then
        return 0;
    fi;
    if nvm_version_greater_than_or_equal_to "${1}" "0.10.42" && nvm_version_greater "0.11.0" "${1}"; then
        return 0;
    fi;
    case "${NVM_OS}" in 
        darwin)
            nvm_version_greater_than_or_equal_to "${1}" "2.3.2"
        ;;
        *)
            nvm_version_greater_than_or_equal_to "${1}" "1.0.0"
        ;;
    esac;
    return $?
}
nvm_tree_contains_path () 
{ 
    local tree;
    tree="${1-}";
    local node_path;
    node_path="${2-}";
    if [ "@${tree}@" = "@@" ] || [ "@${node_path}@" = "@@" ]; then
        nvm_err "both the tree and the node path are required";
        return 2;
    fi;
    local previous_pathdir;
    previous_pathdir="${node_path}";
    local pathdir;
    pathdir=$(dirname "${previous_pathdir}");
    while [ "${pathdir}" != '' ] && [ "${pathdir}" != '.' ] && [ "${pathdir}" != '/' ] && [ "${pathdir}" != "${tree}" ] && [ "${pathdir}" != "${previous_pathdir}" ]; do
        previous_pathdir="${pathdir}";
        pathdir=$(dirname "${previous_pathdir}");
    done;
    [ "${pathdir}" = "${tree}" ]
}
nvm_use_if_needed () 
{ 
    if [ "_${1-}" = "_$(nvm_ls_current)" ]; then
        return;
    fi;
    nvm use "$@"
}
nvm_validate_implicit_alias () 
{ 
    local NVM_IOJS_PREFIX;
    NVM_IOJS_PREFIX="$(nvm_iojs_prefix)";
    local NVM_NODE_PREFIX;
    NVM_NODE_PREFIX="$(nvm_node_prefix)";
    case "$1" in 
        "stable" | "unstable" | "${NVM_IOJS_PREFIX}" | "${NVM_NODE_PREFIX}")
            return
        ;;
        *)
            nvm_err "Only implicit aliases 'stable', 'unstable', '${NVM_IOJS_PREFIX}', and '${NVM_NODE_PREFIX}' are supported.";
            return 1
        ;;
    esac
}
nvm_version () 
{ 
    local PATTERN;
    PATTERN="${1-}";
    local VERSION;
    if [ -z "${PATTERN}" ]; then
        PATTERN='current';
    fi;
    if [ "${PATTERN}" = "current" ]; then
        nvm_ls_current;
        return $?;
    fi;
    local NVM_NODE_PREFIX;
    NVM_NODE_PREFIX="$(nvm_node_prefix)";
    case "_${PATTERN}" in 
        "_${NVM_NODE_PREFIX}" | "_${NVM_NODE_PREFIX}-")
            PATTERN="stable"
        ;;
    esac;
    VERSION="$(nvm_ls "${PATTERN}" | command tail -1)";
    if [ -z "${VERSION}" ] || [ "_${VERSION}" = "_N/A" ]; then
        nvm_echo "N/A";
        return 3;
    fi;
    nvm_echo "${VERSION}"
}
nvm_version_dir () 
{ 
    local NVM_WHICH_DIR;
    NVM_WHICH_DIR="${1-}";
    if [ -z "${NVM_WHICH_DIR}" ] || [ "${NVM_WHICH_DIR}" = "new" ]; then
        nvm_echo "${NVM_DIR}/versions/node";
    else
        if [ "_${NVM_WHICH_DIR}" = "_iojs" ]; then
            nvm_echo "${NVM_DIR}/versions/io.js";
        else
            if [ "_${NVM_WHICH_DIR}" = "_old" ]; then
                nvm_echo "${NVM_DIR}";
            else
                nvm_err 'unknown version dir';
                return 3;
            fi;
        fi;
    fi
}
nvm_version_greater () 
{ 
    command awk 'BEGIN {
    if (ARGV[1] == "" || ARGV[2] == "") exit(1)
    split(ARGV[1], a, /\./);
    split(ARGV[2], b, /\./);
    for (i=1; i<=3; i++) {
      if (a[i] && a[i] !~ /^[0-9]+$/) exit(2);
      if (b[i] && b[i] !~ /^[0-9]+$/) { exit(0); }
      if (a[i] < b[i]) exit(3);
      else if (a[i] > b[i]) exit(0);
    }
    exit(4)
  }' "${1#v}" "${2#v}"
}
nvm_version_greater_than_or_equal_to () 
{ 
    command awk 'BEGIN {
    if (ARGV[1] == "" || ARGV[2] == "") exit(1)
    split(ARGV[1], a, /\./);
    split(ARGV[2], b, /\./);
    for (i=1; i<=3; i++) {
      if (a[i] && a[i] !~ /^[0-9]+$/) exit(2);
      if (a[i] < b[i]) exit(3);
      else if (a[i] > b[i]) exit(0);
    }
    exit(0)
  }' "${1#v}" "${2#v}"
}
nvm_version_path () 
{ 
    local VERSION;
    VERSION="${1-}";
    if [ -z "${VERSION}" ]; then
        nvm_err 'version is required';
        return 3;
    else
        if nvm_is_iojs_version "${VERSION}"; then
            nvm_echo "$(nvm_version_dir iojs)/$(nvm_strip_iojs_prefix "${VERSION}")";
        else
            if nvm_version_greater 0.12.0 "${VERSION}"; then
                nvm_echo "$(nvm_version_dir old)/${VERSION}";
            else
                nvm_echo "$(nvm_version_dir new)/${VERSION}";
            fi;
        fi;
    fi
}
nvm_wrap_with_color_code () 
{ 
    local CODE;
    CODE="$(nvm_print_color_code "${1}" 2>/dev/null ||:)";
    local TEXT;
    TEXT="${2-}";
    if nvm_has_colors && [ -n "${CODE}" ]; then
        nvm_echo_with_colors "\033[${CODE}${TEXT}\033[0m";
    else
        nvm_echo "${TEXT}";
    fi
}
open_command () 
{ 
    local open_cmd;
    case "$OSTYPE" in 
        darwin*)
            open_cmd='open'
        ;;
        cygwin*)
            open_cmd='cygstart'
        ;;
        linux*)
            open_cmd='xdg-open'
        ;;
        msys*)
            open_cmd='start ""'
        ;;
        *)
            echo "Platform $OSTYPE not supported";
            return 1
        ;;
    esac;
    if [[ "$OSTYPE" == darwin* ]]; then
        $open_cmd "$@" &> /dev/null;
    else
        nohup $open_cmd "$@" &> /dev/null;
    fi
}
parse_git_dirty () 
{ 
    local STATUS=;
    local -a FLAGS=('--porcelain');
    if [[ $(_omb_prompt_git config --get oh-my-bash.hide-dirty) != 1 ]]; then
        if ((${_omb_git_post_1_7_2:=$(git_compare_version "1.7.2")} > 0)); then
            FLAGS+=('--ignore-submodules=dirty');
        fi;
        if [[ $DISABLE_UNTRACKED_FILES_DIRTY == "true" ]]; then
            FLAGS+=('--untracked-files=no');
        fi;
        STATUS=$(_omb_prompt_git status "${FLAGS[@]}" 2> /dev/null | tail -n1);
    fi;
    if [[ -n $STATUS ]]; then
        echo "$OSH_THEME_GIT_PROMPT_DIRTY";
    else
        echo "$OSH_THEME_GIT_PROMPT_CLEAN";
    fi
}
passgen () 
{ 
    local i pass length=${1:-4};
    pass=$(echo $(for i in $(eval echo "{1..$length}"); do pickfrom /usr/share/dict/words; done));
    echo "With spaces (easier to memorize): $pass";
    echo "Without (use this as the password): $(echo $pass | tr -d ' ')"
}
pickfrom () 
{ 
    local file=$1;
    [ -z "$file" ] && reference "$FUNCNAME" && return;
    length=$(wc -l < "$file");
    n=$( ($RANDOM \* "$length" / 32768 + 1));
    head -n "$n" "$file" | tail -1
}
prompt () 
{ 
    _omb_theme_PROMPT_COMMAND "$@"
}
prompt_char () 
{ 
    scm_char
}
prompt_command () 
{ 
    _omb_theme_PROMPT_COMMAND "$@"
}
prompt_setter () 
{ 
    _omb_theme_PROMPT_COMMAND "$@"
}
pure_setter () 
{ 
    _omb_theme_PROMPT_COMMAND "$@"
}
pushover () 
{ 
    PUSHOVERURL="https://api.pushover.net/1/messages.json";
    API_KEY=$PUSHOVER_API_KEY;
    USER_KEY=$PUSHOVER_USER_KEY;
    DEVICE=$PUSHOVER_DEVICE;
    TITLE="${1}";
    MESSAGE="${2}";
    curl -F "token=${API_KEY}" -F "user=${USER_KEY}" -F "device=${DEVICE}" -F "title=${TITLE}" -F "message=${MESSAGE}" "${PUSHOVERURL}" > /dev/null 2>&1
}
py_interp_prompt () 
{ 
    _omb_prompt_print_python_version "$@"
}
python_version_prompt () 
{ 
    _omb_prompt_print_python_env "$@"
}
quiet () 
{ 
    "$@" &> /dev/null &
}
quote () 
{ 
    local quoted=${1//\'/\'\\\'\'};
    printf "'%s'" "$quoted"
}
quote_readline () 
{ 
    local ret;
    _quote_readline_by_ref "$1" ret;
    printf %s "$ret"
}
rbenv_version_prompt () 
{ 
    _omb_prompt_print_rbenv "$@"
}
rbfu_version_prompt () 
{ 
    _omb_prompt_print_rbfu "$@"
}
ruby_version_prompt () 
{ 
    _omb_prompt_print_ruby_env "$@"
}
rvm_version_prompt () 
{ 
    _omb_prompt_print_rvm "$@"
}
safe_append_prompt_command () 
{ 
    _omb_util_add_prompt_command "$@"
}
scm () 
{ 
    if [[ "$SCM_CHECK" = false ]]; then
        SCM=$SCM_NONE;
    else
        if [[ -f .git/HEAD ]]; then
            SCM=$SCM_GIT;
        else
            if _omb_util_binary_exists git && [[ -n "$(_omb_prompt_git rev-parse --is-inside-work-tree 2> /dev/null)" ]]; then
                SCM=$SCM_GIT;
            else
                if [[ -d .hg ]]; then
                    SCM=$SCM_HG;
                else
                    if _omb_util_binary_exists hg && [[ -n "$(command hg root 2> /dev/null)" ]]; then
                        SCM=$SCM_HG;
                    else
                        if [[ -d .svn ]]; then
                            SCM=$SCM_SVN;
                        else
                            SCM=$SCM_NONE;
                        fi;
                    fi;
                fi;
            fi;
        fi;
    fi
}
scm_char () 
{ 
    scm_prompt_char;
    echo -e "${SCM_THEME_CHAR_PREFIX}${SCM_CHAR}${SCM_THEME_CHAR_SUFFIX}"
}
scm_prompt_char () 
{ 
    if [[ -z $SCM ]]; then
        scm;
    fi;
    if [[ $SCM == $SCM_GIT ]]; then
        SCM_CHAR=$SCM_GIT_CHAR;
    else
        if [[ $SCM == $SCM_HG ]]; then
            SCM_CHAR=$SCM_HG_CHAR;
        else
            if [[ $SCM == $SCM_SVN ]]; then
                SCM_CHAR=$SCM_SVN_CHAR;
            else
                SCM_CHAR=$SCM_NONE_CHAR;
            fi;
        fi;
    fi
}
scm_prompt_char_info () 
{ 
    scm_prompt_char;
    echo -ne "${SCM_THEME_CHAR_PREFIX}${SCM_CHAR}${SCM_THEME_CHAR_SUFFIX}";
    scm_prompt_info_common
}
scm_prompt_info () 
{ 
    scm;
    scm_prompt_char;
    scm_prompt_info_common
}
scm_prompt_info_common () 
{ 
    SCM_DIRTY=0;
    SCM_STATE='';
    if [[ ${SCM} == ${SCM_GIT} ]]; then
        if [[ ${SCM_GIT_SHOW_MINIMAL_INFO} == true ]]; then
            git_prompt_minimal_info;
        else
            git_prompt_info;
        fi;
        return;
    fi;
    [[ ${SCM} == ${SCM_HG} ]] && hg_prompt_info && return;
    [[ ${SCM} == ${SCM_SVN} ]] && svn_prompt_info && return
}
scm_prompt_vars () 
{ 
    scm;
    scm_prompt_char;
    SCM_DIRTY=0;
    SCM_STATE='';
    [[ $SCM == $SCM_GIT ]] && git_prompt_vars && return;
    [[ $SCM == $SCM_HG ]] && hg_prompt_vars && return;
    [[ $SCM == $SCM_SVN ]] && svn_prompt_vars && return
}
seek_confirmation () 
{ 
    printf "\\n${_omb_term_bold}%s${_omb_term_reset}" "$@";
    read -rp " (y/n) " -n 1;
    printf "\\n"
}
set_bash_prompt () 
{ 
    _omb_theme_PROMPT_COMMAND "$@"
}
showa () 
{ 
    /usr/bin/grep --color=always -i -a1 "$@" ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc
}
spectrum_bls () 
{ 
    local code;
    for code in {000..255};
    do
        printf '%s: \e[48;5;%sm%s%s\n' "$code" "$code" "$OSH_SPECTRUM_TEXT" "$_omb_term_reset";
    done
}
spectrum_ls () 
{ 
    local code;
    for code in {000..255};
    do
        printf '%s: \e[38;5;%sm%s%s\n' "$code" "$code" "$OSH_SPECTRUM_TEXT" "$_omb_term_reset";
    done
}
spinner () 
{ 
    if [[ -z "$TERM" ]]; then
        no_term_spinner;
    else
        term_spinner;
    fi
}
starship_precmd () 
{ 
    STARSHIP_CMD_STATUS=$? STARSHIP_PIPE_STATUS=(${PIPESTATUS[@]});
    if [[ "${#BP_PIPESTATUS[@]}" -gt "${#STARSHIP_PIPE_STATUS[@]}" ]]; then
        STARSHIP_PIPE_STATUS=(${BP_PIPESTATUS[@]});
    fi;
    local NUM_JOBS=0;
    for job in $(jobs -p);
    do
        [[ -n $job ]] && ((NUM_JOBS++));
    done;
    "${starship_precmd_user_func-:}";
    _starship_set_return "$STARSHIP_CMD_STATUS";
    eval "$_PRESERVED_PROMPT_COMMAND";
    if [[ -n $STARSHIP_START_TIME ]]; then
        STARSHIP_END_TIME=$(/home/william/.cargo/bin/starship time);
        STARSHIP_DURATION=$((STARSHIP_END_TIME - STARSHIP_START_TIME));
        PS1="$(/home/william/.cargo/bin/starship prompt --terminal-width="$COLUMNS" --status=$STARSHIP_CMD_STATUS --pipestatus="${STARSHIP_PIPE_STATUS[*]}" --jobs="$NUM_JOBS" --cmd-duration=$STARSHIP_DURATION)";
        unset STARSHIP_START_TIME;
    else
        PS1="$(/home/william/.cargo/bin/starship prompt --terminal-width="$COLUMNS" --status=$STARSHIP_CMD_STATUS --pipestatus="${STARSHIP_PIPE_STATUS[*]}" --jobs="$NUM_JOBS")";
    fi;
    STARSHIP_PREEXEC_READY=true
}
starship_preexec () 
{ 
    local PREV_LAST_ARG=$1;
    if [ "$STARSHIP_PREEXEC_READY" = "true" ]; then
        STARSHIP_PREEXEC_READY=false;
        STARSHIP_START_TIME=$(/home/william/.cargo/bin/starship time);
    fi;
    : "$PREV_LAST_ARG"
}
svn_prompt_info () 
{ 
    svn_prompt_vars;
    echo -e "${SCM_PREFIX}${SCM_BRANCH}${SCM_STATE}${SCM_SUFFIX}"
}
svn_prompt_vars () 
{ 
    if [[ -n $(command svn status 2> /dev/null) ]]; then
        SCM_DIRTY=1;
        SCM_STATE=${SVN_THEME_PROMPT_DIRTY:-$SCM_THEME_PROMPT_DIRTY};
    else
        SCM_DIRTY=0;
        SCM_STATE=${SVN_THEME_PROMPT_CLEAN:-$SCM_THEME_PROMPT_CLEAN};
    fi;
    SCM_PREFIX=${SVN_THEME_PROMPT_PREFIX:-$SCM_THEME_PROMPT_PREFIX};
    SCM_SUFFIX=${SVN_THEME_PROMPT_SUFFIX:-$SCM_THEME_PROMPT_SUFFIX};
    SCM_BRANCH=$(command svn info 2> /dev/null | awk -F/ '/^URL:/ { for (i=0; i<=NF; i++) { if ($i == "branches" || $i == "tags" ) { print $(i+1); break }; if ($i == "trunk") { print $i; break } } }') || return;
    SCM_CHANGE=$(command svn info 2> /dev/null | sed -ne 's#^Revision: ##p' )
}
take () 
{ 
    mkdir -p "$1";
    _omb_directories_cd "$1" || exit
}
term_spinner () 
{ 
    local pid=$!;
    local delay=0.1;
    local spinstr='|/-\';
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?};
        printf " [%c]  " "$spinstr";
        local spinstr=$temp${spinstr%"$temp"};
        sleep $delay;
        printf "\b\b\b\b\b\b";
    done;
    printf "    \b\b\b\b"
}
try_alias_value () 
{ 
    alias_value "$1" || echo "$1"
}
type_exists () 
{ 
    _omb_util_binary_exists "$@"
}
uninstall_oh_my_bash () 
{ 
    source "$OSH"/tools/uninstall.sh
}
upgrade_oh_my_bash () 
{ 
    source "$OSH"/tools/upgrade.sh
}
usage () 
{ 
    if [ "$(uname)" = "Darwin" ]; then
        if [ -n "$1" ]; then
            du -hd 1 "$1";
        else
            du -hd 1;
        fi;
    else
        if [ "$(uname)" = "Linux" ]; then
            if [ -n "$1" ]; then
                du -h --max-depth=1 "$1";
            else
                du -h --max-depth=1;
            fi;
        fi;
    fi
}
user_host_prompt () 
{ 
    if [[ "${THEME_SHOW_USER_HOST}" = "true" ]]; then
        echo -e "${USER_HOST_THEME_PROMPT_PREFIX}\u@\h${USER_HOST_THEME_PROMPT_SUFFIX}";
    fi
}
virtualenv_prompt () 
{ 
    _omb_prompt_print_virtualenv "$@"
}
work_in_progress () 
{ 
    if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
        echo "WIP!!";
    fi
}
zipf () 
{ 
    zip -r "$1".zip "$1"
}
/home/william/bashrc
