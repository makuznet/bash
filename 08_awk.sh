# Задание № 8
# Используя сайт https://db-ip.com/db/download/ip-to-city-lite скачать базу данных ip.
# Используя инструмент awk произвести выборку поля IP из скачанного файла.
# Выборку записать в отдельный файл.
# Используя команду sed заменить в скачанном файле RU на РФ

# Curl  и wget одинаково хорошо справляются с работой по скачиванию файла. 
# Архив, распаковывается не командой tar,  а командой gzip.
# Точнее, поскольку, файл один, то к нему было применено только сжатие — gzip.


#!/bin/bash #запускает bash и передаёт в качестве параметра имя файла
echo "This script will download ip database into ipdb.csv file," #описание
echo "change \",RU,\" to \",РФ,\" and copy IP addresses to ip-ipdb.csv file."
#curl скачивает архив со списком IP адресов и сохраняет ее в файл ipdb.csv.gz; все сообщения подавляются
curl https://download.db-ip.com/free/dbip-city-lite-2020-03.csv.gz --output \ ipdb.csv.gz &> /dev/null
gzip -dq ipdb.csv.gz #скачанный архив распаковывается
#Определяемые разделителем, FS, первое, $1, и второе, $2, поля сохраняются в файл ip-ipdb.csv
awk '{ print $1","$2 }' FS="," ~/ipd.csv > ip-ipd.csv
#последовательность “,RU,” заменяется на “,РФ,” во всем файле (g) 
# -i — изменения сохраняются в тот же файл
sed -i 's/,RU,/,РФ,/g' ./ipd.csv