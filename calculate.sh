#!/bin/bash

################################################################################################################
#						Bash Calculate
################################################################################################################
# Script per eseguire calcoli nella bash
# 
# Uso: calculate "espressione"
# Uso: calculate
#
################################################################################################################
# Autore: Andrea Dematté alias dema121
# Data: 2013-11-03
# Versione 1.0
################################################################################################################


calculate(){
  echo $1
  echo "scale=4; $1" | bc
  echo "------------------------------------------------"
  waitinput
}
help(){
  echo "Le opzioni disponibili sono:"
  echo " helpme  - Mostra i vari comandi disponibili"
  echo " exit    - Esce dallo script di calcolo"
  echo " clearme - Pulisce lo schermo"
  echo "------------------------------------------------"
  waitinput  
}
waittext(){
  echo "Inserisci un'espressione e premi enter"
  echo "Digita helpme per l'aiuto"
  echo "------------------------------------------------"
}
waitinput(){
  read -p "" param
  if [ "$param" = "exit" ]; then
    exit
  else
    if [ "$param" = "helpme" ]; then
      help
    else      
      if [ "$param" = "clearme" ]; then
        clear
        waittext
        waitinput
      else
        calculate $param
      fi
    fi
  fi  
}

if [ -z "$1" ]; then
  clear
  echo "Non è stato inserito nessun parametro! Avvio dello script di calcolo"
  echo "------------------------------------------------"
  echo ""
  waittext
  waitinput
else
  echo $1
  calculate $1
fi

exit

