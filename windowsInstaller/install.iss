
#define MyAppName "FsFTP-Server"
#define MyAppVersion "1.0"
#define MyAppPublisher "worv.fr"
#define MyAppURL "https://worev.fr/"
#define MyAppExeName "service.exe"
#define FTPRuleName "FsFTP ftpserver.exe"
#define HTTPRuleName "FsFTP webserver.exe"
#define allowFtp "Adding Firewall Exception (TCP IN) for ftpserver.exe"
#define allowWew "Adding Firewall Exception (TCP IN) for webserver.exe"

[Setup]

AppId={{E207E073-945A-4777-9B3C-7861E934A5ED}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName="{sd}\fsftp"
DisableProgramGroupPage=yes
; Unnecessary because DisableProgramGroupPage is disabled 
;AlwaysShowGroupOnReadyPage=no

;LicenseFile=C:\GoPath\windows\licence.rtf
;InfoAfterFile=C:\GoPath\windows\infos.rtf
OutputDir=C:\GoPath\windows\
OutputBaseFilename=install
SetupIconFile=C:\GoPath\windows\icon.ico
Compression=lzma
SolidCompression=yes
PrivilegesRequired=admin
AllowNoIcons=yes
;;WizardSmallImageFile=C:\GoPath\windows\icon.bmp
;;WizardImageFile=C:\GoPath\windows\logo.bmp
DisableWelcomePage=yes
UninstallDisplayIcon=C:\GoPath\windows\icon.ico
UninstallDisplayName={#MyAppName} {#MyAppVersion}
DefaultGroupName={#MyAppName}


[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"


[Files]
Source: "C:\GoPath\windows\fsftp\service.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\GoPath\windows\fsftp\ftpserver.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\GoPath\windows\fsftp\webserver.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\GoPath\windows\fsftp\icon.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\GoPath\windows\fsftp\data\*"; DestDir: "{app}\data"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\GoPath\windows\fsftp\html\*"; DestDir: "{app}\html"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\GoPath\windows\fsftp\lang\*"; DestDir: "{app}\lang"; Flags: ignoreversion recursesubdirs createallsubdirs


[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{app}"; IconFilename: "{app}\icon.ico";
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"; IconFilename: "{app}\icon.ico";
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{app}"; IconFilename: "{app}\icon.ico";

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
Filename: https://127.0.0.1:3000/; Description: "Open control panel - Ouvrire le panneau de controle"; Flags: postinstall shellexec

;;;;;;;;;;;;;;;;;

; Add firewall exception
; Old version
Filename: "{sys}\netsh.exe"; Parameters: "firewall add allowedprogram ""{app}\ftpserver.exe"" ""{#FTPRuleName}"" ENABLE ALL";StatusMsg: "{#allowFtp}"; Flags: runhidden; MinVersion: 0,5.01.2600sp2; 
Filename: "{sys}\netsh.exe"; Parameters: "firewall add allowedprogram ""{app}\webserver.exe"" ""{#HTTPRuleName}"" ENABLE ALL";StatusMsg: "{#allowWew}"; Flags: runhidden; MinVersion: 0,5.01.2600sp2; 

; New version
; First remove
Filename: "{sys}\netsh.exe"; Parameters: "advfirewall firewall delete rule name=""{#FTPRuleName}"" ";Flags: runhidden
Filename: "{sys}\netsh.exe"; Parameters: "advfirewall firewall delete rule name=""{#HTTPRuleName}"" ";Flags: runhidden

; Then Add
Filename: "{sys}\netsh.exe"; Parameters: "advfirewall firewall add rule name=""{#FTPRuleName}"" protocol=TCP dir=in action=allow program=""{app}\ftpserver.exe"" "; StatusMsg: "{#allowFtp}"; Flags: runhidden;
Filename: "{sys}\netsh.exe"; Parameters: "advfirewall firewall add rule name=""{#HTTPRuleName}"" protocol=TCP dir=in action=allow program=""{app}\webserver.exe"" "; StatusMsg: "{#allowWew}"; Flags: runhidden;

[UninstallRun]
Filename: "{sys}\netsh.exe"; Parameters: "firewall delete allowedprogram program=""{app}\ftpserver.exe"""; Flags: runhidden; MinVersion: 0,5.01.2600sp2;
Filename: "{sys}\netsh.exe"; Parameters: "firewall delete allowedprogram program=""{app}\webserver.exe"""; Flags: runhidden; MinVersion: 0,5.01.2600sp2;

Filename: "{sys}\netsh.exe"; Parameters: "advfirewall firewall delete rule name=""{#FTPRuleName}"" ";Flags: runhidden
Filename: "{sys}\netsh.exe"; Parameters: "advfirewall firewall delete rule name=""{#HTTPRuleName}"" ";Flags: runhidden
Filename: "{app}\{#MyAppExeName}"; Parameters: "stop all"; Flags: runhidden


[Registry]
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\Run"; ValueType: string; ValueName: "{#MyAppName}"; ValueData: "{app}\{#MyAppExeName}"; Flags: uninsdeletevalue

