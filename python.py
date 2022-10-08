import subprocess
#print(subprocess.run(["/path/to/your/shell/script", "arguments"], shell=True))
# do change the chmod of file s.sh
print(subprocess.run(["./check_os_ver.sh"]))
