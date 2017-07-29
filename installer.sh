#!/bin/bash

function init(){
    echo "Hello again sweet heart :)"
    echo "I know you deleted all of your programs again. But don't worry, I will install them for you."
    echo
    echo "First step! I'm searching your programs to install. "
    list_programs
    install_check
    installer
    exit 0
}
#This function is asking to user "are you sure?"
function install_check() {
    echo -n 'Programs on above will install. Do you really want? [Y/n]'
    read choice
    if [[ $choice == [Yy] || $choice == '' ]];
    then
        echo 'You selected "YES". Your programs will install as soon as possible...'
    elif [[ $choice == [Nn] ]];
    then
        echo 'You selected "NO". Please be sure when you call me.'
        exit 0
    else
        echo 'You typed the wrong letter. Exitting...'
        exit 1
    fi
}
#List programs which will install.
function list_programs() {
    echo '---------------------------------------------------------------------'
    echo 'Program List:'
    for i in $( ls programs/ ); do
            echo "|---" $i
        done
    echo '---------------------------------------------------------------------'
}
# Program Installer
function installer() {
    echo
    echo "Step two! Your programs are installing. Please be patient dear.. "
    echo
    for i in $( ls programs/ ); do # for loop for install all of programs inside programs folder.
            echo "|---" $i "installing.."
            chmod +x programs/$i # this command gives execute permission to this program.
            ./programs/$i # run command
            echo "|---" $i "installed.."
        done
    echo
    echo "Third step! I will install... "
    echo "I'm just kidding there is no third step... :D All of your programs are installed."
    echo
    echo "Enjoy with your installed programs. "
    echo
}

# Program Starting Point
init
