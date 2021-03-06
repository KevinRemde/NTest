﻿#enable winrm first so this command will run
#e.g. 'c:\> winrm quickconfig'
# - better yet -
#Enable-PSRemoting

Configuration WebHost
{
    param 
    ( 
        # Target nodes to apply the configuration 
        [string[]]$NodeName = 'localhost' 
    ) 

    Import-DscResource –ModuleName 'PSDesiredStateConfiguration'

    Node $NodeName
    {
        # Install the IIS role 
        WindowsFeature IIS 
        { 
            Ensure          = "Present" 
            Name            = "Web-Server" 
        } 
        # Install the ASP .NET 4.5 role 
        WindowsFeature AspNet45 
        { 
            Ensure          = "Present" 
            Name            = "Web-Asp-Net45" 
        } 

        WindowsFeature WebStaticContent
        { 
            Ensure          = "Present" 
            Name            = "Web-Static-Content" 
        } 

        WindowsFeature WebStatCompression
        { 
            Ensure          = "Present" 
            Name            = "Web-Stat-Compression"
        } 

        WindowsFeature WebDynCompression
        { 
            Ensure          = "Present" 
            Name            = "Web-Dyn-Compression"
        } 

        WindowsFeature WebMgmtConsole
        { 
            Ensure          = "Present" 
            Name            = "Web-Mgmt-Console"
        }

        Package UrlRewrite
		{
			#Install URL Rewrite module for IIS
			#DependsOn = "[WindowsFeaturesWebServer]windowsFeatures"
			Ensure = "Present"
			Name = "IIS URL Rewrite Module 2"
			Path = "http://download.microsoft.com/download/6/7/D/67D80164-7DD0-48AF-86E3-DE7A182D6815/rewrite_2.0_rtw_x64.msi"
			Arguments = "/quiet"
			ProductId = "EB675D0A-2C95-405B-BEE8-B42A65D23E11"
		}
    }
}
