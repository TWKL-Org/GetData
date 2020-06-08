@echo off
title GetData && color 0a && cls
set LA=%cd:~0,1%
set L=%cd:~0,2%

rem Change the location of the results at will
set DumpPath=%L%\Users\%username%\Dumpster

if not exist %DumpPath% md %DumpPath%
:start
cls
echo MMMMMMMMMMMMMMMMMMMMMMNdhyssoossyhdNMMMMMMMMMMMMMMMMMMMMMM
echo MMMMMMMMMMMMMMMMMds/-`              `-/sdMMMMMMMMMMMMMMMMM
echo MMMMMMMMMMMMMms:                          :smMMMMMMMMMMMMM
echo MMMMMMMMMMNs-                                -yMMMMMMMMMMM
echo MMMMMMMMNo`                                    `oNMMMMMMMM
echo MMMMMMMs`   `:-       `....-..-...``       -:`   `sMMMMMMM            v 1.0.0
echo MMMMMm- `.:dm:    `..`..` .````. `..`..`    :Nd:.` -mMMMMM
echo MMMMh` syoMy:   ....`-`  .` `` `.  `.`....   :yM+yo `dMMMM
echo MMMh -sM-ssh. ..   `.```.-.o/oy/-.```.`   .. .hss-Mo-`dMMM
echo MMm`y+dhhmo` .`   `.    .` o:/Mo`.    .    `. `omyddos`mMM     ========================
echo MM--Mohhos` -.``  -     -   .o`  -    `.  ``.- `sohysM.:MM     -Do you wish to begin?
echo Mh :My/dN- -   ``..`````-```oo```-`````-.``  `. :Nh/hM- dM     -        [Y/N]
echo M/:-mhNh: `.     .`    `.   //   .     `.     .` :hNhd-:/M     ========================
echo M.sy-N++s .`     -     `.`.+yy/.`.`     -     `. s++N-yo.M
echo M`/Mo:yM- -``````-```.:+hN``dh``Nh+:.```-`````.- -Ms:oM/.M
echo M.`dM+Ms. .`     -smNMMMMy `o+` yMMMMNmo-     `. .yM+Md`-M     +----------------------+
echo M/o:ymN`m``.     .NMMMMMMh  Nm  dMMMMMMN.     .``m`Mms:++M      - (S) Settings
echo Mh-Ns/h:M/ -   ``/MMMMMMMM+ MN oMMMMMMMM:``  `. /M:h/sN.dM      - (I) Instal saves   [Broken]
echo MM--mNo+Mo+.-.`` oMMMMMMMMMsMMsMMMMMMMMMo ``.-./oM/sMm-:MM      - (U) Uninstal saves [Broken]
echo MMm`:omdmy/m..`  dMMMMMMMMMMMMMMMMMMMMMMh  `.-N:hmdm+:`mMM      - (T) Tuto    [in Dev]
echo MMMh.ho:od-Nm`..`MMMMMMMMMMMMMMMMMMMMMMMN`..`mN-d+:oh.dMMM      - (C) Changelogs
echo MMMMd`+mmyo+Nyoo:MMMMMMMMMMMMMMMMMMMMMMMM:o+hN+oymm+.dMMMM      - (H) Help    [in Dev]
echo MMMMMm- /sdmmNssMMMMMMMMMMMMMMMMMMMMMMMMMMosNmmds/ :NMMMMM      - (E) Exit
echo MMMMMMMs`/ssooyoodNMMMMMMMMMMMMMMMMMMMMNdooyooss/.yMMMMMMM     +----------------------+
echo MMMMMMMMNo`.+syhhyo+omMMMMMMMMMMMMMMmo+oyhhys+.`sNMMMMMMMM
echo MMMMMMMMMMMy--+shhmMNMMMMMMMMMMMMMMMMMMmhhs+-:yMMMMMMMMMMM
echo MMMMMMMMMMMMMms:`..` MMMMMMMMMMMMMMMN `..`:sNMMMMMMMMMMMMM
echo MMMMMMMMMMMMMMMMMds/:MMMMMMMMMMMMMMMM:/sdMMMMMMMMMMMMMMMMM
echo MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
set /p YN= Do you wish to launch the program? 
goto %YN%
goto start
::--------------------------------------------------------------------------------------------
:N
exit

