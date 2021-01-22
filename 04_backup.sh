# Задание № 4 
# Разработайте скрипт резервного копирования backup.sh. Скрипт должен позволять через параметры задавать путь к каталогу, который нужно копировать, и путь к каталогу хранения резервных копий. Должна быть реализована ротация резервных копий в количестве 5 штук, при создании новой копии самая старая из имеющихся должна удаляться. 

#!/bin/bash #запускает bash и передаёт в качестве параметра имя файла — z4.sh и параметры
#инструкция по запуску скрипта 
#./z4.sh — имя
#  “/Where/To/Backup” — первый параметр, путь к хранилищу резервных копий, конвертируемый в переменную $1
#  “/What/To/Backup” — второй параметр, путь к резервируемой папке или файлу, конвертируемый в переменную $2
#  & — позволит запустить скрипт в фоновом режиме
# Будет выполнено пять копий, по одной в день
# Шестая резервная копия (backup-1) заменит первую резервную копию (backup-1)
# Седьмая копия заменит вторую и т.д.
#Kindly run this script as follows: ./z4.sh “/Where/To/Backup” “/What/To/Backup” &
#& — will run this script in background
#There will be five backup copies done, one per day, backup-1.tar.gz,.., backup-5.tar.gz.
#The sixth backup copy will erase the first one, the seventh — the second, and so on.
while : #бесконечный цикл, : — нулевое значение, которое всегда является истинным, разрешает запуск цикла
do
for (( ctr=1; ctr <=5; ctr++ )); do #Цикл for, где переменная ctr меняется от одного до пяти с шагом в единицу,
bfname=backup-$ctr #присваивает переменной bfname имя резервной копии, сост. из слова backup, дефиса и переменной ctr,
tar -cvzf $1/$bfname.tar.gz $2 &> /dev/null #подставляет переменные и выполняет создание резервной копии.
sleep 1d #Затем, приостанавливает выполнение скрипта на один день
done #маркер окончания цикла for; когда ctr будет равен пяти, цикл for остановится.
done #маркер окончания цикла while; бесконечный цикл while запустит цикл for заново.