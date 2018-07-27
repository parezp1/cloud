netsh winhttp import proxy source=ie

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


$src = "http://www.python.org/ftp/python/3.3.5/python-3.3.5.amd64.msi"
$dest = "$env:temp\python-3.3.5.amd64.msi"
Invoke-WebRequest –Uri $src –OutFile $dest
Unblock-File $dest
Start-Process $dest