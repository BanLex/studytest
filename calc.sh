#!/bin/bash
flag=0
for i in $@
do
    if [[ -f $i ]]; then
	max2=$(cat "$i")
	if [[ $flag -eq 1 ]]; then
	    if [[ $(($max2)) -ge $(($max)) ]]; then
		max=$max2
	    fi
	else
	    flag=1
	    max=$max2
	fi
    else
	echo "Файл $i не найден"
    fi
done

if [[ $flag -eq 0 ]]; then
    echo "Не заданы файлы с выражениями для вычисления"
else
    echo "Максимум: $((max))"
fi