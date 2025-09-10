@echo off
echo Creating Slumpers Website Archive...
echo.

:: Create archive directory
if not exist "slumpers-website-archive" mkdir slumpers-website-archive
cd slumpers-website-archive

:: Create main project structure
mkdir app
mkdir app\admin
mkdir app\api
mkdir app\api\payments
mkdir app\api\payments\stripe
mkdir app\api\payments\mpesa
mkdir app\api\payments\mpesa\callback
mkdir app\api\tickets
mkdir app\api\tickets\generate
mkdir app\api\cleanup
mkdir app\api\cleanup\expired-tickets
mkdir app\bookings
mkdir app\events
mkdir app\events\[id]
mkdir app\events\[id]\tickets
mkdir app\shop
mkdir components
mkdir components\admin
mkdir components\ui
mkdir lib
mkdir prisma
mkdir public

echo Project structure created!
echo.
echo Archive ready at: %CD%
echo.
echo Next steps:
echo 1. Copy all files using the PowerShell script
echo 2. Upload to GitHub using the guide
echo.
pause
