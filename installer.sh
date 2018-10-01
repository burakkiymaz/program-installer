#!/bin/bash

#This function is asking to user "are you sure?"
function install_check() {
    echo -n 'Programs listed above. Can I install all of them? [Y/n]'
    read choice
    if [[ $choice == [Yy] || $choice == '' ]];
    then
        echo -e 'You selected \e[1m\e[34m"YES"\e[0m\e[39m.'
        echo
        echo "Step two! I'm starting now. While process you can get a cup of coffee :)"
        
    elif [[ $choice == [Nn] ]];
    then
        echo -e 'You selected \e[1m\e[31m"NO"\e[0m\e[39m. Please be sure when you call me.'
        exit 0
    else
        echo 'You typed wrong letter. Exitting...'
        exit 1
    fi
}
#List programs which will install.
function list_programs() {
    echo -e '\e[1m\e[33m---------------------------------------------------------------------\e[0m\e[39m'
    echo -e '\e[1m\e[33mProgram List:\e[0m\e[39m'
    for i in $( ls programs/ ); do
            echo -e "\e[93m|--- ${i%.*}\e[39m"
        done
    echo -e '\e[1m\e[33m---------------------------------------------------------------------\e[0m\e[39m'
}
# Program Installer
function installer() {
    echo
    for i in $( ls programs/ ); do # for loop for install all of programs inside programs folder.
            echo -e "\e[1m\e[32m|--- ${i%.*} installing..\e[0m\e[39m"
            
            if [[ ${i##*.} == [Ss][Hh] ]];
            then
                chmod +x programs/$i # this command gives execute permission to this program.
                ./programs/$i # run command
                echo -e "\e[1m\e[34m|--- " ${i%.*} "installed..\e[39m\e[0m"
            
            elif [[ ${i##*.} == [Dd][Ee][Bb] ]];
            then
                sudo dpkg -i ./programs/$i
                echo -e "\e[1m\e[34m|--- " ${i%.*} "installed..\e[39m\e[0m"
            
            else
                echo -e "\e[1m\e[31mFile format error!\e[0m\e[39m"
                echo -e "\e[1m\e[31m|--- " ${i%.*} "failed..\e[39m\e[0m"
            fi

            
            echo
            echo
        done
}


function init(){
    echo "Hello sweet heart :)"
    echo "I know you deleted all of your programs again. But don't worry, I will help you to install them again."
    echo
    echo "First step! I'm checking your programs to install. "
    
    list_programs
    install_check
    installer
    
    exit 0
}

# Program Starting Point
init
