# windows-servercore-but-useful
The actually useful Windows 10 Container


This is the repo for a Docker container made by myself and Darren Fraser-Green (git.darren.lol) which is the base Windows 10 container by `mcr.microsoft.com/windows:1909`, only, its actually useful. It is useful in the fact that SSH in installed and runs as default with a user other than the `ContainerAdministrator` user.  This means you can create this as your Windows 10 container, having useful packages, package managers and `ssh` enabled by default.

The container isn't recomended for production out of the box, but that's for you to figure out.

What's includes:

- Win32-OpenSSH by default.  Empty Password and PubKey Authentication enabled.
     - `git-bash` is the default OpenSSH shell/
- Scoop with `extras` and `java` buckets e.g. `scoop`
- Chocolatey e.g. `choco`
- `7zip`
- `curl`
- `dos2unix`
- `findutils`
- `git`
- `grep`
- `nano`
- `sudo`
- `unrar`
- `unzip`
- `vim`
- `wget`
- `which`

#How to use:

##Make a Dockerfile and add your SSH key into the container as well as the authorized key file:

```
FROM craigtho/windows-but-useful:latest

ADD id_rsa.pub C:\Users\ContainerAdministrator\.ssh\id_rsa.pub
ADD authorized_keys C:\Users\ContainerAdministration\.ssh\authorized_keys
```
Then:
```
docker run -it --rm -m=8GB --cpus=4 -p 1322:22/tcp craigtho/windows-servercore-but-useful:latest
```
 And then:
`Username=user`
`Password=Passw0rd`

 ```ssh -p 1222 user@127.0.0.1```

#Use Docker-compose.yml

```docker-compose up```

This will build the Dockerfile inside the example folder

See the example folder for pointers
