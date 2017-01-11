bindkey -v
for config_file ($ZSH/*.zsh) source $config_file

# vim: expandtab softtabstop=2 shiftwidth=2
# vim: foldmethod=marker

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
