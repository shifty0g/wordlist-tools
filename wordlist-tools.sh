#!/bin/bash
LAST_UPDATED="04/09/22"
VERSION=0.9

#
# TO DO
#==============
# add more key wordlists
# a
# create and build up my wordlists
# add my custom lists + exam one
# update install so git checks for update
# add stuff in here for creating wordlists - look at what cool scripts exist
# crunch,cewl, wordlist from site, wordlist from file https://github.com/maldevel/PenTestKit/tree/master/cracking
# cupp - https://github.com/Mebus/cupp
#
# Tested on Kali Only 
#
# Other Sources 
#
#https://blog.g0tmi1k.com/2011/06/dictionaries-wordlists/
#https://crackstation.net/crackstation-wordlist-password-cracking-dictionary.htm
#https://ftp.funet.fi/pub/unix/security/passwd/crack/dictionaries/dictionaries/

export currentdir=$(pwd)

# this is the main locatiomn where everything is 
export WORDLISTDIR="/wordlists"

export TOOLSDIR="/tools"


###########
# Variables
############

export WORDLIST_MEDIUM="$WORDLISTDIR/dirbuster/directory-list-lowercase-2.3-medium.txt"
export WORDLIST_COMMON="$WORDLISTDIR/SecLists/Discovery/Web-Content/common.txt"
export WORDLIST_ALL="$WORDLISTDIR/all.txt"
export WORDLIST_CONTENTDISCOVERY="$WORDLISTDIR/content_discovery_all.txt"


export SECLISTSDIR="$WORDLISTDIR/SecLists"

export WORDLIST_DNS_110K="$SECLISTSDIR//Discovery/DNS/subdomains-top1million-110000.txt"
export WORDLIST_WEB_DIRS_LARGE="$SECLISTSDIR/Discovery/Web-Content/raft-large-directories.txt"
export WORDLIST_WEB_DIRS_SMALL="$WSECLISTSDIR/Discovery/Web-Content/raft-small-directories.txt"
export WORDLIST_WEB_FILES_LARGE="$SECLISTSDIR/Discovery/Web-Content/raft-large-files.txt"
export WORDLIST_WEB_FILES_SMALL="$SECLISTSDIR/Discovery/Web-Content/raft-small-files.txt"
export WORDLIST_WEB_BIG="$SECLISTSDIR/Discovery/Web-Content/big.txt"
export WORDLIST_WEB_ROBOTS1k="$SECLISTSDIR/Discovery/Web-Content/RobotsDisallowed-Top1000.txt"
export WORDLIST_ROCKYOU="/usr/share/wordlists/rockyou.txt"
export WORDLIST_USERNAMES_SHORT="$SECLISTSDIR/Usernames/top-usernames-shortlist.txt"
export WORDLIST_USERNAMES_SHORT="$SECLISTSDIR/Usernames/top-usernames-shortlist.txt"
export WORDLIST_SUBDOMAINS_TOP5k="$SECLISTSDIR/Discovery/DNS/subdomains-top1million-5000.txt"

# metasploit wordlists - /usr/share/metasploit-framework/data/wordlists/
export WORDLIST_MSF_SNMP="/usr/share/metasploit-framework/data/wordlists/snmp_default_pass.txt"
export WORDLIST_MSF_UNIX_USERS="/usr/share/metasploit-framework/data/wordlists/unix_users.txt"

# Pass Lists
export PASS_password="/wordlists/my_wordlists/passwords/pass_keyword-password.txt"
export PASS_top16k="/wordlists/my_wordlists/passwords/pass_top-16k.txt"
export PASS_top3k="/wordlists/my_wordlists/passwords/pass_top-3k.txt"
export PASS_top500="/wordlists/my_wordlists/passwords/pass_top-500.txt"
export PASS_top100k="$SECLISTSDIR/Passwords/Common-Credentials/10-million-password-list-top-100000.txt"


#
# some helpful functions to quickly list out files 
alias find-wordlists="wordlists"
alias wordlists='find -L /wordlists -type f 2>/dev/null'
alias wordlists-metasploit='find -L /usr/share/metasploit-framework/data/wordlists/ -type f 2>/dev/null'



function PWListExtra {
# this will add users to the password list. it will reverse them too 
# needs duplicut 

export OUTPUT="newpass.txt"

echo "PWListExtra - adds extra stuff to passwordlist"
echo "================================="
if [ ! -z "$1" ]||[ ! -z "$2" ]; then
	# add some silly basic passwords - https://nordpass.com/most-common-passwords-list/
	echo "password" >> tempass
	echo "qwerty" >> tempass
	echo "Password123!" >> tempass
	echo "password1" >> tempass
    echo "12345" >> tempass
	echo "123456" >> tempass
	echo "12345678" >> tempass
	echo "123123" >> tempass
	echo "123456789" >> tempass
	echo "111111" >> tempass
	echo "liverpool" >> tempass
	
	# blanks 
	echo "" >> tempass
	echo " " >> tempass
	echo "  " >> tempass
	
	# users 
	cat $1 >> tempass
	cat $1 | rev >> tempass
	
	# pass 
	cat $2 >> tempass
	
	# remove dupes using duplicut
	duplicut tempass -o $OUTPUT
	
	echo "Boom! output: $(realpath $OUTPUT)"
else
	echo "[*] USEAGE: $0 [users file] [pass file]"
fi

}

