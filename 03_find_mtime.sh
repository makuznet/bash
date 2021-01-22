# Задание № 3 
# Написать скрипт, который ищет в системе недавно измененные файлы. При этом на вход скрипт получает два параметра, первый — это каталог, в котором будем искать файлы, второй — это период, за который будет производиться поиск. Результат сохранить в файл.

# touch z3.sh
# chmod u+x z3.sh
# vi z3.sh

#!/bin/bash #запускает bash и передаёт в качестве параметра имя файла — z3.sh
echo $'\n' #немного воздуха для удобочитаемости вывода
echo "Here you can find files that have been changed recently" #объяснение назначения программы
echo $'\n'
echo "Enter path where you want to make a search? " #введите путь поиска
read searchfolder #считывать ввод пользователя и присвоить результат ввода переменной searchfolder 
echo $'\n'
echo "Enter a desired search period, days: " #введите желаемый диапазон в днях
read searchperiod #считывать ввод пользователя и присвоить результат ввода переменной searchperiod
echo $'\n'
echo "Here are your recently changed files:" > z3.log # заглавная строка результирующего файла
#найти файлы (-type f) с любым именем (‘*.*’), измененные (-mtime) за заданный период (-$searchperiod)
#и передать ( | ) результат выполнения следующей команде (xargs), которая несколько раз
#запустит команду, отображающую информацию о файле (stat) в формате (-c) времени изменения (%y)
#и имени файла (%n), и передаст свой результат ( | ) команде (cut), которая уберет символы (-c) с первого по 17 и с 52 до конца
#строки, и выведет в файл результат (дата, пробел, время изменения, двоеточие, имя файла)
find $searchfolder -type f -name '*.*' -mtime -$searchperiod | xargs stat -c %y:%n | cut -c 1-17,52- >> z3.log

 
# вывод в консоль

# Here you can find files that have been changed recently

# Enter a path where you want to make a search? /home/makuznet

# Enter a desired search period, days: 3


# $ cat z3.log #вывод содержимого z3.log

# Here are your recently changed files:

# 2020-03-13 22:16:.viminfo
# 2020-03-13 22:16:zadanie3.sh
# 2020-03-12 12:04:hamlet.txt
# 2020-03-13 19:36:.lesshst
# 2020-03-12 16:44:.cloud-locale-test.skip
# 2020-03-13 21:49:.bash_history
# 2020-03-13 16:59:zadanie1.sh
