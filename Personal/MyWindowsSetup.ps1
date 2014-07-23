#Install Chocolately http://chocolatey.org to enable installations
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

#Software
cinst GoogleChrome
cinst adobereader
cinst spotify

#Visual Studio. replace product key.
<#available features
Blend
LightSwitch
VC_MFC_Libraries
OfficeDeveloperTools
SQL
WebTools
Win8SDK
SilverLight_Developer_Kit
WindowsPhone80
#>
cinst VisualStudio2013Ultimate -InstallArguments "/Features:'WebTools Win8SDK' /ProductKey:AB1CD-EF2GH-IJ3KL-MN4OP-QR5ST"

#Installing dev tools
cinst notepadplusplus
cinst vim
cinst linqpad4
cinst winmerge
cinst terminals
cinst python
cinst XmlNotepad
cinst GitHub
cinst Atom
cinst wireshark
cinst sysinternals
cinst fiddler


#installing misc tools
cinst 7zip.install
cinst winrar
cinst vmwareplayer
cinst keepass
cinst windirstat

#TODO: find out how to install chrome tools such as POSTMAN