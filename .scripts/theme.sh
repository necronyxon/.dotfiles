#!/bin/bash

_toggle_color(){
  current_color=$( sed '444!d ; s/,//g' "$cinnamon" | grep -Eo '[0-9]{3} [0-9]{3} [0-9]{3}' )

  [[ "$current_color" = "$*" ]] && return

  sed -i "444s/.*/  background-color: rgba($1, $2, $3, 0.75);/" "$cinnamon"
  gsettings set org.cinnamon.theme name "Mint-Y-Dark-Blue"
  gsettings set org.cinnamon.theme name "Custom-Mint-Y-Dark-Blue"
}

_change_cinnamon_bar_color(){
  cinnamon="/home/rafa/.themes/Custom-Mint-Y-Dark-Blue/cinnamon/cinnamon.css"
  hour=$(date "+%H") 

  case "$hour" in
    21)    _toggle_color 253 192 000 ;; # amarelo
    22)    _toggle_color 255 095 031 ;; # laranja
    13|23) _toggle_color 255 000 000 ;; # vermelho
    *)
      if [[ "$hour" -lt 6 ]] ; then
           _toggle_color 255 000 000 # vermelho
      else
           _toggle_color 000 000 000 # preto
      fi
    ;; 
  esac
}

_change_cinnamon_bar_color
