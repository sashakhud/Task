#!/bin/bash


read -p "Введите имя: " REALNAME
read -p "Введите email для аутентификации на сервере: " FROM
read -p "Введите smtp сервер в формате smtp://gmail-id@smtp.gmail.com:587/: " SMTPURL
read -p "Введите пароль: " SMTPPASS
read -p "Введите email получателя: " EMAIL

path_to_conf="/home/vboxuser/.muttrc"

sed -i 's/set realname.*/set realname = "'"$REALNAME"'"/g' $path_to_conf
sed -i 's/set from.*/set from = "'"$FROM"'"/g' $path_to_conf
sed -i 's|set smtp_url.*|set smtp_url = "'"$SMTPURL"'"|g' $path_to_conf
sed -i 's|set smtp_pass.*|set smtp_pass = "'"$SMTPPASS"'"|g' $path_to_conf

ALERT=85
SDA3=$(df / | grep / | awk '{ print 0+$5 }')
if [ $SDA3 -ge $ALERT ]; then
	echo "Running out of space. $SDA3% is used with a limit 85%" |
	mutt -s "Sda3 out of space" $EMAIL
fi


