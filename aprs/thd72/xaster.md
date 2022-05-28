1. Configure THD72
Menu -> GPS -> Int. GPS (setting 202) -> PC Output -> On

Turn on GPS
Press F + GPS

:note: Display should read iGPS in top right

Menu -> APRS -> PC Port (setting 350) -> Output -> On

Turn on TNC
Press TNC button until display reads PACKET12

Press A/B until band A is selected
Set frequency to 144.390

2. Connect THD72 to PC
Should see 'cp210x converter now attached to ttyUSB0' in dmesg

3. Configure Xastir
Start Xastir

Interface -> Interface Control -> Add -> Choose Interface Type

Select "Serial TNC w/GPS on AUX port"
Click Add button

Set the following:

TNC Port
/dev/ttyUSB0

Port Settings
9600 bps

IGate Options
Allow RF->Inet and Inet->RF traffic

TNC Setup Filename
tnc-startup.d72_d710

TNC Shutdown Filename
tnc-stop.d72_d710

Select Device and click 'Start'

View -> Incoming Data
