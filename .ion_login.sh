#!/bin/bash

function ilogin()
{
    # Set your credentials in here
    
	ion_user=XXXXXX;
        ion_password=XXXXXX;
	user="kid";
    if [[ $1 == "2" ]]; then
	ion_user=XXXXXX;
        ion_password=XXXXXX;
	user="chini";
	fi	
    if [[ $1 == "3" ]]; then
        ion_user=XXXXX;
        ion_password=XXXXX;
	user="vidu";
	fi	
	
	
    ion_portal=$(curl --max-redirs 5 http://msftconnecttest.com/redirect -L 2> /dev/null | grep link-login-only | cut -d \" -f 6);
    if [[ -z "${ion_portal}" ]]; then
            echo -e "\033[31m\e[1mError: I-ON portal unavailable! \e[0m"; 
	    echo -e "You may be already logged in or on the wrong network.";
    else
      received_data=$(mktemp);
      curl -sX POST $ion_portal --data "username=${ion_user}&password=${ion_password}&radius1-44115=12&popup=false&dst=" > $received_data;
      if [[ $(cat $received_data | grep 'error') ]]; then
        echo "error: $(cat $received_data | grep 'error' | cut -d "=" -f 4 | cut -d \" -f 2)";
      else
	cowsay -f stegosaurus "Hey boss vidu. I have connected to ion. Have a great day Sir" | lolcat
        echo "\e[92m\e[1mConnected! logged in as $user";
	
      fi
    fi
}

function ilogout(){

	ip=$(ifconfig > /dev/null | grep "inet"  | tail -2   | head -1  | cut -d " " -f 10 | cut -d "." -f 1,2 );
	ip=$ip".0.1";
	logoutportal=$(curl http://$ip/logout 2> /dev/null);
	cowsay -f turtle "Hey boss.You have logged out from ion" | lolcat
		  
}

function ilogin_delay()
{
    # Set your credentials in here
    
	ion_user=XXXXX;
        ion_password=XXXXX;
	user="kid";
    if [[ $1 == "2" ]]; then
	ion_user=XXXXX;
        ion_password=XXXXX;
	user="chini";
	fi	
    if [[ $1 == "3" ]]; then
        ion_user=XXXXX;
        ion_password=XXXXX;
	user="vidu";
	fi	
	
	sleep 15;
    ion_portal=$(curl --max-redirs 5 http://msftconnecttest.com/redirect -L 2> /dev/null | grep link-login-only | cut -d \" -f 6);
    if [[ -z "${ion_portal}" ]]; then
            echo -e "\033[31m\e[1mError: I-ON portal unavailable! \e[0m"; 
	    echo -e "You may be already logged in or on the wrong network.";
    else
      received_data=$(mktemp);
      curl -sX POST $ion_portal --data "username=${ion_user}&password=${ion_password}&radius1-44115=12&popup=false&dst=" > $received_data;
      if [[ $(cat $received_data | grep 'error') ]]; then
        echo "error: $(cat $received_data | grep 'error' | cut -d "=" -f 4 | cut -d \" -f 2)";
      else
	cowsay -f stegosaurus "Hey boss vidu. I have connected to ion. Have a great day Sir" | lolcat
        echo "\e[92m\e[1mConnected! logged in as $user";
	
      fi
    fi
}

