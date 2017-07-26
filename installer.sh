#!/bin/bash

function init(){
    echo "Hello again sweet heart :)"
    echo "I know you deleted all of your programs again. But don't worry, I will install them for you."
    echo
    echo "First step! I'm searching your programs to install. "
    list_programs
#    install_check
    installer
}

function install_check() {
    echo -n 'Programs on above will install. Do you really want? [Y/n]'
    read choice
    if [[ $choice == [Yy] || $choice == '' ]];
    then
        echo 'You selected "YES". Your programs will install as soon as...'
    elif [[ $choice == [Nn] ]];
    then
        echo 'You selected "NO". Please be sure when you call me.'
        exit 0
    else
        echo 'You typed the wrong letter. Exitting...'
        exit 1
    fi
}

function list_programs() {
    echo '---------------------------------------------------------------------'
    echo 'Program List:'
    for i in $( ls programs/ ); do
            echo "|---" $i
        done
    echo '---------------------------------------------------------------------'
}

function installer() {
    echo
    echo "Step two! Your programs are installing. Please be patient dear.. "
    echo
    for i in $( ls programs/ ); do
            echo "|---" $i "installing.."
            chmod +x programs/$i
            ./programs/$i
        done
    echo
    echo "Third step! I will install... "
    echo "I'm just kidding there is no third step... :D "
    echo
    echo "Enjoy with your installed programs. "
    echo
}

# Program Starting Point
init
