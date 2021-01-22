# Задание № 7 
# Ввести два числа с клавиатуры. Написать функцию для нахождения наибольшего общего делителя (greatest common factor) введенных чисел.

#!/bin/bash #запускает bash и передаёт в качестве параметра имя файла — z22.sh
gcf() { #объявление функции: gcf — имя функции, ( ) — gcf не команда, а функция,  { } — тело функции
while [ $first != 0 ] && [ $second != 0 ]; do #цикл выполняется, пока нет нулевых значений
if [ $first -gt $second ]; then #если первое число больше второго
first=$(($first % $second)) #записать в первую переменную остаток от деления первой на вторую
else #в противном случае
second=$(($second % $first)) #записать во вторую переменную остаток от деления второй на первую
fi #синтаксис окончания оператора условия
done #синтаксис окончания оператора цикла
echo $'\n'"The greatest common factor is: " $(($first + $second)) $'\n' #вывод результата
}
echo $'\n'"This script calculates the greatest common factor (gcf)"$'\n' #описание скрипта
sleep 1 #время на чтение описания
read -p "Enter two positive integer numbers: " first second #ввод чисел
gcf $first $second #вызов функции с указанием введенных чисел в виде входных параметров