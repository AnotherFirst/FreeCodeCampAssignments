#!/bin/bash

if [[ $1 -gt 0 ]]
then
  echo -e "\n~~ Countdown Timer ~~\n";
: '
  for (( i = $1; i >= 0; i--))
  do
    echo $i
    sleep 1
  done
'
else
  echo Include a positive integer as the first argument.
fi