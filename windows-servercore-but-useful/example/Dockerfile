#From my base image - Windows 10 1909 with Scoop and Choco installed
FROM craigtho/windows-servercore-but-useful:latest

MAINTAINER "craigthackerx@gmail.com"
MAINTAINER "humanitarian@hotmail.co.uk"

#Use Powershell
SHELL ["powershell", "-Command"]

#Add your own user
RUN net USER myownuser "myownpassword" /ADD ; net localgroup "Administrators" "user" /ADD

#Remove the old default user
RUN net USER user /delete

#Experimental, add your SSH keys to default user
ADD id_rsa.pub C:\Users\user\.ssh\id_rsa.pub
ADD id_rsa C:\Users\user\.ssh\id_rsa.pub
ADD authorized_keys C:\Users\user\.ssh\id_rsa.pub

#Never tested, try adding the full ssh directory
ADD .ssh/ C:\Users\user\.ssh\id_rsa.pub
