$targetPath = "C:\VHDs\Nano_kvm.raw"
$Platform = "KVM"
$isoPath = "C:\install\iso\SW_DVD9_Win_Svr_STD_Core_and_DataCtr_Core_2016_64Bit_English_-3_MLF_X21-30350_new.iso"
$password = ConvertTo-SecureString -AsPlaintext -Force "P@ssw0rd"
cd C:\Cloubaseimage\
.\NewNanoServerImage.ps1 -IsoPath $isoPath -TargetPath $targetPath -AdministratorPassword $password -Platform $Platform