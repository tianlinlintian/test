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

#以20h2上low可以访问的medium接口为例，下面是clsid名  
#而medium可以访问的system接口几乎都可以通过OleViewDotNet.exe Registry->Local Services 查看
#ps :不同操作系统之间结果差距挺大，特别是Windows Server和Windows 
#Shared Reco Custom Marshaller COM
#CDPComAccountProvider
#Shield Provider User Session Agent
#CDPComRemoteTextHandler
#WorkspaceBroker Class
#PerAppRuntimeBroker
#MpUx User Session Agent
#SpatialAudioLicenseServerInteractiveUser
#CDPComActivityStoreReader
#ComponentPackageSupportServer
#Speech Named Pipe COM
#CLSID_CoreShellServiceProvider
#4D256DB0-6C34-4EC1-9704-02182D6503A6
#Voice Activation Controller COM
#WebPlatStorageBroker Class
#Account Protection Shield Broker
#69B1A7D7-C09E-40E9-A1DF-688007A2D9E4
#SuspendablePerAppRuntimeBroker
#CDPComAppRegistrationManager
#CDPComActivityStore
#CDPComNearShareBroker
#Voice Enabled Shell Host COM
#MtfTransportServerDCOM
#9A4B1918-0A2F-4422-89DD-35B3F455999C
#SmartScreen
#A4FBCBC6-4BE5-4C3D-8AB5-8B873357A23E
#CDPComTouchHandler
#CDPComUserActivitySettings
#CPrintTicket WoW Services App Container
#BA6EE7D8-190D-423A-93CC-1270E6599195
#CDPComUserSettingsProvider
#WinInetBroker Class
#EditionUpgradeBroker
#C658E5BD-817B-41C8-8FB6-5B2B386A40EA
#Data Protection Shield Broker
#CDPComAppControlHandler
#DataExchange Host
#RuntimeBroker
#CDPComRetrieveResourceModel
#Shared Reco Activation COM
#ForceField Web Protection Shield Broker
#DE50C7BB-FAA7-4A7F-BA47-BF0EFCFE433D
#Shield Elevation Broker
#CDPComResourcePolicyBroker
#Speech Shell Host Win COM
#CDPComMediaHandler
#CDPComActivityStoreInfoWatcher
#CastServerInteractiveUser
#DevicesFlow
#UIHost Class
#Windows Push Notification Platform
#UiaManagerEndpointInProcUtils
#CLSID_CoreShellLPACBrokerProvider
#ImmersiveShellBroker
#CortanaExperienceFlow
#Update Notification Component Com Handler
#Collection Staging Manager
#DevicesFlow
#UiaManagerCrossMachineStubFactory
#Language Components Installer Com Handler
#ShellServiceHostBrokerProvider
#HardwareCapability
#Setting Sync Task
#UiaManager
#UIHostNoLaunch Class
#ShareFlow
#CLSID_CoreShellCOMServerRegistrar
#AgileImmersiveShellBroker
#CLSID_CoreShellBrokerProvider
#TSFstateManager Class
#Authentication UI CredUI Out of Proc Helper for AppContainer Clients
#AppSync Setting
#HtmlLocalFileResolver
#DebugTargetManagerBrokerAdapter
#SLSClient
#CLSID_PenWorkspaceDiscoverBroker
#DebugTargetClientBrokerAdapter
#UiaManagerEndpointStateNotifier
#NowPlayingSessionManager Class
#ProgrammabilityManager Class
#Input Switch Toast Handler
#TsfManager Class
#ApplicationActivationImpl
#ActivatableApplicationRegistrar
#F12AppFrameClient
#LiveProviderRegistrar
#AvailableNetworksExperienceFlow
