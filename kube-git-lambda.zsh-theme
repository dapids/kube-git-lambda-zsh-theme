local KUBE_ICON=$'\U2388'
local GIT_ICON=$'\Ue0a0'
local WORKING_DIRECTORY_ICON=$'\U25CF'

get_kube_info() {
  local KUBE_CONTEXT=$(kubectx -c 2> /dev/null)
  local KUBE_NAMESPACE=$(kubens -c 2> /dev/null)

  if [[ -z $KUBE_CONTEXT || -z $KUBE_NAMESPACE ]]; then
    echo ""
  else
    echo "%{$fg_bold[magenta]%}$KUBE_ICON $(kubectx -c)/$(kubens -c)%{$reset_color%} "
  fi
}

local WORKING_DIRECTORY="%{$fg_bold[yellow]%}$WORKING_DIRECTORY_ICON %1d%{$reset_color%}"
local PROMPT_INDICATOR=" %{%(?.$fg_bold[green].$fg_bold[red])%}λ%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_CACHE="true"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}$GIT_ICON "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

PROMPT='$(get_kube_info)$(git_prompt_info)$WORKING_DIRECTORY$PROMPT_INDICATOR '
