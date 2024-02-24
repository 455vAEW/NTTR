@echo off
@echo Building TRM-455-x.y.z.miz ...

rem build_script:
rem - cmd: 7za a -bb0 dummy.miz C:\projects\TRM\* -xr!.git -x!*.miz -x!*.yml
rem - cmd: IF /I "%APPVEYOR_REPO_TAG%"=="true" (ren dummy.miz TRM_%APPVEYOR_REPO_TAG_NAME%.miz) ELSE (ren dummy.miz TRM_%APPVEYOR_BUILD_VERSION%.miz)

rem 7za - 7-zip program
rem -a dummy.zip - add to archive dummy.zip
rem -bb0  log level 0-3
rem C:\projects\TRM\*  -- files to add
rem -xr!.git   -- except matching !.git
rem -xr!*.miz   -- except matching !.git
rem -xr!*.yml   -- except matching !.yml
rem -xr!*.yml   -- except matching !.yml

if X%PRG_7ZIP% == X (
set PRG_7ZIP="c:\Program Files\7-Zip\7z"
echo setting PRG_Z7IP to %PRG_7ZIP%
)
else 
(
echo using PRG_7ZIP = %PRG_7ZIP%
)


set MISSION_FILE=NTTR-455-latest.miz
copy dummy.miz %MISSION_FILE%
%PRG_7ZIP% a -bb0 %MISSION_FILE% .\* -xr!.git* -x!*.miz -x!*.yml -x!.save -x!readme.md -x!build -x!*.code-workspace
