#!/bin/bash

echo "|--|	|---- |------ |-----| |\	|"
echo "|__|	|	  |		  |		| | \	|"
echo "|\	|---- |		  |		| |  \	|"
echo "| \ 	|	  |		  |		| |   \	|"
echo "|	 \  |---- |------ |-----| |    \|"

echo "NMAP HTTP Fast Scan created by echopsudo"

IP=$(cat ip.txt)
#IP=$1 


echo "[+] Starting Nmap"

nmap -F -oG nmap_fast.txt $IP

curl "http://$IP/" > fast_curl.txt

echo " " > gobuster_dir_fast.txt


echo "[+] NMAP Finished"

PORTS=$(grep -oE "[0-9]+/open/[^,]*http" nmap_fast.txt | cut -d/ -f1)

echo "========= Running Directory Enumeration! ==========="

for PORT in $PORTS
do
	gobuster dir -u http://$IP:$PORT --wordlist /usr/share/wordlists/dirb/common.txt --no-error -q -t 64
	#echo "======== RUNNING VHOSTS SCANS ==========
	#gobuster vhost -d http://$IP:$PORTS --wordlist /usr/share/wordlists/seclists/Discovery/DNS/deepmagic.com-prefixes-top50000.txt --no-error -q -t 64 | tee gobuster_vhost_fast.txt
done >> gobuster_dir_fast.txt

wait

DIRS=$(grep -E "301|200" gobuster_dir_fast.txt | cut -d"(" -f1)


for DIR in $DIRS
do
	for PORT in $PORTS
	do
		echo "============== $DIR ============"
		curl http://$IP:$PORT/$DIR
		echo " "
	done
done >> fast_curl.txt

wait

grep -Ei -f secrets.txt fast_curl.txt | tee fast_grep_report.txt

echo "============ SCAN FINISHED ========"





 
