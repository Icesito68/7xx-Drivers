@echo off


      SET HOUR=%time:~0,2%
      SET dtStamp9=%date:~-2%%date:~4,2%%date:~7,2%-0%time:~1,1%%time:~3,2%
      SET dtStamp24=%date:~-2%%date:~4,2%%date:~7,2%-%time:~0,2%%time:~3,2%

      if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)


title [220X.%dtStamp%.prerelease] [Build preparation] [Packing Binaries]
REM rmdir /Q /S ..\..\miatoll-Drivers-Release
REM mkdir ..\..\miatoll-Drivers-Release

mkdir miatoll-Drivers-Full
mkdir miatoll-Drivers-Full\components
mkdir miatoll-Drivers-Full\definitions
xcopy /cheriky ..\components\QC7125 miatoll-Drivers-Full\components\QC7125
xcopy /cheriky ..\components\ANYSOC miatoll-Drivers-Full\components\ANYSOC
xcopy /cheriky ..\definitions\Desktop miatoll-Drivers-Full\definitions\Desktop

"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\miatoll-Drivers-Release\miatoll-Drivers-Full.zip miatoll-Drivers-Full\*

REM move miatoll-Drivers-Full\components\QC7125 ..\components\QC7125
REM move miatoll-Drivers-Full\definitions\Desktop ..\definitions

rmdir /Q /S miatoll-Drivers-Full