:Y
:launchScan
cls
:=============================================================================================
title Choose repertory scanning mode
cls
echo.
echo  - Tree:
echo  ===========================================================
echo  - (1) No drive scan
echo  - (2) C: D:
echo  - (3) C: D: + file names
echo  - (4) Everything but files
echo  - (5) I need every bit of information possible
echo  ===========================================================
echo.
set /p TreeMode=  What Mode do you wish to work with? 
cls
:=============================================================================================
title  Choose advanced information mode
cls
echo.
echo  - Wmic:
echo  ===========================================================
echo  - (1) Skip that
echo  - (2) Brief basics (The usual)
echo  - (3) Detailed basics (The usual)
echo  - (4) Everything brief
echo  - (5) Everything detailed
echo  ===========================================================
echo.
set /p WmicMode=  What Mode do you wish to work with? 
cls
:=============================================================================================
:BASICS
cls

set CuFo=systeminfo
echo %CuFo%...
systeminfo >%DumpPath%\%CuFo%.txt
cls

set CuFo=ipconfig
echo %CuFo%...
ipconfig >%DumpPath%\%CuFo%.txt
cls

set CuFo=ipconfigAll
echo %CuFo%...
ipconfig /all >%DumpPath%\%CuFo%.txt
cls

set CuFo=hostname
echo %CuFo%...
hostname >%DumpPath%\%CuFo%.txt
cls

set CuFo=netAccounts
echo %CuFo%...
net accounts >%DumpPath%\%CuFo%.txt
cls

::set CuFo=
::echo %CuFo%...
:: >%DumpPath%\%CuFo%.txt
::cls

::set CuFo=
::echo %CuFo%...
:: >%DumpPath%\%CuFo%.txt
::cls

:SkipBasics
cls
:======================================================================================
::-------------------------------------------------------------------------------------
:TREE
set CuFo=Tree
title %CuFo%
cls
if not exist %DumpPath%\%CuFo% md %DumpPath%\%CuFo%
::-------------------------------------------------------------------------------------
if %TreeMode% == 1 (
    goto SkipTrees
) else if %TreeMode% == 2 (
    for %%p in (C D E F) do (
        if exist %%p:\ (
            if %%p NEQ %LA% (
            echo Tree: %%p...
            %%p:
            tree /a > %DumpPath%\%CuFo%\%%p.txt
            cls
            )
        )
	)
    goto SkipTrees
) else if %TreeMode% == 3 (
    for %%p in (C D E F) do (
        if exist %%p:\ (
            if %%p NEQ %LA% (
            echo Tree: %%p...
            %%p:
            tree /f /a > %DumpPath%\%CuFo%\%%p.txt
            cls
            )
        )
	)
    goto SkipTrees
) else if %TreeMode% == 4 (
    for %%p in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
        if exist %%p:\ (
            if %%p NEQ %LA% (
            echo Tree: %%p...
            %%p:
            tree /a > %DumpPath%\%CuFo%\%%p.txt
            cls
            )
        )
	)
    goto SkipTrees
) else if %TreeMode% == 5 (
    for %%p in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
        if exist %%p:\ (
            if %%p NEQ %LA% (
            echo Tree: %%p...
            %%p:
            tree /f /a > %DumpPath%\%CuFo%\%%p.txt
            cls
            )
        )
	)
    goto SkipTrees
)

:SkipTrees
cls
:======================================================================================
::-------------------------------------------------------------------------------------
:WMIC
set CuFo=WMIC
title %CuFo%
cls
if not exist %DumpPath%\%CuFo% md %DumpPath%\%CuFo%
::-------------------------------------------------------------------------------------

