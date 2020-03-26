Try {
    Set-ExecutionPolicy RemoteSigned -scope CurrentUser ;`
    scoop install git ; `
    scoop install sudo ; `
    scoop install wget which curl nano vim zip unzip unrar 7zip dos2unix sed findutils sed ; `
    scoop bucket add extras ; `
    scoop bucket add java ; `
    scoop install win32-openssh ; `
    sudo $HOME\scoop\apps\win32-openssh\current\install-sshd.ps1 ; `

    Write-Host "Editing config files" ; `
    sed -i 's;Match Group administrators;#&;g' $HOME\scoop\apps\win32-openssh\current\sshd_config_default ; `
    sed -i 's;       AuthorizedKeysFile __PROGRAMDATA__/ssh/administrators_authorized_keys;#&;g' $HOME\scoop\apps\win32-openssh\current\sshd_config_default ; `
    sed -i 's;#PubkeyAuthentication yes;PubkeyAuthentication yes;g' $HOME\scoop\apps\win32-openssh\current\sshd_config_default ; `
    sed -i 's;#PermitEmptyPasswords no;PermitEmptyPasswords yes;g' $HOME\scoop\apps\win32-openssh\current\sshd_config_default ; `

    Get-Service *ssh* | Start-Service ; `
    Set-Service -Name ssh-agent -StartupType Automatic ; Set-Service -Name sshd -StartupType Automatic
    }

    Catch {
    Write-Host $_.Exception.Message`n
    }

    Finally {
    Write-Host "Done!" ; `
    $command = $null
    }
