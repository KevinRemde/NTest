Configuration SimplePushConfig {
    Node "localhost" {

#        WindowsFeature WebServer {
#            Ensure="Present"
#            Name="Web-Server"
#        }

        File MyFile {
            DestinationPath = "C:\MyFile.txt"
            Contents = "Hello World"
        }        
        
        File MyOtherFile {
            DestinationPath = "C:\MyOtherFile.txt"
            Contents = "Goodbye World"
        }
    }
}

SimplePushConfig
Start-DscConfiguration -Path .\SimplePushConfig -Wait -Verbose -ComputerName localhost
# Start-DscConfiguration -Path .\SimplePushConfig -Wait -Verbose -ComputerName localhost -Force
