#!/bin/sh

if [ $1 == "reset" ] > /dev/null 2>&1
then
    rm osulocation.cfg
fi

#File to store where you osu! location is
location="$(cat osulocation.cfg)"

if [ -f "osulocation.cfg" ]
then
    for file in *
    do
        if [[ $file == *.osz ]]
        then
            unzip "$file" -d $location/Songs/"${file%????}"/ > /dev/null 2>&1
            rm "$file" > /dev/null 2>&1
            echo "$file extracted!"
        fi

        if [[ $file == *.osk ]]
        then
            unzip "$file" -d $location/Skins/"${file%????}"/ > /dev/null 2>&1
            rm "$file" > /dev/null 2>&1
            echo "$file extracted!"
        fi
    done
else
    echo "Config file not detected! Please enter your osu! folder location (in absolute path!!)"
    read input
    echo $input > osulocation.cfg
    location="$(cat osulocation.cfg)"
fi