function wordlists-install () {

echo ""
echo "Thankyou to everyone who put these lists together :):)"
echo "go make a coffee"


# this will link the default kali wordlists folder so it is accessble via /wordlists .. nice and easy
ln -s /usr/share/wordlists $WORDLISTDIR 2>/dev/null  >/dev/null
cd $WORDLISTDIR

# give a link to the metasploit ones here also /wordlists/metasploit
ln -s /usr/share/metasploit-framework/data/wordlists/ metasploit

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

echo "[+] Bug-Bounty-Wordlists"
git clone https://github.com/Karanxa/Bug-Bounty-Wordlists

echo "[+] all.txt Jhaddix"
wget https://gist.githubusercontent.com/jhaddix/86a06c5dc309d08580a018c66354a056/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt

echo "[+] content_discovery_all -  Jhaddix"
wget https://gist.githubusercontent.com/jhaddix/b80ea67d85c13206125806f0828f4d10/raw/c81a34fe84731430741e0463eb6076129c20c4c0/content_discovery_all.txt

echo "[+] Probable-Wordlists"
git clone https://github.com/berzerk0/Probable-Wordlists/

echo "[+] Xajkep - WOrdlists "
git clone https://github.com/xajkep/wordlists xajkep-wordlists

echo "[+] kkrypt0nn "
git clone https://github.com/kkrypt0nn/Wordlists kkrypt0nn-wordlists

echo "[+] random-robbie bruteforce-lists"
git clone https://github.com/random-robbie/bruteforce-lists random-robbie-lists

echo "[+] jeanphorn-wordlists"
git clone https://github.com/jeanphorn/wordlist jeanphorn-wordlists

echo "[+] j3ers3-PassList "
git clone https://github.com/j3ers3/PassList j3ers3-PassList 

echo "[+] awesome-default-passwords"
git clone https://github.com/nyxxxie/awesome-default-passwords

echo "[+] UltimateCMSWordlists.git"
git clone https://github.com/JavierOlmedo/UltimateCMSWordlists.git

echo "[+] betterdefaultpasslist"
git clone https://github.com/govolution/betterdefaultpasslist

echo "[+] webapp wordlists"
git clone https://github.com/p0dalirius/webapp-wordlists

echo "[+] a-full-list-of-wordlists"
git clone https://github.com/SilverPoision/a-full-list-of-wordlists/
mv a-full-list-of-wordlists/Wordlists/burp_pack/ .
rm a-full-list-of-wordlists -rf
mv burp_pack a-full-list-of-wordlists

echo "[+] big-list-of-naughty-strings"
git clone https://github.com/minimaxir/big-list-of-naughty-strings.git

echo "[+] fuzzdb"
git clone https://github.com/fuzzdb-project/fuzzdb.git

echo "[+] wfuzz"
git clone  https://github.com/xmendez/wfuzz.git

echo "[+] foospidy-payloads"
git clone https://github.com/foospidy/payloads.git -o foospidy-payloads

echo "[+] j3ers3-PassList"
git clone https://github.com/j3ers3/PassList j3ers3-PassList

echo "[+] OneListForAll"
git clone https://github.com/six2dez/OneListForAll

echo "[+] Default-Credentials"
https://github.com/netbiosX/Default-Credentials

#git clone https://github.com/danielmiessler/RobotsDisallowed.git

echo "[+] Brutas"
git clone https://github.com/tasooshi/brutas

echo "[+] Millionpass.txt"
git clone https://github.com/shubhamg0sai/millionpass.txt

echo "[+] Statistically Likely Usernames"
git clone https://github.com/purpleracc00n/statistically-likely-usernames
# orginal - https://github.com/insidetrust/statistically-likely-usernames

echo "[+] kkrypt0nn Wordlists"
git clone https://github.com/kkrypt0nn/Wordlists kkrypt0nn

cd $currentdir
}

function wordlist-tools-install {

cd $TOOLSDIR

echo "[+] PyDog"
git clone https://github.com/maudits/PyDog

echo "[+] namemash"
git clone https://github.com/purpleracc00n/namesmash
cd namesmash
wget https://gist.githubusercontent.com/superkojiman/11076951/raw/74f3de7740acb197ecfa8340d07d3926a95e5d46/namemash.py -o namemash-original.py
cd $TOOLSDIR

echo "[+] CewL"
git clone https://github.com/digininja/CeWL

echo "[+] Mentalist"
mkdir Mentalist
cd Mentalist
wget https://github.com/sc0tfree/mentalist/releases/download/v1.0/Mentalist-v1.0-Linux-x86_64.zip
gzip -d Mentalist-v1.0-Linux-x86_64.zip
#wget https://github.com/sc0tfree/mentalist/releases/download/v1.0/Mentalist-v1.0-Linux-x86.zip
#gzip -d Mentalist-v1.0-Linux-x86.zip
cd $TOOLSDIR

echo "[+] Pydicator"
git clone https://github.com/LandGrey/pydictor

echo "[+] Duplicut"
git clone https://github.com/nil0x42/duplicut
cd duplicut/ && make
cd $TOOLSDIR

echo "[+] Username_Generator"
git clone https://github.com/therodri2/username_generator.git

echo "[+] CUPP"
git clone https://github.com/Mebus/cupp.git

echo "[+] Default Creds Cheatsheet"
git clone https://github.com/ihebski/DefaultCreds-cheat-sheet

echo "[+] psudohash"
git clone https://github.com/t3l3machus/psudohash
cd ./psudohash
chmod +x psudohash.py
cd $TOOLSDIR

echo "[+] bopscrk"
pip install bopscrk
#https://github.com/r3nt0n/bopscrk


# end 
cd $currentdir
}

