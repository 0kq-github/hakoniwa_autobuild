if [ $USER = root ]; then
 echo "###############################################################"
 echo ""
 echo "魔導の箱庭 自動セットアップ for Linux"
 echo "本家URL http://world-minecraft.com/archives/693923759.html"
 echo ""
 echo "###############################################################"
 read -p "メモリ割り当て量(単位込みで入力してください): " mem
 rm -rf hakoniwa_autobuild
 mkdir hakoniwa_autobuild
 cd hakoniwa_autobuild
 curl -L -o hakoniwa.zip https://cdn.discordapp.com/attachments/832626889335504986/840799450346684446/ver2.0_.zip
 curl -L -o server.jar https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar
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
 unzip hakoniwa.zip
 echo java -Xmx$mem -Xms$mem -server -jar server.jar nogui >> start.sh
 chmod +x start.sh
 echo "eula=true" >> eula.txt
 echo "魔導の箱庭を起動中..."
 bash ./start.sh
else
 echo "権限が必要です"
 echo "sudo ./hakoniwa.sh又はsudo bash ./hakoniwa.shで実行してね"
fi