if %WmicMode% == 1 (
    goto SkipWmics
) else if %WmicMode% == 2 (
    for %%g in (
        ::ALIAS
    BASEBOARD
    BIOS
    BOOTCONFIG
    ::CDROM
    COMPUTERSYSTEM
    CPU
    CSPRODUCT
        ::DATAFILE
    ::DCOMAPP
    DESKTOP
    DESKTOPMONITOR
    ::DEVICEMEMORYADDRESS
    DISKDRIVE
    ::DISKQUOTA
    ::DMACHANNEL
    ::ENVIRONMENT
        ::FSDIR
    GROUP
    ::IDECONTROLLER
    ::IRQ
    ::JOB
    ::LOADORDER
    LOGICALDISK
    ::LOGON
    MEMCACHE
    MEMORYCHIP
    MEMPHYSICAL
    NETCLIENT
    NETLOGIN
    NETPROTOCOL
    NETUSE
    NIC
    NICCONFIG
    ::NTDOMAIN
        ::NTEVENT
    ::NTEVENTLOG
    ONBOARDDEVICE
    OS
    ::PAGEFILE
    ::PAGEFILESET
    PARTITION
    PORT
    PORTCONNECTOR
    PRINTER
    PRINTERCONFIG
    PRINTJOB
    PROCESS
    ::PRODUCT
    ::QFE
    ::QUOTASETTING
    ::RDACCOUNT
    ::RDNIC
    ::RDPERMISSIONS
    ::RDTOGGLE
    ::RECOVEROS
    ::REGISTRY
    SCSICONTROLLER
    ::SERVER
    SERVICE
    ::SHADOWCOPY
    ::SHADOWSTORAGE
    SHARE
        ::SOFTWAREELEMENT
    ::SOFTWAREFEATURE
    SOUNDDEV
    STARTUP
    ::SYSACCOUNT
    SYSDRIVER
    ::SYSTEMENCLOSURE
    SYSTEMSLOT
    ::TAPEDRIVE
    TEMPERATURE
    TIMEZONE
    ::UPS
    USERACCOUNT
    VOLTAGE
    VOLUME
    ::VOLUMEQUOTASETTING
    ::VOLUMEUSERQUOTA
        ::WMISET
    ) do (
    echo %%g...
    wmic %%g list brief > %DumpPath%\%CuFo%\%%g.txt
    cls
    )
goto SkipWmics
cls
)

::-------------------------------------------------------------------------------------

if %WmicMode% == 3 (
    for %%g in (
        ::ALIAS
    BASEBOARD
    BIOS
    BOOTCONFIG
    ::CDROM
    COMPUTERSYSTEM
    CPU
    CSPRODUCT
        ::DATAFILE
    ::DCOMAPP
    DESKTOP
    DESKTOPMONITOR
    ::DEVICEMEMORYADDRESS
    DISKDRIVE
    ::DISKQUOTA
    ::DMACHANNEL
    ::ENVIRONMENT
        ::FSDIR
    GROUP
    ::IDECONTROLLER
    ::IRQ
    ::JOB
    ::LOADORDER
    LOGICALDISK
    ::LOGON
    MEMCACHE
    MEMORYCHIP
    MEMPHYSICAL
    NETCLIENT
    NETLOGIN
    NETPROTOCOL
    NETUSE
    NIC
    NICCONFIG
    ::NTDOMAIN
        ::NTEVENT
    ::NTEVENTLOG
    ONBOARDDEVICE
    OS
    ::PAGEFILE
    ::PAGEFILESET
    PARTITION
    PORT
    PORTCONNECTOR
    PRINTER
    PRINTERCONFIG
    PRINTJOB
    PROCESS
    ::PRODUCT
    ::QFE
    ::QUOTASETTING
    ::RDACCOUNT
    ::RDNIC
    ::RDPERMISSIONS
    ::RDTOGGLE
    ::RECOVEROS
    ::REGISTRY
    SCSICONTROLLER
    ::SERVER
    SERVICE
    ::SHADOWCOPY
    ::SHADOWSTORAGE
    SHARE
        ::SOFTWAREELEMENT
    ::SOFTWAREFEATURE
    SOUNDDEV
    STARTUP
    ::SYSACCOUNT
    SYSDRIVER
    ::SYSTEMENCLOSURE
    SYSTEMSLOT
    ::TAPEDRIVE
    TEMPERATURE
    TIMEZONE
    ::UPS
    USERACCOUNT
    VOLTAGE
    VOLUME
    ::VOLUMEQUOTASETTING
    ::VOLUMEUSERQUOTA
        ::WMISET
    ) do (
    echo %%g...
    wmic %%g list > %DumpPath%\%CuFo%\%%g.txt
    cls
    )
goto SkipWmics
cls
)

::-------------------------------------------------------------------------------------

