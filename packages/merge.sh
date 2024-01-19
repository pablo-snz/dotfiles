#!/bin/bash 

echo $(cat packages/$2/$1.txt packages/$2/general.txt | sort | uniq)
