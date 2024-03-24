if exist %~dp0..\qt-everywhere-src-5.15.13\configure.bat goto done

REM Downloading Qt 5.15.13 source code...
curl -LsSO --output-dir %~dp0..\ https://download.qt.io/archive/qt/5.15/5.15.13/single/qt-everywhere-opensource-src-5.15.13.zip
"C:\Program Files\7-Zip\7z.exe" x -aoa -o%~dp0..\ %~dp0..\qt-everywhere-opensource-src-5.15.13.zip

REM Downloading Qt 5.15.13 security patches...
curl -LsSO --output-dir %~dp0..\qt-everywhere-src-5.15.13\qtsvg\ https://download.qt.io/archive/qt/5.15/CVE-2023-32573-qtsvg-5.15.diff
curl -LsSO --output-dir %~dp0..\qt-everywhere-src-5.15.13\qtbase\ https://download.qt.io/archive/qt/5.15/CVE-2023-32762-qtbase-5.15.diff
curl -LsSO --output-dir %~dp0..\qt-everywhere-src-5.15.13\qtbase\ https://download.qt.io/archive/qt/5.15/CVE-2023-32763-qtbase-5.15.diff
curl -LsSO --output-dir %~dp0..\qt-everywhere-src-5.15.13\qtbase\ https://download.qt.io/archive/qt/5.15/CVE-2023-33285-qtbase-5.15.diff
curl -LsSO --output-dir %~dp0..\qt-everywhere-src-5.15.13\qtbase\ https://download.qt.io/archive/qt/5.15/CVE-2023-34410-qtbase-5.15.diff
curl -LsSO --output-dir %~dp0..\qt-everywhere-src-5.15.13\qtbase\ https://download.qt.io/archive/qt/5.15/CVE-2023-37369-qtbase-5.15.diff
curl -LsSO --output-dir %~dp0..\qt-everywhere-src-5.15.13\qtbase\ https://download.qt.io/archive/qt/5.15/CVE-2023-38197-qtbase-5.15.diff
curl -LsSO --output-dir %~dp0..\qt-everywhere-src-5.15.13\qtbase\ https://download.qt.io/archive/qt/5.15/CVE-2023-43114-5.15.patch
curl -LsSO --output-dir %~dp0..\qt-everywhere-src-5.15.13\qtbase\ https://download.qt.io/archive/qt/5.15/0001-CVE-2023-51714-qtbase-5.15.diff
curl -LsSO --output-dir %~dp0..\qt-everywhere-src-5.15.13\qtbase\ https://download.qt.io/archive/qt/5.15/0002-CVE-2023-51714-qtbase-5.15.diff
curl -LsSO --output-dir %~dp0..\qt-everywhere-src-5.15.13\qtbase\ https://download.qt.io/archive/qt/5.15/CVE-2024-25580-qtbase-5.15.diff

REM Install GNU Patch tool...
choco install patch -y

REM Patch Qt sources...
pushd %~dp0..\qt-everywhere-src-5.15.13\qtbase\
patch -p1 -i CVE-2023-32762-qtbase-5.15.diff
patch -p1 -i CVE-2023-32763-qtbase-5.15.diff
patch -p1 -i CVE-2023-33285-qtbase-5.15.diff
patch -p1 -i CVE-2023-34410-qtbase-5.15.diff
patch -p1 -i CVE-2023-37369-qtbase-5.15.diff
patch -p1 -i CVE-2023-38197-qtbase-5.15.diff
patch -p1 -i CVE-2023-43114-5.15.patch
patch -p1 -i 0001-CVE-2023-51714-qtbase-5.15.diff
patch -p1 -i 0002-CVE-2023-51714-qtbase-5.15.diff
patch -p1 -i CVE-2024-25580-qtbase-5.15.diff
popd
pushd %~dp0..\qt-everywhere-src-5.15.13\qtsvg\
patch -p1 -i CVE-2023-32573-qtsvg-5.15.diff
popd

:done

REM dir %~dp0..\
REM dir %~dp0..\qt-everywhere-src-5.15.13\