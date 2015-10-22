setopt prompt_subst
setopt prompt_percent
setopt transient_rprompt

color256()
{
    local red=$1; shift
    local green=$2; shift
    local blue=$3; shift

    echo -n $[$red * 36 + $green * 6 + $blue + 16]
}

fg256()
{
    echo -n $'\e[38;5;'$(color256 "$@")"m"
}

bg256()
{
    echo -n $'\e[48;5;'$(color256 "$@")"m"
}

autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz colors

prompt_host="%{%B%F{green}%}%n%{%b%f%}"
prompt_current=" [%{%B%F{magenta}%}%(5~,%-2~/.../%3~,%~)%{%b%f%}]"
prompt_left="%{%B%}$%{%b%} "
prompt_right=""

zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

RPROMPT="%1(v|%F{green}%1v%f|)"

update_prompt()
{
    ### virtualenv
    virtualenv_prompt=""
    if [ -n "${VIRTUAL_ENV}" ] ;then
      virtualenv_prompt=" (virtualenv: $(basename $VIRTUAL_ENV))"
    fi

    ### rbenv
    rbenv_prompt=`rbenv version | awk '{print $1}'`
    if [ -n "virtualenv_prompt" ] ;then
      rbenv_prompt=" (rbenv: ${rbenv_prompt})"
    fi

    vcs_prompt='%1(v|%F{green}%1v%f|)'
    PROMPT="%U${prompt_host}${prompt_current}${virtualenv_prompt}${rbenv_prompt}%u"$'\n'"${prompt_left}"
    RPROMPT="${vcs_prompt}"
}

precmd_functions+=($precmd_functions update_prompt)
