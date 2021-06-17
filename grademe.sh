# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    grademe.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seungoh <seungoh@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/17 21:29:14 by seungoh           #+#    #+#              #
#    Updated: 2021/06/17 21:29:14 by seungoh          ###   ########.fr        #
#    저작권 승은이한테 있음!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!                      #
# **************************************************************************** #

#!/bin/bash

echo "number: "
read NUM
gcc test.c
make re -C ../

MIN=100000
MAX=-1
SUM=0

for i in {1..10}
do
    ./a.out $NUM > abc
    EE=`cat abc`
    .././push_swap $EE > result.txt
    COUNT=`wc -l < result.txt`
    RESULT=$(./checker_Mac `cat abc` < result.txt)
    if [ "${RESULT}" = "KO" ]; then
        echo "failed"
        exit
    fi
    SUM=`expr $SUM + $COUNT`
    if [ ${COUNT} -lt ${MIN} ]; then
        MIN=$COUNT
    fi
    if [ ${MAX} -lt ${COUNT} ]; then
        MAX=$COUNT
    fi
    echo "roading ... $i"
done

AVG=`expr $SUM / 10`
echo "ave = $AVG"
#if [ ${NUM} -eq 100 ]; then
#	if [ ${AVG} -lt 700 ]; then
#		echo "AVG grade : 5"
#	elif [ ${AVG} -lt 900 ]; then
#		echo "AVG grade : 4"
#	elif [ ${AVG} -lt 1100 ]; then
#		echo "AVG grade : 3"
#	elif [ ${AVG} -lt 1300 ]; then
#		echo "AVG grade : 2"
#	elif [ ${AVG} -lt 1500 ]; then
#		echo "AVG grade : 1"
#	fi
#fi
#if [ ${NUM} -eq 500 ]; then
#	if [ ${AVG} -lt 5500 ]; then
#		echo "AVG grade : 5"
#	elif [ ${AVG} -lt 7000 ]; then
#		echo "AVG grade : 4"
#	elif [ ${AVG} -lt 8500 ]; then
#		echo "AVG grade : 3"
#	elif [ ${AVG} -lt 10000 ]; then
#		echo "AVG grade : 2"
#	elif [ ${AVG} -lt 11500 ]; then
#		echo "AVG grade : 1"
#	fi
#fi

echo "min = $MIN"
#if [ ${NUM} -eq 100 ]; then
#	if [ ${MIN} -lt 700 ]; then
#		echo "MIN grade : 5"
#	elif [ ${MIN} -lt 900 ]; then
#		echo "MIN grade : 4"
#	elif [ ${MIN} -lt 1100 ]; then
#		echo "MIN grade : 3"
#	elif [ ${MIN} -lt 1300 ]; then
#		echo "MIN grade : 2"
#	elif [ ${MIN} -lt 1500 ]; then
#		echo "MIN grade : 1"
#	fi
#fi
#if [ ${NUM} -eq 500 ]; then
#	if [ ${MIN} -lt 5500 ]; then
#		echo "MIN grade : 5"
#	elif [ ${MIN} -lt 7000 ]; then
#		echo "MIN grade : 4"
#	elif [ ${MIN} -lt 8500 ]; then
#		echo "MIN grade : 3"
#	elif [ ${MIN} -lt 10000 ]; then
#		echo "MIN grade : 2"
#	elif [ ${MIN} -lt 11500 ]; then
#		echo "MIN grade : 1"
#	fi
#fi

echo "max = $MAX"
if [ ${NUM} -eq 100 ]; then
	if [ ${MAX} -lt 700 ]; then
		echo "Score : 5"
	elif [ ${MAX} -lt 900 ]; then
		echo "Score : 4"
	elif [ ${MAX} -lt 1100 ]; then
		echo "Score : 3"
	elif [ ${MAX} -lt 1300 ]; then
		echo "Score : 2"
	elif [ ${MAX} -lt 1500 ]; then
		echo "Score : 1"
	fi
fi
if [ ${NUM} -eq 500 ]; then
	if [ ${MAX} -lt 5500 ]; then
		echo "Score : 5"
	elif [ ${MAX} -lt 7000 ]; then
		echo "Score : 4"
	elif [ ${MAX} -lt 8500 ]; then
		echo "Score : 3"
	elif [ ${MAX} -lt 10000 ]; then
		echo "Score : 2"
	elif [ ${MAX} -lt 11500 ]; then
		echo "Score : 1"
	fi
fi
