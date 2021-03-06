if [ $USER = root ]; then
 echo "###############################################################"
 echo ""
 echo "魔導の箱庭 ver2.1.2 自動セットアップ for Linux"
 echo "本家URL http://world-minecraft.com/archives/693923759.html"
 echo "eula https://www.minecraft.net/ja-jp/terms/r3/"
 echo ""
 echo "###############################################################"
 read -p "eulaに同意しますか？(y/n): " eula
 if [ $eula = y ]; then
  :
 else
  echo "eulaに同意する必要があります"
  exit
 fi
 read -p "メモリ割り当て量(単位込みで入力してください): " mem
 cd ~
 rm -rf hakoniwa_autobuild
 mkdir hakoniwa_autobuild
 chmod +x hakoniwa_autobuild
 cd hakoniwa_autobuild
 java -version &> /dev/null
  if [ $? -ne 0 ] ; then
   yum install -y java-1.8.0-openjdk-headless
   apt install -y openjdk-8-jre-headless
  else
   :
 fi
 unzip -hh &> /dev/null
  if [ $? -ne 0 ] ; then
   yum install -y unzip
   apt install -y unzip
  else
   :
 fi
 wget -O hakoniwa.zip https://cdn.discordapp.com/attachments/832626889335504986/850976277354512395/ver2.1.2.zip
 wget -O server.jar https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar
 wget -O log4j2_112-116.xml https://launcher.mojang.com/v1/objects/02937d122c86ce73319ef9975b58896fc1b491d1/log4j2_112-116.xml
 unzip hakoniwa.zip
 echo java -Dlog4j.configurationFile=log4j2_112-116.xml -Xmx$mem -Xms$mem -server -jar server.jar nogui >> start.sh
 chmod +x start.sh
 echo "eula=true" >> eula.txt
 firewall-cmd --help &> /dev/null
  if [ $? -ne 0 ] ; then
   ufw allow 25565/tcp
   ufw reload
  else
   firewall-cmd --permanent --add-port=25565/tcp
   firewall-cmd --reload
 fi
 echo "魔導の箱庭を起動中..."
 bash ./start.sh
else
 echo "root権限が必要です"
 echo "sudo bash ./hakoniwa.sh又はrootユーザーで実行してね"
fi
