#!/bin/bash #запускает bash и передаёт в качестве параметра имя файла z1.sh
# Вывод имени пользователя и имени компьютера
echo "Hello, $USER! Welcome to the PC named $HOSTNAME" 
sleep 1 # Задержка вывода на одну секунду для удобства визуализации
echo "Your home directory is $HOME" # Вывод домашнего каталога
sleep 1 
echo "Your current shell is $SHELL" # Вывод интерпретатора
sleep 1
echo "Local date and time " $(date) # Вывод текущего времени и даты