import paramiko
import sys

hostname = "ppxext.t-mobile.com"
port = 10022
username = "AdobeSearch"
password = "Search*357#"
command = "ls"

ssh_client = paramiko.SSHClient()
ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())

ssh_client.connect(hostname = hostname, port = 10022, username=username, password=password)

ftp = ssh_client.open_sftp()

ftp.chdir("AdobeSearch")
files = ftp.listdir()
#files = ftp.listdir()[0]
print(files)
#stdout = ssh_client.exec_command(command)
#print stdout.read()

ssh_client.close()