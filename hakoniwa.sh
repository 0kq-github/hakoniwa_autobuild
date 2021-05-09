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
 wget -O hakoniwa.zip https://cdn.discordapp.com/attachments/832626889335504986/840799450346684446/ver2.0_.zip
 yum install -y unzip
 apt install -y unzip
 unzip hakoniwa.zip
 wget -O server.jar https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar
 echo "echo 魔導の箱庭を起動中...\njava -Xmx$mem -Xms$mem -server -jar server.jar nogui" >> start.sh
 chmod +x start.sh
 echo "eula=true" >> eula.txt
 ./start.sh
else
 echo "権限が必要です"
 echo "sudo ./hakoniwa.shで実行してね"
fi
