# 魔導の箱庭自動構築スクリプト
Conoha(CentOS7)とUbuntu20.04.2で動作確認済み  
ファイアウォールはfirewall-cmd又はufwの場合25565/tcpを自動で許可します  
構築後は`# bash ~/hakoniwa_autobuild/start.sh`で鯖を起動できます。  
本家はこちら  
http://world-minecraft.com/archives/693923759.html
## Useage
rootまたはsudoが使えるユーザーで実行してください

curl版
```bash
curl -OL https://raw.githubusercontent.com/0kq-github/hakoniwa_autobuild/main/hakoniwa-curl.sh && sudo bash ./hakoniwa-curl.sh
```

wget版
```bash
wget https://raw.githubusercontent.com/0kq-github/hakoniwa_autobuild/main/hakoniwa.sh && sudo bash ./hakoniwa.sh
```
