([adsisearcher]"(&(objectCategory=computer)(cn=$env:COMPUTERNAME))").FindOne().Properties.memberof -replace '^CN=([^,]+).+$','$1'
