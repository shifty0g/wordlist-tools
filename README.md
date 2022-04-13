# Wordlists

This is a simple script i made for dealing with wordlists.

This is a work in progress so expect bugs. Please let me know if there are i ssues or you want something adding 

**Thankyou to everyone for creating these wordlists**


Features
=============
* Sets /wordlists folder .. everything in 1 place :)
* adds a sym link to the kali and metasploit wordlists 
* install-wordlists function that will pull down wordlists from popular wordlists collections on github such as Seclists, betterpasslists...est installing all them in /wordlists
* Has variables so they can be quickly used 
* a few aliass for quickly findings wordlists



Install
========
This should work as a oneliner. let me know if there are issues 

**ZSH**

```bash
cd tmp && wget https://raw.githubusercontent.com/shifty0g/wordlist-tools/main/wordlist-tools.sh && mv wordlist-tools.sh ~/.zsh/ && chmod +x ~/.zsh/wordlist-tools.sh && echo "source ~/.zsh/wordlist-tools.sh" >> ~/.zshrc
```

**Bash**

```bash
cd tmp && wget https://raw.githubusercontent.com/shifty0g/wordlist-tools/main/wordlist-tools.sh && mv wordlist-tools.sh ~/ && chmod +x ~/wordlist-tools.sh && echo "source ~/wordlist-tools.sh" >> ~/.bashrc
```


Useage 
===============

as long as the `wordlist-tools.sh` file has been sourced 

**wordlist-install** - This function will download and install popular wordlist repos from github into /wordlists. as long as the wordlists-toos.sh file is sourced

### Variable 

There are many alias' I have included which are parths to certain wordlists. if you have tab completion you can call then with **$WORDLIST_ <tab>** - works great with zsh

```bash
export WORDLIST_DNS_110K="$SECLISTSDIR//Discovery/DNS/subdomains-top1million-110000.txt"
export WORDLIST_MSF_SNMP="/usr/share/metasploit-framework/data/wordlists/snmp_default_pass.txt"
export WORDLIST_COMMON="$WORDLISTDIR/SecLists/Discovery/Web-Content/common.txt"
```


for example you want to run gobuster you could use the variable path to the common.txt as shwon below.  it just makes things a bit quicker  

```bash
gobuster dir -u $URL -f -k -w $WORDLIST_COMMON -o gobuster.txt -s '200,204,302,307,500,403,401' -e -q -t 15
```

### Alias

I have included are few variables which make findings wordlists easier..

just call `wordlists` and it will execute a find function listing out all files in /wordlists. its a bit spammy

i like to use it with grep to narrow things down 


```bash
wordlists | grep passwords

/wordlists/betterdefaultpasslist/all-passwords.txt
/wordlists/SecLists/Passwords/xato-net-10-million-passwords-100000.txt
/wordlists/SecLists/Passwords/Common-Credentials/top-passwords-shortlist.txt
/wordlists/SecLists/Passwords/Common-Credentials/worst-passwords-2017-top100-slashdata.txt
/wordlists/SecLists/Passwords/Common-Credentials/500-worst-passwords.txt
/wordlists/SecLists/Passwords/Common-Credentials/common-passwords-win.txt
/wordlists/SecLists/Passwords/Common-Credentials/100k-most-used-passwords-NCSC.txt
/wordlists/SecLists/Passwords/Common-Credentials/top-20-common-SSH-passwords.txt
/wordlists/SecLists/Passwords/url-to-download-passwords.md
....


wordlists | grep users
/wordlists/SecLists/Payloads/Flash/xssproject.swf
/wordlists/SecLists/Fuzzing/XSS/xss-without-parentheses-semi-colons-portswigger.txt
/wordlists/my_wordlists/unsorted/xss-payload-list.txt
/wordlists/my_wordlists/web/FuzzLists/xss_escape_chars.txt
/wordlists/my_wordlists/web/FuzzLists/xss_find_inject.txt
....
```

then all u need to do is copy and paste to use it with your tool whatever 

feel free to add more alias' in the `wordlists-tools.sh` file - just try to use the full path (realpath)  :) 



Resoruces
===============
https://www.outpost9.com/files/WordLists.html

https://github.com/xajkep/wordlists

https://packetstormsecurity.com/Crackers/wordlists/

http://blog.g0tmi1k.com/2011/06/dictionaries-wordlists/

https://crackstation.net/crackstation-wordlist-password-cracking-dictionary.htm

https://github.com/xajkep/wordlists

https://github.com/gmelodie/awesome-wordlists/blob/master/README.md

https://github.com/jeanphorn/wordlist

https://contest-2010.korelogic.com/wordlists.html