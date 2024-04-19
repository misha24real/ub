#!/bin/bash
BLACK='\033[30m'
GREEN='\033[92m'
RED='\033[0;31m'
NC='\033[0m'
AQUA='\033[46m'
SPORT=$SERVER_PORT
SIP=$SERVER_IP 
touch sysinstall
INSTALLSYS=$(<./sysinstall)
KEYS=$(<./key.txt)


if [[ -f "./key.txt" ]]; then
url="https://eme09834s.000webhostapp.com/$KEYS"
result=$(wget -qO- $url)

if [ "$result" == "keyvalid" ]
then
    echo -e "${GREEN}Ключ успешно активирован, приятного использования!"
else
    echo -e "${RED}Ключ введён не правильно , или вам выдан бан! Чтобы получить ключ, создайте файл key.txt , и в него напишите ключ. Чтобы получить ключ напишите админу"
exit
if [ "$result" == "banned" ]
then
    echo -e "${RED}Вы были забанены администратором!"
exit
fi
fi
else
clear
echo -e "${RED}Чтобы начать использовать скрипт, введите ключ. Чтобы получить ключ напишите Niksss#5489"
echo -e "Введите ключ: "
read -p "Введите ключ: " userInput
echo $userInput > key.txt
exit
fi
IP=$(<./ip)
PORT=$(<./port)
if [[ -f "./ip" ]]; then
echo -e "${GREEN}Please, select OS to install:"
echo -e ""
echo -e ""
echo -e "1. Ubuntu (${GREEN}Recommended${NC})"
echo -e "2. Parrot"
echo -e "3. Kali linux"
echo -e "4. Arch Linux"
echo -e "5. Debian"
echo -e "6. Fedora"
echo -e ""
echo -e ""
echo -e "Other OS:"
echo -e ""
echo -e "7. Windows 10 (beta)"
echo -e ""
echo -e "Currently installed OS: $INSTALLSYS"
echo -e ""
echo -e "Commands:"
echo -e "   сheckneofetch - Checking the neofetch of the main machine"
echo -e "   screenfetch - Checking the screenfetch of the main machine"
echo -e "   console - console for entering commands on the main machine"
echo -e "   pwd - view the path to the home directory"
echo -e "   ipport - view IP:PORT"
echo -e "   rootls - shows the contents of the root directory of the main machine"
echo -e "   stop - stopped project"
else
clear
echo -e "Due to the fact that port auto-detection does not work on many hosting sites, now you need to specify it manually in order for vnc and ssh to work"
echo -e "Enter the server port: "
read -p "Enter the server port: " userInput
echo $userInput > port
echo -e "Enter the server ip: "
read -p "Enter the server ip: " userInput
echo $userInput > ip
echo -e "${GREEN}Port and IP have been successfully entered! restart the server"
exit
fi
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
	1)
