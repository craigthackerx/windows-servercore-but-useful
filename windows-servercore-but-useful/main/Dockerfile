#From Microsoft base image
FROM mcr.microsoft.com/windows/servercore:ltsc2019

#The people to pester when it breaks
MAINTAINER "craigthackerx@gmail.com"
MAINTAINER "humanitarian@hotmail.co.uk"

#Use Powershell
SHELL ["powershell", "-Command"]

#Set Unrestricted Policy
RUN Set-ExecutionPolicy Unrestricted

#Install chocolatey
RUN Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Install Scoop
RUN Set-ExecutionPolicy Bypass -Scope Process -Force; iwr -useb get.scoop.sh | iex

#Install Scoop
ADD first-prepare-ssh.ps1 'C:\first-prepare-ssh.ps1'
ADD second-ssh-regedit.ps1 'C:\second-ssh-regedit.ps1'

RUN C:\.\first-prepare-ssh.ps1
RUN C:\.\second-ssh-regedit.ps1
RUN Remove-Item -Force C:\first-prepare-ssh.ps1 ; Remove-Item -Force C:\second-ssh-regedit.ps1
RUN .$HOME\scoop\apps\win32-openssh\current\FixHostFilePermissions.ps1 -Confirm:$false ; .$HOME\scoop\apps\win32-openssh\current\FixUserFilePermissions.ps1 -Confirm:$false

RUN Enable-PSRemoting

EXPOSE 1222/tcp 55985/tcp 55986/tcp

RUN net USER user "Hell0w0rld" /ADD ; net localgroup "Administrators" "user" /ADD

CMD [ "powershell", "-NoExit", "-Command", "Start-Service sshd" ]
