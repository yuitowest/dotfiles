typeset -U path cdpath fpath manpath
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path

path=(
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /opt/*/current/bin(N-/)
  ${path}
  )

sudo_path=(
  {/usr/local,/usr,}/sbin(N-/)
  )

manpath=(
  /usr/local/share/man(N-/)
  /usr/share/man(N-/)
  /usr/local/opt/coreutils/libexec/gnuman(N-/)
  ${manpath}
  )

fpath=(
  $HOME/.zsh/functions(N-/)
  /usr/local/share/zsh-completions(N-/)
  $fpath(N-/)
  )

export ZSH=$HOME/.zsh
export HGENCODING=utf-8

# rbenv
if type rbenv >/dev/null 2>&1; then; eval "$(rbenv init -)"; fi

# nvm
[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh  # This loads NVM

# git-completion
[[ -s /usr/local/share/zsh/site-functions/git-completion.zsh ]] && \
  . /usr/local/share/zsh/site-functions/git-completion.zsh

# git-flow-completion
[[ -s /usr/local/share/zsh/site-functions/git-flow-completion.zsh ]] && \
  . /usr/local/share/zsh/site-functions/git-flow-completion.zsh

# coreutils
path=(/usr/local/opt/coreutils/libexec/gnubin(N-/) ${path})

# macvim
path=(/Applications/MacVim.app/Contents/MacOS/(N-/) ${path})

# pager
if type lv > /dev/null 2>&1; then
  export PAGER="lv"
else
  export PAGER="less"
  export LESS='-R'
fi

# lv
if [ "$PAGER" = "lv" ]; then
  export LV="-c -l"
else
  alias lv="$PAGER"
fi

# virtualenvwrapper
if [ -f /opt/python/current/bin/virtualenvwrapper.sh ]; then
    export VIRTUALENVWRAPPER_PYTHON=/opt/python/current/bin/python
    export WORKON_HOME=$HOME/.virtualenvs
    source /opt/python/current/bin/virtualenvwrapper.sh
fi

# virtualenv
[[ -s ~/.virtualenvs/default/bin/activate ]] && . ~/.virtualenvs/default/bin/activate

# OPAM configuration
. ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export EDITOR=vim
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export LS_COLORS='no=01;37:fi=00:di=01;36:ln=01;32:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;32;01:ex=01;33:*core=01;31:'
export WORDCHARS='*?-[]~\!#%^(){}<>|`@#%^*()+:?'

# vim: expandtab softtabstop=2 shiftwidth=2
# vim: foldmethod=marker
