#!/bin/bash

name=`whoami`
#add folder names that you want to install
#dont add commas between array elements like another laguages

installation_folders=("vim" "python_libraries")

for folder_name in "${installation_folders[@]}"
do
	current_folder="/home/$name/bin_$name/setup/dotfiles/$folder_name"
	
	if [ -d $current_folder ];then
		echo -e "\n $current_folder"
		cd $current_folder/ \
			&& ./install.sh
	else
		echo -e "\n $current_folder was not found"
	fi
done
