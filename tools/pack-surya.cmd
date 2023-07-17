@echo off


      SET HOUR=%time:~0,2%
      SET dtStamp9=%date:~-2%%date:~4,2%%date:~7,2%-0%time:~1,1%%time:~3,2%
      SET dtStamp24=%date:~-2%%date:~4,2%%date:~7,2%-%time:~0,2%%time:~3,2%

      if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)


title [220X.%dtStamp%.prerelease] [Build preparation] [Packing Binaries]
REM rmdir /Q /S ..\..\surya-Drivers-Release
REM mkdir ..\..\surya-Drivers-Release

mkdir surya-Drivers-Full
mkdir surya-Drivers-Full\components
mkdir surya-Drivers-Full\definitions
xcopy /cheriky ..\components\QC7150 surya-Drivers-Full\components\QC7150\surya
xcopy /cheriky ..\definitions\Desktop surya-Drivers-Full\definitions\Desktop

"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\surya-Drivers-Release\surya-Drivers-Full.zip surya-Drivers-Full\*

REM move surya-Drivers-Full\components\QC7150 ..\components\QC7150
REM move surya-Drivers-Full\definitions\Desktop ..\definitions

rmdir /Q /S surya-Drivers-Full