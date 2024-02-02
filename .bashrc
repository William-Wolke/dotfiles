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
alias c='clear'
alias ccom='bash ~/Documents/edaider/misc-scripts/ChooseCommandUtility.sh'
alias docex='bash ~/Documents/edaider/misc-scripts/DockerExecUtility.sh'
alias lint='bash ~/Documents/edaider/misc-scripts/lint-all.sh'
alias ls='exa'
alias prettify='bash ~/Documents/edaider/misc-scripts/prettify-all.sh'
alias psqlcon='PGPASSWORD=postgres psql -d edaider -h localhost -p 5434 -U postgres'
alias src='source ~/.bashrc'
alias wget='wget -c'
BASH=/usr/bin/bash
BASHMARKS_SDIRS=/home/william/.sdirs
BASHOPTS=autocd:cdable_vars:cdspell:checkwinsize:cmdhist:complete_fullquote:dirspell:expand_aliases:extglob:extquote:force_fignore:globasciiranges:globstar:histappend:histreedit:histverify:interactive_comments:lithist:nocaseglob:progcomp:promptvars:sourcepath
BASH_ARGC=([0]="0")
BASH_COMPLETION_VERSINFO=([0]="2" [1]="11")
BASH_SOURCE=()
BG=([049]=$'\E[48;5;049m' [048]=$'\E[48;5;048m' [043]=$'\E[48;5;043m' [042]=$'\E[48;5;042m' [041]=$'\E[48;5;041m' [040]=$'\E[48;5;040m' [047]=$'\E[48;5;047m' [046]=$'\E[48;5;046m' [045]=$'\E[48;5;045m' [044]=$'\E[48;5;044m' [249]=$'\E[48;5;249m' [248]=$'\E[48;5;248m' [241]=$'\E[48;5;241m' [240]=$'\E[48;5;240m' [243]=$'\E[48;5;243m' [242]=$'\E[48;5;242m' [245]=$'\E[48;5;245m' [244]=$'\E[48;5;244m' [247]=$'\E[48;5;247m' [246]=$'\E[48;5;246m' [111]=$'\E[48;5;111m' [110]=$'\E[48;5;110m' [038]=$'\E[48;5;038m' [113]=$'\E[48;5;113m' [039]=$'\E[48;5;039m' [112]=$'\E[48;5;112m' [115]=$'\E[48;5;115m' [114]=$'\E[48;5;114m' [117]=$'\E[48;5;117m' [116]=$'\E[48;5;116m' [032]=$'\E[48;5;032m' [119]=$'\E[48;5;119m' [033]=$'\E[48;5;033m' [118]=$'\E[48;5;118m' [030]=$'\E[48;5;030m' [031]=$'\E[48;5;031m' [036]=$'\E[48;5;036m' [037]=$'\E[48;5;037m' [034]=$'\E[48;5;034m' [035]=$'\E[48;5;035m' [098]=$'\E[48;5;098m' [099]=$'\E[48;5;099m' [094]=$'\E[48;5;094m' [095]=$'\E[48;5;095m' [096]=$'\E[48;5;096m' [097]=$'\E[48;5;097m' [090]=$'\E[48;5;090m' [091]=$'\E[48;5;091m' [092]=$'\E[48;5;092m' [093]=$'\E[48;5;093m' [148]=$'\E[48;5;148m' [149]=$'\E[48;5;149m' [142]=$'\E[48;5;142m' [143]=$'\E[48;5;143m' [140]=$'\E[48;5;140m' [141]=$'\E[48;5;141m' [146]=$'\E[48;5;146m' [147]=$'\E[48;5;147m' [144]=$'\E[48;5;144m' [145]=$'\E[48;5;145m' [014]=$'\E[48;5;014m' [015]=$'\E[48;5;015m' [016]=$'\E[48;5;016m' [017]=$'\E[48;5;017m' [010]=$'\E[48;5;010m' [011]=$'\E[48;5;011m' [012]=$'\E[48;5;012m' [013]=$'\E[48;5;013m' [018]=$'\E[48;5;018m' [019]=$'\E[48;5;019m' [212]=$'\E[48;5;212m' [213]=$'\E[48;5;213m' [139]=$'\E[48;5;139m' [210]=$'\E[48;5;210m' [138]=$'\E[48;5;138m' [211]=$'\E[48;5;211m' [216]=$'\E[48;5;216m' [217]=$'\E[48;5;217m' [214]=$'\E[48;5;214m' [215]=$'\E[48;5;215m' [133]=$'\E[48;5;133m' [132]=$'\E[48;5;132m' [131]=$'\E[48;5;131m' [218]=$'\E[48;5;218m' [130]=$'\E[48;5;130m' [219]=$'\E[48;5;219m' [137]=$'\E[48;5;137m' [136]=$'\E[48;5;136m' [135]=$'\E[48;5;135m' [134]=$'\E[48;5;134m' [078]=$'\E[48;5;078m' [079]=$'\E[48;5;079m' [076]=$'\E[48;5;076m' [077]=$'\E[48;5;077m' [074]=$'\E[48;5;074m' [075]=$'\E[48;5;075m' [072]=$'\E[48;5;072m' [073]=$'\E[48;5;073m' [070]=$'\E[48;5;070m' [071]=$'\E[48;5;071m' [238]=$'\E[48;5;238m' [239]=$'\E[48;5;239m' [234]=$'\E[48;5;234m' [235]=$'\E[48;5;235m' [236]=$'\E[48;5;236m' [237]=$'\E[48;5;237m' [230]=$'\E[48;5;230m' [231]=$'\E[48;5;231m' [232]=$'\E[48;5;232m' [233]=$'\E[48;5;233m' [164]=$'\E[48;5;164m' [165]=$'\E[48;5;165m' [166]=$'\E[48;5;166m' [167]=$'\E[48;5;167m' [029]=$'\E[48;5;029m' [160]=$'\E[48;5;160m' [028]=$'\E[48;5;028m' [161]=$'\E[48;5;161m' [162]=$'\E[48;5;162m' [163]=$'\E[48;5;163m' [025]=$'\E[48;5;025m' [024]=$'\E[48;5;024m' [027]=$'\E[48;5;027m' [026]=$'\E[48;5;026m' [021]=$'\E[48;5;021m' [168]=$'\E[48;5;168m' [020]=$'\E[48;5;020m' [169]=$'\E[48;5;169m' [023]=$'\E[48;5;023m' [022]=$'\E[48;5;022m' [186]=$'\E[48;5;186m' [187]=$'\E[48;5;187m' [184]=$'\E[48;5;184m' [185]=$'\E[48;5;185m' [182]=$'\E[48;5;182m' [183]=$'\E[48;5;183m' [089]=$'\E[48;5;089m' [180]=$'\E[48;5;180m' [088]=$'\E[48;5;088m' [181]=$'\E[48;5;181m' [087]=$'\E[48;5;087m' [086]=$'\E[48;5;086m' [085]=$'\E[48;5;085m' [084]=$'\E[48;5;084m' [083]=$'\E[48;5;083m' [082]=$'\E[48;5;082m' [081]=$'\E[48;5;081m' [188]=$'\E[48;5;188m' [080]=$'\E[48;5;080m' [189]=$'\E[48;5;189m' [007]=$'\E[48;5;007m' [006]=$'\E[48;5;006m' [005]=$'\E[48;5;005m' [004]=$'\E[48;5;004m' [003]=$'\E[48;5;003m' [002]=$'\E[48;5;002m' [001]=$'\E[48;5;001m' [000]=$'\E[48;5;000m' [009]=$'\E[48;5;009m' [008]=$'\E[48;5;008m' [205]=$'\E[48;5;205m' [204]=$'\E[48;5;204m' [207]=$'\E[48;5;207m' [206]=$'\E[48;5;206m' [201]=$'\E[48;5;201m' [200]=$'\E[48;5;200m' [108]=$'\E[48;5;108m' [203]=$'\E[48;5;203m' [109]=$'\E[48;5;109m' [202]=$'\E[48;5;202m' [106]=$'\E[48;5;106m' [107]=$'\E[48;5;107m' [104]=$'\E[48;5;104m' [105]=$'\E[48;5;105m' [102]=$'\E[48;5;102m' [209]=$'\E[48;5;209m' [103]=$'\E[48;5;103m' [208]=$'\E[48;5;208m' [100]=$'\E[48;5;100m' [101]=$'\E[48;5;101m' [159]=$'\E[48;5;159m' [158]=$'\E[48;5;158m' [155]=$'\E[48;5;155m' [154]=$'\E[48;5;154m' [157]=$'\E[48;5;157m' [156]=$'\E[48;5;156m' [151]=$'\E[48;5;151m' [150]=$'\E[48;5;150m' [153]=$'\E[48;5;153m' [152]=$'\E[48;5;152m' [058]=$'\E[48;5;058m' [059]=$'\E[48;5;059m' [050]=$'\E[48;5;050m' [051]=$'\E[48;5;051m' [052]=$'\E[48;5;052m' [053]=$'\E[48;5;053m' [054]=$'\E[48;5;054m' [055]=$'\E[48;5;055m' [056]=$'\E[48;5;056m' [057]=$'\E[48;5;057m' [254]=$'\E[48;5;254m' [255]=$'\E[48;5;255m' [252]=$'\E[48;5;252m' [253]=$'\E[48;5;253m' [250]=$'\E[48;5;250m' [251]=$'\E[48;5;251m' [229]=$'\E[48;5;229m' [228]=$'\E[48;5;228m' [227]=$'\E[48;5;227m' [226]=$'\E[48;5;226m' [225]=$'\E[48;5;225m' [224]=$'\E[48;5;224m' [223]=$'\E[48;5;223m' [222]=$'\E[48;5;222m' [221]=$'\E[48;5;221m' [220]=$'\E[48;5;220m' [177]=$'\E[48;5;177m' [176]=$'\E[48;5;176m' [175]=$'\E[48;5;175m' [174]=$'\E[48;5;174m' [173]=$'\E[48;5;173m' [172]=$'\E[48;5;172m' [171]=$'\E[48;5;171m' [170]=$'\E[48;5;170m' [179]=$'\E[48;5;179m' [178]=$'\E[48;5;178m' [199]=$'\E[48;5;199m' [198]=$'\E[48;5;198m' [191]=$'\E[48;5;191m' [190]=$'\E[48;5;190m' [193]=$'\E[48;5;193m' [192]=$'\E[48;5;192m' [195]=$'\E[48;5;195m' [194]=$'\E[48;5;194m' [197]=$'\E[48;5;197m' [196]=$'\E[48;5;196m' [061]=$'\E[48;5;061m' [060]=$'\E[48;5;060m' [063]=$'\E[48;5;063m' [062]=$'\E[48;5;062m' [065]=$'\E[48;5;065m' [064]=$'\E[48;5;064m' [067]=$'\E[48;5;067m' [066]=$'\E[48;5;066m' [069]=$'\E[48;5;069m' [068]=$'\E[48;5;068m' [128]=$'\E[48;5;128m' [129]=$'\E[48;5;129m' [120]=$'\E[48;5;120m' [121]=$'\E[48;5;121m' [122]=$'\E[48;5;122m' [123]=$'\E[48;5;123m' [124]=$'\E[48;5;124m' [125]=$'\E[48;5;125m' [126]=$'\E[48;5;126m' [127]=$'\E[48;5;127m' )
DENO_INSTALL=/home/william/.deno
GOPATH=/home/william/go
HOME=/home/william
HOSTNAME=william-laptop
NVM_BIN=/home/william/.nvm/versions/node/v19.6.0/bin
NVM_DIR=/home/william/.nvm
NVM_INC=/home/william/.nvm/versions/node/v19.6.0/include/node
OSH=/home/william/.oh-my-bash
OSH_CACHE_DIR=/home/william/.oh-my-bash/cache
OSH_CUSTOM=/home/william/.oh-my-bash/custom
OSH_SPECTRUM_TEXT='Arma virumque cano Troiae qui primus ab oris'
OSH_THEME=zork
PATH=/usr/local/go/bin:/usr/lib/postgresql/X.Y/bin/:/home/william/.local/bin:/home/william/.cargo/bin:/home/william/.dotnet/tools:/home/william/.deno/bin:/home/william/.nvm/versions/node/v19.6.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin:/home/william/.nvm/versions/node/v19.6.0/bin###-begin-npm-completion-###
SHELL=/bin/bash

#Starship
eval "$(starship init bash)"
