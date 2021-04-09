#!/bin/bash
# simple scrtipt to download and setup all the useful wordlists from github
# works best on kali

export currentdir=$(pwd)

ln -s /usr/share/wordlists /wordlists 2>/dev/null  >/dev/null
cd /wordlists

echo "[+] My wordlists - shity0g"
git clone https://github.com/shifty0g/wordlists shifty0g

echo "[+] Seclists"
git clone https://github.com/danielmiessler/SecLists

echo "[+] Fuzz.txt"
git clone https://github.com/Bo0oM/fuzz.txt

echo "[+] web-fuzz-wordlists"
git clone https://github.com/kaimi-io/web-fuzz-wordlists

echo "[+] PayloadsAllTheThings"
git clone https://github.com/swisskyrepo/PayloadsAllTheThings

echo "[+] all.txt Jhaddix"
wget https://gist.githubusercontent.com/jhaddix/86a06c5dc309d08580a018c66354a056/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt

echo "[+] cont.txt Jhaddix"
wget https://gist.githubusercontent.com/jhaddix/b80ea67d85c13206125806f0828f4d10/raw/c81a34fe84731430741e0463eb6076129c20c4c0/content_discovery_all.txt



cd $currentdir