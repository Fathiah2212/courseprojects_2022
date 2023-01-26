#!/usr/bin/python3


# Using the platform module, I can find out the current OS version in use.
# First, I need to import the platform.
# Storing the command into a variable as seen below.
# Using the print command in python, I can print the specific message with the intended result, that is the user's os version.
# Reference link: https://note.nkmk.me/en/python-platform-system-release-version/

print('----------------------------------Host Infomation----------------------------------------')
import platform
version=platform.platform()
print("The user's current OS version:", version)

# To ask for the IP address that is bound to eth0 interface, I can use the netifaces module.
# Initially, I tried with os.system, however I couldn't find a solution to hide the 0 that gets produced when I call os.system.
# First, I need to import the module: netifaces.
# Then, storing the command in a variable so that it will be easy for me to print it out in an intended message below.
# [ni.AF_INET] sockets are IP addresses and port numbers, by calling this out I can print IP address, netmask, broadcast.
# Reference link: https://stackoverflow.com/questions/24196932/how-can-i-get-the-ip-address-from-a-nic-network-interface-controller-in-python.

import netifaces as ni
privateip=ni.ifaddresses('eth0')[ni.AF_INET][0]['addr']
print('The current private IP is: ' , privateip)

# I use the third party method to get the external ip address.
# For this, we make a GET request on the given address using the get() method of the requests library.
# Storing the command in a variable so that it will be easy for me to print it out in an intended message below.
# Reference link: https://pencilprogrammer.com/python-programs/check-your-external-ip-address/

from requests import get
extip=get('https://api.ipify.org').text
print('The current public IP is: ' , extip)

# Similar to finding the private IP, I use Netifaces module to get the default gateway.
# The benefit of this approach is that you don't need to differentiate approaches between Windows and Linux.
# Reference link: https://stackoverflow.com/questions/53902519/find-default-gateway-address-for-windows-and-linux-on-python

import netifaces
gateways=netifaces.gateways()
defgateway=gateways['default'][netifaces.AF_INET][0]
print('The current default gateway is: ' , defgateway)

print("\n")

print('-----------------------------Hard Disk Size Information----------------------------------')

# I use shutil module, which has the disk usage function.
# The command to use is: total, used, free = shutil.disk_usage("/") 
# (2**30) is used to convert from bytes to gigabyte.
# Reference link: https://stackoverflow.com/questions/48929553/get-hard-disk-size-in-python

import shutil
total, used, free = shutil.disk_usage("/")
print("Total: %d GiB" % (total // (2**30)))
print("Used: %d GiB" % (used // (2**30)))
print("Free: %d GiB" % (free // (2**30)))

print("\n")

print('------------------------------Top 5 Directories and Size---------------------------------')

# I use os module to run the top 5 directories that is taking up the disk space.
# The command use is du -h|sort -nr|head -n 5.
# du - displays a list of the contents of the current directory, and how much space they’re using.
# sort - sort lines of given input data, and -r reverse the result of comparisons.
# head -  show the first 5 lines.
# Reference link: https://www.cyberciti.biz/faq/how-do-i-find-the-largest-filesdirectories-on-a-linuxunixbsd-filesystem/, https://phoenixnap.com/kb/linux-check-disk-space.

import os
os.system("du -h|sort -nr|head -n 5")

print("\n")

print('------------------------------CPU Usage--------------------------------------------------')

# I use time module to allow me to execute the function repeated every 10s.
# The psutil module allows for a developer to view the resource usage for a computer system.
# The command for CPU usage is: psutil.cpu_percent()
# The internal=1 tells the function to block for 1 second, for more accurate result.
# Reference link: https://iq.opengenus.org/cpu-and-ram-usage-python/

import time
import psutil
while True:
	print('The CPU usage is: ',psutil.cpu_percent(interval=1) , '%')
	time.sleep(10)
