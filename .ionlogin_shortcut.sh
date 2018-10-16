#!/bin/bash

    # Set your credentials in here
	ion_user=XXXXXX;
    ion_password=XXXXX;
	
    
    ion_portal=$(curl --max-redirs 5 http://msftconnecttest.com/redirect -L 2> /dev/null | grep link-login-only | cut -d \" -f 6);
    if [[ -z "${ion_portal}" ]]; then
        gnome-terminal -e "bash -c 'tput setaf 1; echo -e Error: I-ON portal unavailable!; tput sgr0; echo -e You may be already logged in or on the wrong network.; sleep 5'"
    else
      received_data=$(mktemp);
      curl -sX POST $ion_portal --data "username=${ion_user}&password=${ion_password}&radius1-44115=12&popup=false&dst=" > $received_data;
      if [[ $(cat $received_data | grep 'error') ]]; then
         gnome-terminal -e "bash -c 'echo $(cat $received_data | grep 'error' | cut -d = -f 4 | cut -d \" -f 2); sleep 3'";

      else
      gnome-terminal -e "bash -c 'echo; echo; cowsay -f stegosaurus Hey boss vidu. I have connected to ion. Have a great day Sir | lolcat; sleep 2'";
      fi
    fi
