#this will give output in 0 or 1, if command run successfully
    list_files = subprocess.run(["ls", "-l"], stdout=subprocess.DEVNULL)









#import subprocess
#print(subprocess.run(["/path/to/your/shell/script", "arguments"], shell=True))
# do change the chmod of file s.sh
#print(subprocess.run(["./check_os_ver.sh"]))
#import os
#os.system("sudo useradd -m -p "+upass+" "+uname)


# importing linrary
import os
import subprocess
import sys
import getpass

# add user function
def add_user():

	# Ask for the input
	username = input("Enter Username ")
	password = input("Enter password ")

	# Asking for users password
	#password = getpass.getpass() 4
		
	try:
		# executing useradd command using subprocess module
		subprocess.run(['adduser', username, password ])	
	except:
		print(f"Failed to add user.")					
		sys.exit(1)

add_user()