#放到OleViewDotNet.exe所在目录，查看medium可以访问的system接口
.\Startup-Module.ps1
$comDb = Get-ComDatabase -PassThru
Set-ComDatabase -Path ComDb_old.db -Database $comDb 
$comsAsSystem = $comDb.AppIDs.Values | Where-Object -FilterScript { $_.IsService -eq $True -or $_.RunAs -ieq "nt authority\system" }
$comsAsSystem  | Select-ComAccess -ProcessId (Get-Process -Name explorer).Id  | Select Name  >>system.txt


#放到OleViewDotNet所在目录，查看low可以访问的medium接口
#.\Startup-Module.ps1
#Get-ComDatabase -SetCurrent
#Set-ComDatabase .\com.db
#Get-ComDatabase .\com.db -SetCurrent
#$comdb = Get-CurrentComDatabase
#$comsAsSystem = Get-ComClass -ServerType LocalServer32 | ? RunAs -eq "Interactive User"
#$comsAsSystem  | Select-ComAccess -ProcessId  这里输入low权限进程的id | Select Name  >>medium.txt


#https://www.tiraniddo.dev/2018/09/
#https://the-deniss.github.io/posts/2021/05/17/discovering-and-exploiting-mcafee-com-objects.html
#https://vimeo.com/214856542


