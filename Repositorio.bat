cd c:
cd C:\Users\lidia\Documents\Archicad

for /f "usebackq skip=1 tokens=1-3" %%g in (`wmic Path Win32_LocalTime Get Day^,Month^,Year ^| findstr /r /v "^$"`) do (
  set day=00%%g
  set month=00%%h
  set year=%%i
  )
rem pad day and month with leading zeros
set month=%_month:~-2%
set day=%_day:~-2%
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)

git add .

git commit -m "Update %day%_%month%_%year%_%mytime%"

git push origin master