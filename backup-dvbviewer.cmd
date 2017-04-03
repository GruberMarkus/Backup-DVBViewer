@echo off
pushd "%~dp0"
call :GetTime

REM ========================================================
REM Im folgenden Abschnitt kann die Batch-Datei konfiguriert werden
REM The batch file can be configured in the following section
REM ========================================================


REM Wo ist der DVBViewer installiert?
REM Where is DVBViewer installed?
set tempDVBViewerProgramPath=%ProgramFiles(x86)%\DVBViewer

REM Wo finden sich die DVBViewer-Konfigurationsdateien?
REM Where are the DVBViewer configuration files stored?
set tempDVBViewerConfigPath=%ProgramData%\CMUV\DVBViewer

REM Wo koennen temporaere Dateien abgelegt werden?
REM Where can temporary files be stored?
set tempFolder=r:

REM Wo sollen die Backup-Dateien gespeichert werden?
REM Where should the backup files be stored?
set tempBackupFileFolder=..\..\_neuaufsetzen\090 dvbviewer backup

REM Wie sollen die Backup-Dateien heißen?
REM How should the backup files be named?
set tempBackupFileName=DVBViewerSettingsBackup %year%%month%%day% %hour%%min%%sec%.7z

REM Wie viele Tage sollen Backups aufbewahrt werden?
REM How many days should backups be kept?
set DaysBackupsToKeep=14


REM ========================================================
REM Ab hier nichts mehr aendern
REM Do not change anything from here on
REM ========================================================






echo DVBViewer und Recording Service Backup
echo DVBViewer and Recording Service Backup
echo ========================================================

forfiles.exe /P "%tempBackupFileFolder%" /D 0 >nul 2>&1
if %errorlevel%==0 goto :DailyBackupExists

echo DVBViewer und Recording Service Backup| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo DVBViewer and Recording Service Backup| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo ========================================================| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Erstellt auf Computer %computername% um %year%-%month%-%day% %hour%:%min%:%sec% (yyyy-mm-dd hh:mm:ss)| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Created on computer %computername% at %year%-%month%-%day% %hour%:%min%:%sec% (yyyy-mm-dd hh:mm:ss)| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Der Ordner ProgramFiles enthaelt Daten aus dem DVBViewer Installationsordner %tempDVBViewerProgramPath%| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo The folder ProgramFiles contains data from the DVBViewer installation folder %tempDVBViewerProgramPath%| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Ordner ProgramData enthaelt Daten aus dem DVBViewer Konfigurationsordner %tempDVBViewerConfigPath%| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Folder ProgramData contains data from the DVBViewer configuration folder %tempDVBViewerConfigPath%| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo --------------------------------------------------------| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Wie die Konfiguration wiederherstellen?| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo 1) DVBViewer und Recording Service beenden| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo 2) Daten aus der Sicherungs-Datei in die urspruenglichen Verzeichnisse kopieren| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo 3) Recording Service und DVBViewer neu starten| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo How to restore the configuration?| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo 1) Close DVBViewer and Recording Service| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo 2) Copy data from the backup file to the originating folders| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo 3) Restart Recording Service and DVBViewer| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo --------------------------------------------------------| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

echo --------------------------------------------------------| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Kein Backup von heute gefunden, erstelle eines| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo No backup found for today, creating one| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo --------------------------------------------------------| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

if exist %tempFolder%\tempDVBViewerBackup rd /s /q %tempFolder%\tempDVBViewerBackup
md %tempFolder%\tempDVBViewerBackup

echo --------------------------------------------------------| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Kopiere Daten| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Copy data| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo --------------------------------------------------------| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

echo   "%tempDVBViewerConfigPath%"| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo   ohne Dateien/without files: epg.dat| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo   ohne Ordner/without folders: cache, transponders| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
robocopy "%tempDVBViewerConfigPath%" "%tempFolder%\tempDVBViewerBackup\ProgramData" /E /XF "epg.dat" "" /XD "cache" "Transponders" /MT
call :RoboCopyErrorlevel
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

echo   "%tempDVBViewerProgramPath%\GraphPresets"| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
robocopy "%tempDVBViewerProgramPath%\GraphPresets" "%tempFolder%\tempDVBViewerBackup\ProgramFiles\GraphPresets" /MIR /MT
call :RoboCopyErrorlevel
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

echo   "%tempDVBViewerProgramPath%\Images"| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
robocopy "%tempDVBViewerProgramPath%\Images" "%tempFolder%\tempDVBViewerBackup\ProgramFiles\Images" /MIR /MT
call :RoboCopyErrorlevel
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

echo   "%tempDVBViewerProgramPath%\OSDSkins"| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
robocopy "%tempDVBViewerProgramPath%\OSDSkins" "%tempFolder%\tempDVBViewerBackup\ProgramFiles\OSDSkins" /MIR /MT
call :RoboCopyErrorlevel
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

echo   "%tempDVBViewerProgramPath%\Plugins"| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
robocopy "%tempDVBViewerProgramPath%\Plugins" "%tempFolder%\tempDVBViewerBackup\ProgramFiles\Plugins" /MIR /MT
call :RoboCopyErrorlevel
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

echo   "%tempDVBViewerProgramPath%\Remotes"| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
robocopy "%tempDVBViewerProgramPath%\Remotes" "%tempFolder%\tempDVBViewerBackup\ProgramFiles\Remotes" /MIR /MT
call :RoboCopyErrorlevel
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

