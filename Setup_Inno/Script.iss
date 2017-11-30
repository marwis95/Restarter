; ///////////////////////////////////////////////////////////
; // Graphical Installer for Inno Setup                    //
; // Version 3.9.01 (Radka)                                //
; // Copyright (c) 2011 - 2017 unSigned, s. r. o.          //
; // http://www.graphical-installer.com                    //
; // customers@unsigned.sk                                 //
; // All Rights Reserved.                                  //
; ///////////////////////////////////////////////////////////
 
; *********************************************
; *              Main script file.            *
; ********************************************* 
 
; Script generated with Graphical Installer Wizard.
 
; This identifier is used for compiling script as Graphical Installer powered installer. Comment it out for regular compiling.
#define GRAPHICAL_INSTALLER_PROJECT
 
#ifdef GRAPHICAL_INSTALLER_PROJECT
    ; File with setting for graphical interface
    #include "Script.graphics.iss"
#else
    ; Default UI file
    #define public GraphicalInstallerUI ""
#endif
 
; #######################################################################################
; # This Inno Setup script was generated by Visual & Installer for MS Visual Studio     #
; # Visual & Installer (c) 2012 - 2017 unSigned, s. r. o. All Rights Reserved.          #
; # Visit http://www.visual-installer.com/ for more details.                            #
; #######################################################################################

; This script is perhaps one of the simplest Inno Setup installer you can make. 
; All of the optional settings are left to their default settings. 

; See the Inno Setup documentation at http://www.jrsoftware.org/ for details on creating script files!    

;--------------------------------

[Setup]
AppName=RestartCounter
AppVersion=1.0
DefaultDirName={pf}\RestartCounter
DefaultGroupName=RestartCounter
UninstallDisplayIcon={app}\Setup_Inno.exe
Compression=lzma2
SolidCompression=yes

OutputBaseFilename=Setup_Inno
; Directive "WizardSmallImageBackColor" was modified for purposes of Graphical Installer.
WizardSmallImageBackColor={#GraphicalInstallerUI}

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "polish"; MessagesFile: "compiler:Languages\Polish.isl"

[Files]
Source: "Script.iss"; DestDir: "{app}"
Source: "..\Restarter\bin\Release\Restarter.exe"; DestDir: "{app}"
Source: "..\Restarter\bin\Release\Restarter.exe"; DestDir: "{app}"

[Icons]
Name: "{group}\Setup_Inno"; Filename: "{app}\Setup_Inno.exe"
Name: "{group}\RestartCounter"; Filename: "{app}\Restarter.exe"
Name: "{userdesktop}\RestartCounter"; Filename: "{app}\Restarter.exe"

//[Registry]
//Root: HKCU; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\Run"; ValueType: string; ValueName: "RestartCounter"; ValueData: """{app}\Restarter.exe"""; Flags: uninsdeletevalue


[Code]

// Next function is used for proper working of Graphical Installer powered installer
procedure InitializeWizard();
begin
    #ifdef GRAPHICAL_INSTALLER_PROJECT
    InitGraphicalInstaller();
    #endif

//begin
//MsgBox('Dopisa� program do autostartu?', mbConfirmation, MB_YESNO or MB_DEFBUTTON1);
//end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin

 
  //MsgBox(ExpandConstant('{language}'), mbInformation, MB_OK); 

  if ExpandConstant('{language}') = 'polish' then
  begin
	  if CurStep = ssPostInstall then
	  begin;
		if MsgBox('Uruchamiaj przy starcie systemu Windows', mbConfirmation, MB_YESNO) = IDYES then
		begin
		   RegWriteStringValue
		   (HKEY_CURRENT_USER, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Run','RestartCounter', ExpandConstant('{app}\Restarter.exe')); 
		end;
	  end;
  end;



  if ExpandConstant('{language}') = 'english' then
  begin
	  if CurStep = ssPostInstall then
	  begin;
		if MsgBox('Run with starting windows?', mbConfirmation, MB_YESNO) = IDYES then
		begin
		   RegWriteStringValue
		   (HKEY_CURRENT_USER, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Run','RestartCounter', ExpandConstant('{app}\Restarter.exe')); 
		end;
	  end;
  end;


end;
 
// Next function is used for proper working of Graphical Installer powered installer
procedure CurPageChanged(CurPageID: Integer);
begin
    #ifdef GRAPHICAL_INSTALLER_PROJECT
    PageChangedGraphicalInstaller(CurPageID);
    #endif
end;
 
// Next function is used for proper working of Graphical Installer powered installer
procedure DeInitializeSetup();
begin
    #ifdef GRAPHICAL_INSTALLER_PROJECT
    DeInitGraphicalInstaller();
    #endif
end;