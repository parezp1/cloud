[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
if (-not ([System.Management.Automation.PSTypeName]'ServerCertificateValidationCallback').Type)
{
$certCallback=@"
    using System;
    using System.Net;
    using System.Net.Security;
    using System.Security.Cryptography.X509Certificates;
    public class ServerCertificateValidationCallback
    {
        public static void Ignore()
        {
            if(ServicePointManager.ServerCertificateValidationCallback ==null)
            {
                ServicePointManager.ServerCertificateValidationCallback += 
                    delegate
                    (
                        Object obj, 
                        X509Certificate certificate, 
                        X509Chain chain, 
                        SslPolicyErrors errors
                    )
                    {
                        return true;
                    };
            }
        }
    }
"@
    Add-Type $certCallback
 }
[ServerCertificateValidationCallback]::Ignore();



$src = "https://bootstrap.pypa.io/get-pip.py"
$dest = "$env:temp\get-pip.py"
Invoke-WebRequest -Uri $src -OutFile $dest  -Proxy 'http://phdproxy.cezdata.corp:8080'
python get-pip.py --no-index --find-links=$env:temp


C:\python27\python.exe -m pip --no-index --find-links=$env:temp