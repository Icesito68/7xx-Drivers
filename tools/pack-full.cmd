@echo off


      SET HOUR=%time:~0,2%
      SET dtStamp9=%date:~-2%%date:~4,2%%date:~7,2%-0%time:~1,1%%time:~3,2%
      SET dtStamp24=%date:~-2%%date:~4,2%%date:~7,2%-%time:~0,2%%time:~3,2%

      if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)


title [220X.%dtStamp%.prerelease] [Build preparation] [Packing Binaries]
REM rmdir /Q /S ..\..\7xx-Drivers-Release
REM mkdir ..\..\7xx-Drivers-Release

mkdir 7xx-Drivers-Full
mkdir 7xx-Drivers-Full\components
mkdir 7xx-Drivers-Full\definitions
xcopy /cheriky ..\components\QC7150 7xx-Drivers-Full\components\QC7150
xcopy /cheriky ..\components\QC7125 7xx-Drivers-Full\components\QC7125
xcopy /cheriky ..\components\QC7325 7xx-Drivers-Full\components\QC7325
xcopy /cheriky ..\definitions\Desktop 7xx-Drivers-Full\definitions\Desktop

"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\7xx-Drivers-Release\7xx-Drivers-Full.zip 7xx-Drivers-Full\*

REM move 7xx-Drivers-Full\components\QC7150 ..\components\QC7150
REM move 7xx-Drivers-Full\components\QC7125 ..\components\QC7125
REM move 7xx-Drivers-Full\components\QC7325 ..\components\QC7325
REM move 7xx-Drivers-Full\definitions\Desktop ..\definitions\Desktop

rmdir /Q /S 7xx-Drivers-Full