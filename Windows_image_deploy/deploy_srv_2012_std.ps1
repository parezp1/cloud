git clone https://github.com/cloudbase/windows-openstack-imaging-tools.git
pushd windows-openstack-imaging-tools
Import-Module .\WinImageBuilder.psm1
Import-Module .\Config.psm1
Import-Module .\UnattendResources\ini.psm1
# Create a config.ini file using the built in function, then set them accordingly to your needs
$ConfigFilePath = ".\config.ini"
New-WindowsImageConfig -ConfigFilePath $ConfigFilePath
# To automate the config options setting:
Set-IniFileValue -Path (Resolve-Path $ConfigFilePath) -Section "DEFAULT" `
                                      -Key "wim_file_path" `
                                      -Value "D:\Sources\install.wim"
# Use the desired command with the config file you just created
New-WindowsOnlineImage -ConfigFilePath $ConfigFilePath
popd 
