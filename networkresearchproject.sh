#!/bin/bash

# Name the function as downloads1
# Follow the basic format of function as seen below
# Always remember to call the function in the last line
# Use sudo apt-get install command to download the tools/applications required for the computer
# Applications to be downloaded: massscan, sshpass, nmap
# Run the command as seen below to download all 3 applications

function downloads1()
{
	
   sudo apt-get install sshpass nmap
   echo '-----------------------Downloads are successful-----------------------'
	
}
downloads1	

echo 

# Downloads2 is for Nipe. Since I can't download Nipe as easy as the top applications, I am running a second function for it.
# First command line: Download and move into the Nipe folder
# Second command line: Install libs and dependencies
# Third command line: cd into folder
# Fourth command line: Install Nipe

function downloads2()
{

  git clone https://github.com/htrgouvea/nipe && cd nipe
  sudo cpan install Try::Tiny Config::Simple JSON
  cd nipe
  sudo perl nipe.pl install
  echo '-----------------------Nipe Installed Succesfully-----------------------'


}
downloads2

echo

# To use Nipe, you have to ensure that you are in the right folder (Nipe)
# First command line, I move into the Nipe folder
# It is crucial to add the restart command for Nipe to ensure that Nipe is activated
# After restarting, it is important to check for status to ensure it is activated (sometimes it can appear disabled)
# I use the grep command to capture the line with the ipaddress, and then I use awk print to print the active ipaddress
# Using whois and grep command, I can check for the country of origin and if Nipe is activated, I should appear anonymous
# Using if condition, if locate1 is not equal to SG, the result should show that I am anoynmous

function anonymous()
{
	echo '___Running Nipe to confirm anonymity___'
	cd /home/fathiahabdul/nipe
	sudo perl nipe.pl restart
	sudo perl nipe.pl status
	ipaddress1=$(sudo perl nipe.pl status|grep Ip|awk '{print $3}')
	locate1=$(whois "$ipaddress1"|grep -i country:|awk '{print $2}')
	echo "$locate1"
	
	if [ "$locate1" != SG ]
	
	then 
	
	   echo 'Good, I am anonymous'
	   
	fi   
}
anonymous

echo

# To connect to Ubuntu via sshpass, I log into Ubuntu and use ifconfig command for the internal ipaddress
# The internal ipaddress is read as ipaddress2 as seen below
# Using sshpass, I can establish the connection using the command as seen below
# Using nmap command, I want to scan the ipaddress 8.8.8.8 and save the output in the remote server
# Using the scp command, the output file of the nmap scan will be copied into fathiahabdul home - the filename is nmap.scan


function connectscan()
{

	ipaddress2=192.168.137.130
	echo '**Connecting via SSHPASS and run Nmap**'
    sshpass -p 'tc' ssh tc@"$ipaddress2" "nmap 8.8.8.8 -oG nmap.scan"
    scp tc@192.168.137.130:~/nmap.scan /home/fathiahabdul
    cd /home/fathiahabdul
    cat nmap.scan
	
}
connectscan

# To connect to Ubuntu via sshpass, I log into Ubuntu and use ifconfig command for the internal ipaddress
# The internal ipaddress is read as ipaddress2 as seen below
# Using sshpass, I can establish the connection using the command as seen below
# Using whois command, I can find out more about the ipaddress 8.8.8.8 and save it into a .txt file in the remote server
# Using the scp command, the .txt file will be copied into fathiahabdul home - the filename is whois.txt

echo

function whoami()
{
	
	ipaddress2=192.168.137.130
	echo '**Connect via SSHPASS & run Whois**'
    sshpass -p 'tc' ssh tc@"$ipaddress2" "whois 8.8.8.8 > whois.txt"
    scp tc@192.168.137.130:~/whois.txt /home/fathiahabdul
    cd /home/fathiahabdul
    cat whois.txt
}    
whoami

echo

function names()
{
	
	figlet fathiah abdul s2
	figlet james lim
	figlet cfc2407
	
}
names	

	

   
	



	



	
