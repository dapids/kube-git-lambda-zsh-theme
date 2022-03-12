local KUBE_ICON=$'\U2388'
local GIT_ICON=$'\Ue0a0'
local WORKING_DIRECTORY_ICON=$'\U25CF'

get_kube_context() {
  if kubectl config current-context &> /dev/null ; then
    echo "%{$fg_bold[magenta]%}$KUBE_ICON $(kubectl config current-context)%{$reset_color%} "
  else
    echo ""
  fi
}

local WORKING_DIRECTORY="%{$fg_bold[yellow]%}$WORKING_DIRECTORY_ICON %1d%{$reset_color%}"
local PROMPT_INDICATOR=" %{%(?.$fg_bold[green].$fg_bold[red])%}λ%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_CACHE="true"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}$GIT_ICON "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

PROMPT='$(get_kube_context)$(git_prompt_info)$WORKING_DIRECTORY$PROMPT_INDICATOR '
