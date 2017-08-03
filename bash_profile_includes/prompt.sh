function prompt
{
  local GRAY="\[\033[1;30m\]"
  local LIGHT_GRAY="\[\033[0;37m\]"
  local CYAN="\[\033[0;36m\]"
  local LIGHT_CYAN="\[\033[1;36m\]"
  local NO_COLOUR="\[\033[0m\]"
  local WHITE="\[\033[1;37m\]"
  local RED="\[\033[1;31m\]"
  local RED_BG="\[\033[1;41m\]"
  
  case $TERM in
      xterm*|rxvt*)
          local TITLEBAR="\[\033]0;\u@\h:\w\007\]"
          ;;
      *)
          local TITLEBAR=""
          ;;
  esac
  
  if [ ${UID} -eq 0 ]; then
    TEXT="$RED"
  else
    TEXT="$CYAN"
  fi
  
  BRDR="$LIGHT_GRAY"
  
  local temp=$(tty)
  local GRAD1=${temp:5}

  NB="$TEXT"
  ENV_NAME="LOCAL"
  
  if [[ "$ENV_NAME" =~ "prod" ]] ; then
    NB="$WHITE$RED_BG"
  fi

  PS1="$TITLEBAR"
  PS1="$PS1\n$BRDR[ $TEXT\d \t $BRDR] :: [$NO_COLOUR$NB $ENV_NAME $NO_COLOUR$BRDR] :: [ $TEXT\w$BRDR ]\n"
  PS1="$PS1[ $TEXT\u$BRDR@$TEXT\h $BRDR]\$ $NO_COLOUR"
  
  PS2="$LIGHT_CYAN-$CYAN-$GRAY-$NO_COLOUR "
}

prompt
