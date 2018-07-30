NanoServer OpenStack build automation

A full example is available in Build.ps1.
$targetPath = "C:\VHDs\Nano.vhdx"
$isoPath = "C:\ISO\Windows_Server_2016_Technical_Preview_4.ISO"
$password = ConvertTo-SecureString -AsPlaintext -Force "P@ssw0rd"

.\NewNanoServerImage.ps1 -IsoPath $isoPath -TargetPath $targetPath -AdministratorPassword $password
