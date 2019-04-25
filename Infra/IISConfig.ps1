
# Install IIS WindowsFeature

Install-WindowsFeature -name Web-Server -IncludeManagementTools

# set-executionpolicy unrestricted

$SiteFolderPath = "C:\inetpub\wwwroot"              # Website Folder
$SiteAppPool = "MyAppPool"                  # Application Pool Name
$SiteName = "MySite"                        # IIS Site Name
$SiteHostName = "demo.com"            # Host Header

New-Item $SiteFolderPath -type Directory
Set-Content $SiteFolderPath\index..html "<h1>Hello IIS</h1>"
New-Item IIS:\AppPools\$SiteAppPool
New-Item IIS:\Sites\$SiteName -physicalPath $SiteFolderPath -bindings @{protocol="http";bindingInformation=":80:"+$SiteHostName}
Set-ItemProperty IIS:\Sites\$SiteName -name applicationPool -value $SiteAppPool

# Complete