#!/bin/bash
LAST_UPDATED="13/04/22"
VERSION=0.9

#
# TO DO
#==============
# add more key seclists
# create and build up my wordlists
# add my custom lists + exam one
# update install so git checks for update
# add stuff in here for creating wordlists - look at what cool scripts exist
# crunch,cewl, wordlist from site, wordlist from file https://github.com/maldevel/PenTestKit/tree/master/cracking
# cupp - https://github.com/Mebus/cupp
#
# Tested on Kali Only 
#
#

export currentdir=$(pwd)



# this is the main locatiomn where everything is 
export WORDLISTDIR="/wordlists"


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
export WORDLIST_PASS_TOP100k="$SECLISTSDIR/Passwords/Common-Credentials/10-million-password-list-top-100000.txt"
export WORDLIST_SUBDOMAINS_TOP5k="$SECLISTSDIR/Discovery/DNS/subdomains-top1million-5000.txt"

# metasploit wordlists - /usr/share/metasploit-framework/data/wordlists/
export WORDLIST_MSF_SNMP="/usr/share/metasploit-framework/data/wordlists/snmp_default_pass.txt"
export WORDLIST_MSF_UNIX_USERS="/usr/share/metasploit-framework/data/wordlists/unix_users.txt"



#
# some helpful functions to quickly list out files 
alias wordlists='find -L /wordlists -type f 2>/dev/null'
alias wordlists-metasploit='find -L /usr/share/metasploit-framework/data/wordlists/ -type f 2>/dev/null'



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

echo "[+] glpi"
git clone https://github.com/p0dalirius/webapp-wordlists/tree/main/IT-Asset-Management/glpi glpi

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


git clone https://github.com/SilverPoision/a-full-list-of-wordlists/
mv a-full-list-of-wordlists/Wordlists/burp_pack/ .
rm a-full-list-of-wordlists -rf

# Other Sources 

#https://blog.g0tmi1k.com/2011/06/dictionaries-wordlists/
#https://crackstation.net/crackstation-wordlist-password-cracking-dictionary.htm

cd $currentdir
}


