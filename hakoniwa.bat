@echo off
set EULA=
set mem=

echo ###############################################################
echo.
echo �����̔��� ver2.1.2 �����Z�b�g�A�b�v for Windows
echo �{��URL http://world-minecraft.com/archives/693923759.html
echo eula https://www.minecraft.net/ja-jp/terms/r3/
echo.
echo ###############################################################
set /P EULA="eula�ɓ��ӂ��܂����H(y/n): "
if not %EULA%==y (
  echo eula�ɓ��ӂ���K�v������܂�
  pause
  exit
)
set /P mem="���������蓖�ė�(�P�ʍ��݂œ��͂��Ă�������): "
rd /s /q hakoniwa_autobuild
mkdir hakoniwa_autobuild
cd hakoniwa_autobuild
curl -L -o hakoniwa.zip https://cdn.discordapp.com/attachments/832626889335504986/850976277354512395/ver2.1.2.zip
curl -L -o server.jar https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar
curl -L -o log4j2_112-116.xml https://launcher.mojang.com/v1/objects/02937d122c86ce73319ef9975b58896fc1b491d1/log4j2_112-116.xml
call powershell -command "Expand-Archive -Path '.\hakoniwa.zip' -DestinationPath '.\'"
echo @echo off>start.bat
echo title �����̔���ver2.1 - 1.16.5>>start.bat
echo java -Dlog4j.configurationFile=log4j2_112-116.xml -Xmx%mem% -Xms%mem% -server -jar server.jar nogui>>start.bat
echo pause>> start.bat
echo eula=true>eula.txt
type readme.txt
echo �����̔�����N����... (�ʃE�B���h�E�ŊJ���܂�)
start start.bat
pause