clear
echo -e "${GREEN}Installing or run Ubuntu..."
if [[ -f "./installed" ]]; then
echo -e "${AQUA}${BLACK}Добро пожаловать в Ubuntu! Приятного использования ;3"
echo -e "${AQUA}${BLACK}Порт сервера - $PORT"
echo -e "${AQUA}${BLACK}Айпи сервера - $IP (Если вдруг айпи и порт не определились, такое может быть если вы запускаете не из Pterodactyl, то vnc вряд ли будет работать .... Пока что ;3)"
echo -e "${AQUA}${BLACK}Чтобы запустить VNC сервер (рабочий стол), напишите команду vnc"
echo -e "${AQUA}${BLACK}Чтобы зайти в ssh, напишите комманду startssh, откройте powershell и напишите ssh root@$IP -p $PORT , далее введите пароль ssh$PORT"
echo -e ""
echo -e "${AQUA}${BLACK}Script Developed by Niksss#5489"
./proot -S . -w /root /usr/bin/env -i MOZ_FAKE_NO_SANDBOX=1 HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=xterm LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash --login
else
dir=$HOME
keep_file_1=$HOME/server.jar
keep_file_2=$HOME/key.txt
keep_file_3=$HOME/sysinstall
keep_file_4=$HOME/ip
keep_file_5=$HOME/port
for file in $dir/*
do
    if [[ "$file" != "$keep_file_1" && "$file" != "$keep_file_2" && "$file" != "$keep_file_3" && "$file" != "$keep_file_4" && "$file" != "$keep_file_5" ]]
    then
        rm -fr $file
    fi
done
echo "Скачивание системы... (0%)"
curl -sSLo root.tar.gz https://github.com/AndronixApp/AndronixOrigin/raw/master/Rootfs/Ubuntu20/focal-amd64.tar.gz
echo "Скачивание необходимых компонентов... (50%)"
curl -sSLo proot https://github.com/villiam1999/KaliPterodactyl/raw/main/proot
chmod u+x proot
echo "Установка системы... (0%)"
tar -xf root.tar.gz
echo "Установка системы... (100%)"
 ./proot -S . /usr/bin/env -i LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash -c "apt-get update -y >> script.log 2>&1"
 echo -e "  ${GREEN}OK"
 ./proot -S . /usr/bin/env -i LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash -c "apt update -y >> script.log 2>&1"
 echo -e "  ${GREEN}OK"
 ./proot -S . /usr/bin/env -i LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash -c "apt install curl --no-install-recommends -y >> script.log 2>&1"
 echo -e "  ${GREEN}OK"
 ./proot -S . /usr/bin/env -i LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash -c "apt install wget --no-install-recommends -y >> script.log 2>&1"
 echo -e "  ${GREEN}OK"
 ./proot -S . /usr/bin/env -i LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash -c "apt install sudo --no-install-recommends -y >> script.log 2>&1"
 echo -e "  ${GREEN}OK"
 ./proot -S . /usr/bin/env -i LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash -c "apt install neofetch --no-install-recommends -y >> script.log 2>&1"
 echo -e "  ${GREEN}OK"
 ./proot -S . /usr/bin/env -i LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash -c "touch /root/.hushlogin"
echo "  Установка дополнительного ПО (0%)"
echo "#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
sudo apt install xfe lxde-common lxde-core lxde-icon-theme lxappearance lxlock lxmenu-data \
lxpanel lxpanel-data lxrandr lxsession lxsession-data lxsession-default-apps lxsession-logout \
lxtask lxterminal lxhotkey-core lxhotkey-data lxshortcut obconf gtk2-engines \
tigervnc-standalone-server tigervnc-common dbus-x11 --no-install-recommends -y >> script.log 2>&1
echo '#!/bin/bash
echo -e "${AQUA}${BLACK}запущен VNC сервер, чтобы подключится к нему, зайдите в программу TigerVncViewer и пишите адрес $IP:$PORT"
echo -e "${RED}!!!При первом входе вам нужно будет дважды ввести пароль от вашего VNC сервера и потом написать n!!!"
vncserver -localhost no -rfbport $PORT' > /usr/bin/vnc
chmod u+x /usr/bin/vnc" > installvnc
echo -e "    ${GREEN}OK"
 ./proot -S . /usr/bin/env -i LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash -c "chmod u+x installvnc"
 ./proot -S . /usr/bin/env -i LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash -c "./installvnc"
echo -e "    ${GREEN}OK"
echo "  Установка дополнительного ПО (60%)"
echo "#!/bin/bash
sudo apt install dropbear --no-install-recommends -y >> script.log 2>&1
echo '
DROPBEAR_PORT=$PORT

DROPBEAR_EXTRA_ARGS=

DROPBEAR_BANNER=""

#DROPBEAR_RSAKEY="/etc/dropbear/dropbear_rsa_host_key"

#DROPBEAR_DSSKEY="/etc/dropbear/dropbear_dss_host_key"

#DROPBEAR_ECDSAKEY="/etc/dropbear/dropbear_ecdsa_host_key"

DROPBEAR_RECEIVE_WINDOW=65536' > /etc/default/dropbear
echo 'root:ssh$PORT' | chpasswd
echo '#!/bin/bash
echo SSH успешно запущен и готов для подключения! комманда для входе через powershell и не только ssh root@$IP -p $PORT , пароль ssh$PORT
service dropbear start' > /usr/bin/startssh
chmod u+x /usr/bin/startssh" > installssh
echo -e "    ${GREEN}OK"
 ./proot -S . /usr/bin/env -i LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash -c "chmod u+x installssh"
 ./proot -S . /usr/bin/env -i LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash -c "./installssh"
echo -e "    ${GREEN}OK"
clear
echo "Ubuntu, Please select 1 to run Ubuntu!" > sysinstall
touch installed
echo -e "${AQUA}${BLACK}Установка завершена!"
echo -e "${AQUA}${BLACK}Чтобы запустить VNC сервер (рабочий стол), напишите команду vnc"
echo -e "${AQUA}${BLACK}Чтобы зайти в ssh, напишите комманду startssh, откройте powershell и напишите ssh root@$IP -p $PORT , далее введите пароль ssh$PORT"
echo -e ""
echo -e "${AQUA}${BLACK}Script Developed by Niksss#5489"
 ./proot -S . -w /root /usr/bin/env -i LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash -c "neofetch"
rm -rf root.tar.gz
rm -rf script.log
rm -rf installssh
rm -rf installvnc
./proot -S . -w /root /usr/bin/env -i MOZ_FAKE_NO_SANDBOX=1 HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=xterm LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash --login
fi
		break
		;;

	7)
  echo -e "${RED} Coming soon..."
;;
       checkneofetch)
  echo -e "checking neofetch..."
  curl -sSLo neofetch https://raw.githubusercontent.com/dylanaraps/neofetch/master/neofetch
  chmod u+x neofetch
  ./neofetch
  rm -rf ./neofetch
;;
       pwd)
  pwd
;;
       ipport)
  echo "$SIP:$SPORT"
;;
       rootls)
  cd /
  ls
  cd $HOME
;;
       screenfetch)
  echo -e "checking screenfetch..."
  curl -sSLo screenfetch https://raw.githubusercontent.com/KittyKatt/screenFetch/master/screenfetch-dev
  chmod u+x screenfetch
  ./screenfetch
  rm -rf ./screenfetch
;;
       stop)
  echo -e "${RED}Stopped!"
  exit
;;
 esac
done
