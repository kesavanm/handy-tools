#!/bin/bash

num=5



# Option 2: Using a for loop with a sequence expression
for i in {10..1}
do
    echo "$num x $i = $((num * i))"
done

#3 Option 3: Using a for loop with a range expression
for i in {1..10}
do
    result=$((num * i))
    echo "$num x $i = $result"
done

# Option 4: Using a nested for loop to create a multiplication table
for i in {1..10}
do
    for j in {1..10}
    do
        printf "%4d" $((i * j))
    done
    echo
done


i=1
while [ $i -le 10 ]
do
    result=$((num * i))
    echo "$num x $i = $result"
    i=$((i + 1))
done


for ((i=1; i<=10; i++))
do
    result=$((num * i))
    echo "$num x $i = $result"
done
