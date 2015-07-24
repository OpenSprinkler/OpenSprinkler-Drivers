[Setup]
AppName = OpenSprinkler Drivers
AppVerName = OpenSprinkler Drivers 1.0.0
AppPublisher = OpenSprinkler
AppPublisherURL = https://opensprinkler.com
AppVersion = 1.0.0
DefaultDirName = {pf}\OpenSprinkler
DefaultGroupName = OpenSprinkler
Compression = lzma
SolidCompression = yes
MinVersion = 0,5.0
PrivilegesRequired = admin
OutputDir=..\

[Dirs]
Name: {app}\certs; Permissions: users-modify
Name: {app}\drivers; Permissions: users-modify

[Files]
Source: "certs\*"; DestDir: "{app}\certs"; Flags: replacesameversion recursesubdirs createallsubdirs
Source: "drivers\*"; DestDir: "{app}\drivers"; Flags: replacesameversion recursesubdirs createallsubdirs
Source: "dpinst.xml"; DestDir: "{app}"; Flags: replacesameversion
Source: "install_32.exe"; DestDir: "{app}"; Flags: replacesameversion
Source: "install_64.exe"; DestDir: "{app}"; Flags: replacesameversion

[Icons]
Name: "{group}\Uninstall OpenSprinkler Drivers"; Filename: "{uninstallexe}"

[Run]
Filename: "{cmd}"; Parameters: "/C certutil -addstore ""Root"" ""{app}\certs\2.0.cer"""; Flags: "runhidden";
Filename: "{cmd}"; Parameters: "/C certutil -addstore ""TrustedPublisher"" ""{app}\certs\2.0.cer"""; Flags: "runhidden";

Filename: "{cmd}"; Parameters: "/C certutil -addstore ""Root"" ""{app}\certs\2.1.cer"""; Flags: "runhidden";
Filename: "{cmd}"; Parameters: "/C certutil -addstore ""TrustedPublisher"" ""{app}\certs\2.1.cer"""; Flags: "runhidden";

Filename: "{app}\install_32.exe"; Check: not IsWin64; Flags: "runhidden";
Filename: "{app}\install_64.exe"; Check: IsWin64; Flags: "runhidden";
