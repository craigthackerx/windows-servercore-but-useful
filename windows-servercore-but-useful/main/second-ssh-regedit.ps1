$path = "HKLM:\SOFTWARE\OpenSSH\"
$name = "DefaultShell"
$value = "$HOME\scoop\apps\git\current\bin>"
IF(!(test-path $path)){
new-item -path $path -force
new-itemproperty -path $path -name $name -value $value -propertytype tring -force | out-null
}
ELSE {
new-itemproperty -path $path -name $name -value $value -PropertyType String -force | out-null
}