echo   "%tempDVBViewerProgramPath%\Scripts"| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
robocopy "%tempDVBViewerProgramPath%\Scripts" "%tempFolder%\tempDVBViewerBackup\ProgramFiles\Scripts" /MIR /MT
call :RoboCopyErrorlevel
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

echo   "%tempDVBViewerProgramPath%\Shaders"| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
robocopy "%tempDVBViewerProgramPath%\Shaders" "%tempFolder%\tempDVBViewerBackup\ProgramFiles\Shaders" /MIR /MT
call :RoboCopyErrorlevel
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

echo   "%tempDVBViewerProgramPath%\skins"| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
robocopy "%tempDVBViewerProgramPath%\skins" "%tempFolder%\tempDVBViewerBackup\ProgramFiles\skins" /MIR /MT
call :RoboCopyErrorlevel
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

echo   "%tempDVBViewerProgramPath%\VisPlugins"| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
robocopy "%tempDVBViewerProgramPath%\VisPlugins" "%tempFolder%\tempDVBViewerBackup\ProgramFiles\VisPlugins" /MIR /MT
call :RoboCopyErrorlevel
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

echo   "%tempDVBViewerProgramPath%\Config"| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
robocopy "%tempDVBViewerProgramPath%\Config" "%tempFolder%\tempDVBViewerBackup\ProgramFiles\Config" /MIR /MT
call :RoboCopyErrorlevel
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

echo   "%tempDVBViewerProgramPath%\*.ini"| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
robocopy "%tempDVBViewerProgramPath%" "%tempFolder%\tempDVBViewerBackup\ProgramFiles" *.ini /MT /S
call :RoboCopyErrorlevel
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

echo   "%tempDVBViewerProgramPath%\*.xml"| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
robocopy "%tempDVBViewerProgramPath%" "%tempFolder%\tempDVBViewerBackup\ProgramFiles" *.xml /MT /S
call :RoboCopyErrorlevel
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

echo   "%tempDVBViewerProgramPath%\*.bak"| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
robocopy "%tempDVBViewerProgramPath%" "%tempFolder%\tempDVBViewerBackup\ProgramFiles" *.bak /MT /S
call :RoboCopyErrorlevel
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

echo --------------------------------------------------------| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Komprimiere Daten| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Compress data| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo --------------------------------------------------------| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
.\tools\7za.exe a -mx9 -myx=9 -mmt -ssw "%tempBackupFileFolder%\%tempBackupFileName%" "%tempFolder%\tempDVBViewerBackup\ProgramData" "%tempFolder%\tempDVBViewerBackup\ProgramFiles"
if ERRORLEVEL 2 (
echo   Fehler beim Erstellen der Sicherungs-Datei| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo   Error creating backup file| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
)

echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

echo --------------------------------------------------------| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Loesche Backups aelter als %DaysBackupsToKeep% Tage| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Delete backups older than %DaysBackupsToKeep% days| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo --------------------------------------------------------| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Suche| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Detect| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
forfiles.exe /P "%tempBackupFileFolder%" /M "*.*" /C "cmd /c echo     @path 2>&1" /d -%DaysBackupsToKeep% 2>&1| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

echo Loeschfehler folgen| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Delete errors follow| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
forfiles.exe /P "%tempBackupFileFolder%" /M "*.*" /C "cmd /c del @path 2>&1" /d -%DaysBackupsToKeep% 2>&1| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

echo --------------------------------------------------------| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Aufraeumen| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Clean up| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo --------------------------------------------------------| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
rd /s /q %tempFolder%\tempDVBViewerBackup| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

echo --------------------------------------------------------| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Fertig| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Done| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo --------------------------------------------------------| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"

if exist "%tempBackupFileFolder%\%tempBackupFileName%" (
	.\tools\7za.exe u -mx9 -myx=9 -mmt -ssw "%tempBackupFileFolder%\%tempBackupFileName%" "%tempfolder%\log %tempBackupFileName%.txt"
	del /f "%tempfolder%\log %tempBackupFileName%.txt"
) else (
echo Sicherungs-Datei wurde nicht erstellt| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo Backup file was not created| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo.| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
)



goto :End


:DailyBackupExists
echo.
echo.
echo Es gibt bereits ein Backup von heute, Ende
echo There is already a backup for today, exiting
if exist %tempFolder%\tempDVBViewerBackup rd /s /q %tempFolder%\tempDVBViewerBackup
goto :End



:GetTime
REM Get date and time, independent from system language
FOR /F "skip=1 tokens=1-6 delims= " %%A IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
	IF %%A GTR 0 (
		SET Day=%%A
		SET Hour=%%B
		SET Min=%%C
		SET Month=%%D
		SET Sec=%%E
		SET Year=%%F
		)
)

if %month% LSS 10 set "month=0%month%"
if %day% LSS 10 set "day=0%day%"
if %hour% LSS 10 set "hour=0%hour%"
if %min% LSS 10 set "min=0%min%"
if %sec% LSS 10 set "sec=0%sec%"
goto :eof

:RoboCopyErrorlevel
if ERRORLEVEL 2 (
echo    Fehler| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo    Error| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
goto :eof
)
if ERRORLEVEL 1 (
echo   OK, OKCOPY| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
goto :eof
)
if ERRORLEVEL 0 (
echo   OK, keine Aenderungen oder nichts zu kopieren| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
echo   OK, no changes or nothing to copy| .\tools\wtee.exe -a "%tempfolder%\log %tempBackupFileName%.txt"
goto :eof
)

goto :eof

:End