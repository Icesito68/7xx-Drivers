@echo off


      SET HOUR=%time:~0,2%
      SET dtStamp9=%date:~-2%%date:~4,2%%date:~7,2%-0%time:~1,1%%time:~3,2%
      SET dtStamp24=%date:~-2%%date:~4,2%%date:~7,2%-%time:~0,2%%time:~3,2%

      if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)


title [220X.%dtStamp%.prerelease] [Build preparation] [Packing Binaries]
REM rmdir /Q /S ..\..\lisa-Drivers-Release
REM mkdir ..\..\lisa-Drivers-Release

mkdir lisa-Drivers-Full
mkdir lisa-Drivers-Full\components
mkdir lisa-Drivers-Full\definitions
xcopy /cheriky ..\components\QC7325 lisa-Drivers-Full\components\QC7325
xcopy /cheriky ..\components\ANYSOC lisa-Drivers-Full\components\ANYSOC
xcopy /cheriky ..\definitions\Desktop lisa-Drivers-Full\definitions\Desktop

"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\lisa-Drivers-Release\lisa-Drivers-Full.zip lisa-Drivers-Full\*

REM move lisa-Drivers-Full\components\QC7325 ..\components\QC7325
REM move lisa-Drivers-Full\definitions\Desktop ..\definitions

rmdir /Q /S lisa-Drivers-Full