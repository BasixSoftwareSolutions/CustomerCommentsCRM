ECHO OFF
REM  
REM  BATCH FILE: C3_Version.BAT
REM
REM  This will copy the most current C3 application
REM  to the user local drive & desktop.
REM
REM
REM  Copy from P drive to local C drive

ECHO ON
REM *********   DO NOT CLOSE THIS WINDOW     ***********
REM *********    UPDATING YOUR PROGRAM       ***********
REM ********* THIS MAY TAKE A FEW MINUTES    ***********
REM *********     PLEASE BE PATIENT          ***********
ECHO OFF

REM  Copy App to local C drive

REM Pause the batch file for 10 seconds to allow C3 to close properly
ping -n 11 OCTANT05

IF EXIST "C:\Program Files\C3" GOTO DelC3
:DelC3
RMDIR "C:\Program Files\C3" /s /q

c:
cd "\Program Files"

IF NOT EXIST "C:\Program Files\OCTADEV" GOTO MakeOCTADev
   	CD \OCTADev
:MakeOCTADev
	MD "c:\Program Files\OCTADEV"

IF NOT EXIST "C:\Program Files\OCTADEV\C3" GOTO MakeOCTADevC3
   	CD \C3
:MakeOCTADevC3
	MD "c:\Program Files\OCTADEV\C3"

echo y|copy "\\OCTANT03\apps$\C3apps\ClientInstall\C3.accde" "C:\Program Files\OCTADEV\C3\"
echo y|copy "\\OCTANT03\apps$\C3apps\ClientInstall\C3.ico" "C:\Program Files\OCTADEV\C3\"
echo y|copy "\\OCTANT03\apps$\C3apps\ClientInstall\C3.bmp" "C:\Program Files\OCTADEV\C3\"
echo y|copy "\\OCTANT03\apps$\C3apps\ClientInstall\CustLetterTemplate.doc" "C:\Program Files\OCTADEV\C3\"

copy "\\OCTANT03\apps$\C3apps\ClientInstall\C3.LNK" "%USERPROFILE%\DESKTOP\*.*"

C:
CD "\Documents and Settings\All Users\Start Menu\Programs"
MD "OCTA Apps"

echo y|copy  "\\OCTANT03\apps$\C3apps\ClientInstall\C3.LNK" "C:\Documents and Settings\All Users\Start Menu\Programs\OCTA Apps\*.*"


REM  Start C3 back up again
c:
cd \Program Files (x86)\Microsoft Office\Office15\
MSACCESS.EXE "C:\Program Files\OCTADEV\C3\C3.accde"