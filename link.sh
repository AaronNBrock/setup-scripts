#!/bin/bash

from="$(pwd)"
to="/media/aaron/data"

declare -a arr=("documents" "downloads" "music" "pictures" "projects" "public" "templates" "videos")
declare -A map

map["desktop"]="desktop-ubuntu"

for i in "${arr[@]}"
do
	map[$i]=$i
done

for key in ${!map[@]}
do
	mkdir -p $to/${map[$key]}/
	mv $from/$key/* $to/${map[$key]}/
	rmdir $from/$key/
	ln -s $to/${map[$key]} $from/$key
done