if %WmicMode% == 4 (
    for %%g in (
        ::ALIAS
    BASEBOARD
    BIOS
    BOOTCONFIG
    CDROM
    COMPUTERSYSTEM
    CPU
    CSPRODUCT
        ::DATAFILE
    DCOMAPP
    DCOMAPP
    DESKTOP
    DESKTOPMONITOR
    DEVICEMEMORYADDRESS
    DISKDRIVE
    DISKQUOTA
    DMACHANNEL
    ENVIRONMENT
        ::FSDIR
    GROUP
    IDECONTROLLER
    IRQ
    JOB
    LOADORDER
    LOGICALDISK
    LOGON
    MEMCACHE
    MEMORYCHIP
    MEMPHYSICAL
    NETCLIENT
    NETLOGIN
    NETPROTOCOL
    NETUSE
    NIC
    NICCONFIG
    NTDOMAIN
        ::NTEVENT
    NTEVENTLOG
    ONBOARDDEVICE
    OS
    PAGEFILE
    PAGEFILESET
    PARTITION
    PORT
    PORTCONNECTOR
    PRINTER
    PRINTERCONFIG
    PRINTJOB
    PROCESS
    PRODUCT
    QFE
    QUOTASETTING
    RDACCOUNT
    RDNIC
    RDPERMISSIONS
    RDTOGGLE
    RECOVEROS
    REGISTRY
    SCSICONTROLLER
    SERVER
    SERVICE
    SHADOWCOPY
    SHADOWSTORAGE
    SHARE
        ::SOFTWAREELEMENT
    SOFTWAREFEATURE
    SOUNDDEV
    STARTUP
    SYSACCOUNT
    SYSDRIVER
    SYSTEMENCLOSURE
    SYSTEMSLOT
    TAPEDRIVE
    TEMPERATURE
    TIMEZONE
    UPS
    USERACCOUNT
    VOLTAGE
    VOLUME
    VOLUMEQUOTASETTING
    VOLUMEUSERQUOTA
        ::WMISET
    ) do (
    echo %%g...
    wmic %%g list brief > %DumpPath%\%CuFo%\%%g.txt
    cls
    )
goto SkipWmics
cls
)

::-------------------------------------------------------------------------------------

if %WmicMode% == 5 (
    for %%g in (
        ::ALIAS
    BASEBOARD
    BIOS
    BOOTCONFIG
    CDROM
    COMPUTERSYSTEM
    CPU
    CSPRODUCT
        ::DATAFILE
    DCOMAPP
    DESKTOP
    DESKTOPMONITOR
    DEVICEMEMORYADDRESS
    DISKDRIVE
    DISKQUOTA
    DMACHANNEL
    ENVIRONMENT
        ::FSDIR
    GROUP
    IDECONTROLLER
    IRQ
    JOB
    LOADORDER
    LOGICALDISK
    LOGON
    MEMCACHE
    MEMORYCHIP
    MEMPHYSICAL
    NETCLIENT
    NETLOGIN
    NETPROTOCOL
    NETUSE
    NIC
    NICCONFIG
    NTDOMAIN
        ::NTEVENT
    NTEVENTLOG
    ONBOARDDEVICE
    OS
    PAGEFILE
    PAGEFILESET
    PARTITION
    PORT
    PORTCONNECTOR
    PRINTER
    PRINTERCONFIG
    PRINTJOB
    PROCESS
    PRODUCT
    QFE
    QUOTASETTING
    RDACCOUNT
    RDNIC
    RDPERMISSIONS
    RDTOGGLE
    RECOVEROS
    REGISTRY
    SCSICONTROLLER
    SERVER
    SERVICE
    SHADOWCOPY
    SHADOWSTORAGE
    SHARE
        ::SOFTWAREELEMENT
    SOFTWAREFEATURE
    SOUNDDEV
    STARTUP
    SYSACCOUNT
    SYSDRIVER
    SYSTEMENCLOSURE
    SYSTEMSLOT
    TAPEDRIVE
    TEMPERATURE
    TIMEZONE
    UPS
    USERACCOUNT
    VOLTAGE
    VOLUME
    VOLUMEQUOTASETTING
    VOLUMEUSERQUOTA
        ::WMISET
    ) do (
    echo %%g...
    wmic %%g list > %DumpPath%\%CuFo%\%%g.txt
    cls
    )
goto SkipWmics
cls
)

:SkipWmics
cls
:======================================================================================

exit