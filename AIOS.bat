@echo off
title AIOS v1.2
setlocal EnableDelayedExpansion
set version=1.2

for /f "delims=" %%y in ('date /t') do (
    set fecha=%%y
)
for /f "delims=" %%h in ('time /t') do (
    set hora=%%h
)

color 74
call :logos
echo    BIENVENIDO A AIOS
echo    ver. !version!
echo.
echo    - Totalmente de codigo abierto y gratuito.
echo.
echo    !fecha! !hora!
echo.
pause
:location
color 02
call :logos
echo ================= UBICACION ACTUAL ================
echo "%CD%"
echo ===================================================
echo.
echo ===================== CARPETAS ====================
dir /ad /b 
echo ===================================================
echo.
echo ===================== ARCHIVOS ====================
dir /a-d /b 
echo ===================================================
echo.
echo ===================================================
echo.
echo    Ingrese la ubicacion
echo.
echo  Ejemplo: C:\Users\%USERNAME%\Desktop
echo.
set /p ubicacion=cd 
echo.
timeout /nobreak /t 1 >nul
echo ===================================================
cd %ubicacion%
dir
echo ===================================================
pause

:ECRM
for /f "delims=" %%y in ('date /t') do (
    set fecha_inicio=%%y
)
for /f "delims=" %%h in ('time /t') do (
    set hora_inicio=%%h
)
call :logos
color 02
dir
echo ====================================================================================
timeout /t 2 >nul
echo.
echo                                   INFORMACION                             
echo.
echo ====================================================================================
echo.
echo  Ubicacion Actual: "%CD%"
echo.
echo  Home: "%HOMEPATH%"
echo  Sistema Operativo: %OS%
echo  Numero de Procesadores: %NUMBER_OF_PROCESSORS%
echo  Nombre del usuario: %USERNAME%
echo  Nombre del Equipo: %COMPUTERNAME%
echo  Carpeta de Windows: %SystemRoot%
echo  Arquitectura del Procesador: %PROCESSOR_ARCHITECTURE%
echo.
echo  Nombre del archivo: %0
echo  Ubicacion del archivo: %~dp0
echo.
echo ====================================================================================
timeout /t 2 >nul
echo.
echo ==============================================================
echo.
echo                           INICIO
echo.
echo ==============================================================
echo / Seleccione el comando que desea ejecutar a continuacion... /
echo ==============================================================
echo /                                                            /
echo /   [man]   MANUAL DE USO                                    /
echo /                                                            /
echo /   [1]   ELIMINAR                                           /
echo /                                                            /
echo /   [2]   CREAR                                              /
echo /                                                            /
echo /   [3]   RENOMBRAR                                          /
echo /                                                            /
echo /   [4]   MOVER                                              /
echo /                                                            /
echo /   [5]   LEER                                               /
echo /                                                            /
echo /   [6]   UBICACION                                          /
echo /                                                            /
echo /   [7]   EJECUTAR                                           /
echo /                                                            /
echo /   [0]   SALIR                                              /
echo /                                                            /
echo ==============================================================
echo / !fecha_inicio! !hora_inicio! /
echo --------------------------------
timeout /nobreak /t 1 >nul
set /p eleccion=Comando a ejecutar: 

if "!eleccion!"=="" (
    color 04
    cls
    echo -----------------------------
    echo    No ingreso ningun valor
    echo -----------------------------
    pause
    goto ECRM
) else if !eleccion! EQU 1 (
    goto eliminar_AIOSv02
) else if !eleccion! EQU 2 (
    goto crear_AIOSv02
) else if !eleccion! EQU 3 (
    goto renombrar_AIOSv02
) else if !eleccion! EQU 4 (
    goto mover_AIOSv02
) else if !eleccion! EQU 0 (
    goto salir_AIOSv02
) else if !eleccion! EQU 5 (
    goto leer_AIOSv02
) else if !eleccion! EQU 6 (
    goto ubicacion_AIOSv02
) else if !eleccion! EQU 7 (
    goto ejecucion_AIOSv11
) else if /i "!eleccion!"=="man" (
    goto manual_AIOSv12
) else (
    call :error_AIOSv02
    echo --------------------------------------------------
    echo -  El numero no debe ser mayor a 7 ni menor a 0  -
    echo -  La unica palabra admitida es [man]            -
    echo --------------------------------------------------
    pause
    goto ECRM
)

pause
echo ===================================================
dir
echo ===================================================
pause

REM ///////////////////////////////////////////////// LISTA DE FUNCIONES /////////////////////////////////////////////////

REM 0. Funcion: FINALIZAR ------------------------------------------------------- FINALIZAR
:final
color 02
echo ====================================================================================
echo -                                    FINALIZAR                                     -
echo ====================================================================================
echo -                   Desea continuar o finalizar el programa                        -
echo - Es posible que haya que presionar finalizar varias veces para salir del programa -
echo -                                                                                  -
echo -  [1]  Finalizar                                                                  -
echo -                                                                                  -
echo -  [2]  Continuar                                                                  -
echo -                                                                                  -
echo ====================================================================================
set /p finalizacion=Elija una opcion: 
if !finalizacion! EQU 1 (
    exit /b
) else if !finalizacion! EQU 2 (
    goto location
) else (
    color 04
    echo ---------------------------------------
    echo   La respuesta debe estar entre 2 y 1
    echo ---------------------------------------
    pause
    goto final
)

REM 1. Funcion: ERROR ------------------------------------------------------- ERROR
:error_AIOSv02
cls
color 04
echo.
echo ----------------------------------------------
echo -             Valor no valido                -
echo ----------------------------------------------
pause
echo.
exit /b

REM 2. Funcion: ELIMINAR ------------------------------------------------------- ELIMINAR
:eliminar_AIOSv02
call :logos
echo =================================================
echo -                                               -
echo -                   ELIMINAR                    -
echo -                                               -
echo =================================================
echo -              Que desea eliminar               -
echo =================================================
echo.
echo   [1]  Eliminar Archivo
echo.
echo   [2]  Eliminar Carpeta
echo.
echo   [3]  Volver
echo.
echo =================================================
set /p deelfyf=Elija una opcion: 
    if !deelfyf! EQU 1 (
        echo =====================================================
        echo /                 LISTA DE ARCHIVOS                 /
        echo.
        dir /a-d /b
        echo.
        echo /                                                   /
        echo =====================================================
        echo -         Desea eliminar uno o mas archivos         -
        echo =====================================================
        echo.
        echo   [1]  Eliminar un Archivo
        echo.
        echo   [2]  Eliminar varios Archivos
        echo.
        echo   [3]  Volver
        echo.
        echo =====================================================
        set /p eliminarvariosarch=Elija una opcion: 
        if !eliminarvariosarch! EQU 1 (
            echo ========================================================
            echo   Inserte el nombre del archivo junto con su extension
            set /p elimf=Archivo: 
            echo.
            del !elimf!
            echo ========================================================
        ) else if !eliminarvariosarch! EQU 2 (
            echo ======================================================
            echo   Inserte el nombre de los archivos SIN su extension
            set /p elimvariosf=Nombre Archivos: 
            echo.
            echo   Total: !elimvariosf!
            echo ======================================================
            echo                  Inserte la extension
            set /p elimvariosfetiqueta=Extension: 
            echo.
            echo   Total: !elimvariosf!!elimvariosfetiqueta!
            echo ======================================================
            echo            Inserte la cantidad a eliminar
            set /p cantidadvarios=Cantidad: 
            set /a cantidadvariosnumero=cantidadvarios
            echo.
            echo   Total: -!cantidadvariosnumero! !elimvariosf!!elimvariosfetiqueta!
            echo ======================================================
            for /L %%u in (1,1,!cantidadvariosnumero!) do (
                set /a numeroelimvariosf=%%u
                del !elimvariosf!!numeroelimvariosf!!elimvariosfetiqueta!
            )
        ) else if !eliminarvariosarch! EQU 3 (
            goto eliminar_AIOSv02
        ) else (
            call :error_AIOSv02
            goto ECRM
        )
    ) else if !deelfyf! EQU 2 (
        echo =====================================================
        echo /                 LISTA DE CARPETAS                 /
        echo.
        dir /ad /b
        echo.
        echo /                                                   /
        echo =====================================================
        echo -         Desea eliminar una o mas carpetas         -
        echo =====================================================
        echo.
        echo   [1]  Eliminar una Carpeta
        echo.
        echo   [2]  Eliminar varias Carpetas
        echo.
        echo   [3]  Volver
        echo.
        echo =====================================================
        set /p eliminarvariascarp=Elija una opcion: 
        if !eliminarvariascarp! EQU 1 (
            echo ==============================================================================
            echo -       La carpeta contiene archivos? -si contiene seran eliminados-         -
            echo ==============================================================================
            echo.
            echo   - SI -
            echo.
            echo   - NO -
            echo.
            echo ==============================================================================
            set /p cont=Elija una opcion: 
            if /i "!cont!"=="si" (
                echo ======================================================
                echo            Inserte el nombre de la carpeta
                echo.
                set /p carpetaconcontenido=Nombre Carpeta: 
                rmdir /s /q !carpetaconcontenido!
                echo ======================================================
            ) else if /i "!cont!"=="no" (
                echo ======================================================
                echo            Inserte el nombre de la carpeta
                echo.
                set /p carpetasincontenido=Nombre Carpeta: 
                rmdir /q !carpetasincontenido!
                echo ======================================================
            ) else (
                call :error_AIOSv02
                goto ECRM
            )
        ) else if !eliminarvariascarp! EQU 2 (
            echo ================================================================================
            echo -       Las carpetas contienen archivos? -si contiene seran eliminados-        -
            echo ================================================================================
            echo.
            echo    - SI -
            echo.
            echo    - NO -
            echo.
            echo ================================================================================
            set /p policont=Elija una opcion: 
            if /i "!policont!"=="si" (
                set /p nombreeliminarpolicont=Nombre Carpetas: 
                set /p cantidadeliminarpolicont=Cuantas carpetas desea eliminar?: 
                echo.
                set /a cantidadeliminarpolicontnumero=cantidadeliminarpolicont
                for /L %%a in (1,1,!cantidadeliminarpolicontnumero!) do (
                    set /a numeroeliminarpolicont=%%a
                    rmdir /a /q !nombreeliminarpolicont!!numeroeliminarpolicont!
                )
                echo ================================================================================
            ) else if /i "!policont!"=="no" (
                set /p segundoeliminarpolicont=Nombre Carpetas: 
                set /p segundocantidadeliminarpolicont=Cuantas carpetas desea eliminar?: 
                set /a segundocantidadeliminarpolicontnumero=segundocantidadeliminarpolicont
                echo.
                for /L %%e in (1,1,!segundocantidadeliminarpolicontnumero!) do (
                    set /a segundonumeroeliminarpolicont=%%e
                    rmdir /q !segundoeliminarpolicont!!segundonumeroeliminarpolicont!
                )
                echo ================================================================================
            ) else (
                call :error_AIOSv02
                goto ECRM
            )
        ) else if !eliminarvariascarp! EQU 3 (
            goto eliminar_AIOSv02
        ) else (
            call :error_AIOSv02
            goto ECRM
        )
    ) else if !deelfyf! EQU 3 (
        goto ECRM
    ) else (
        call :error_AIOSv02
        goto ECRM
    )
pause
goto ECRM

REM 3. Funcion: CREAR ------------------------------------------------------- CREAR
:crear_AIOSv02
call :logos
echo =================================================
echo -                                               -
echo -                    CREAR                      -
echo -                                               -
echo =================================================
echo -              Que desea Crear                  -
echo =================================================
echo.
echo   [1] Crear Archivo
echo.
echo   [2] Crear Carpeta
echo.
echo   [3] Volver
echo.
echo =================================================
set /p maakfyf=Elija una opcion: 
    if !maakfyf! EQU 1 (
        REM ARCHIVOS PARA CREAR
        echo =================================================
        echo -      Desea crear uno o varios archivos?       -
        echo =================================================
        echo.
        echo   [1] Crear uno
        echo.
        echo   [2] Crear varios
        echo.
        echo   [3] Volver
        echo.
        echo =================================================
        set /p crearunoomasarch=Elija una opcion:  
        if !crearunoomasarch! EQU 1 (
            echo ======================================================
            echo  Inserte el nombre del archivo junto con su extension
            echo    ej: ejemplo.txt
            echo.
            set /p nombrearch=Nombre del archivo: 
            set /p lineaarch=Primera linea del archivo: 
            echo !lineaarch! > !nombrearch!
            echo ======================================================
            notepad !nombrearch!
        ) else if !crearunoomasarch! EQU 2 (
            echo ======================================================
            echo       Inserte el nombre base de los archivos
            echo    ej: archivo
            echo.
            set /p nombrearchvario=Nombre base de los archivos: 
            echo.
            echo ======================================================
            echo    Inserte la extension o etiqueta de los archivos
            echo    ej: .txt
            echo.
            set /p etiquetaarchvario=Extension o etiqueta -ej: .txt-: 
            set /p lineaarchvario=Primera linea de los archivos: 
            echo.
            echo ========================================================================================================
            echo  Ingrese la cantidad de archivos que desea crear [Se crean en orden numerico al final del nombre base]
            echo    ej: [15]
            echo.
            set /p cantidadarch=Cuantos archivos desea crear?: 
            echo.
            echo ========================================================================================================
            set /a cantidadarchnumero=cantidadarch
            for /L %%o in (1,1,!cantidadarchnumero!) do (
                echo !lineaarchvario! > !nombrearchvario!%%o!etiquetaarchvario!
            )
        ) else if !crearunoomasarch! EQU 3 (
            goto crear_AIOSv02
        ) else (
            call :error_AIOSv02
            goto ECRM
        )
    ) else if !maakfyf! EQU 2 (
        REM CARPETAS PARA CREAR
        echo =================================================
        echo -      Desea crear una o varias carpetas?       -
        echo =================================================
        echo.
        echo   [1] Crear una
        echo.
        echo   [2] Crear varias
        echo.
        echo   [3] Volver
        echo.
        echo =================================================
        set /p mkuov=Una carpeta-1- varias carpetas-2-: 
        if !mkuov! EQU 1 (
            echo ======================================================
            echo          Inserte el nombre de la carpeta
            echo.
            set /p nambrecarp=Nombre Carpeta: 
            echo.
            echo ======================================================
            mkdir !nambrecarp!
        ) else if !mkuov! EQU 2 (
            echo ======================================================
            echo          Inserte los nombres de las carpetas
            echo.
            set /p nombrevariascarp=Nombres Carpetas: 
            echo.
            set /p cantidadvariascarp=Cuantas carpetas desea crear?: 
            set /a cantidadvariascarpnumero=cantidadvariascarp
            echo.
            echo ======================================================
            for /L %%i in (1,1,!cantidadvariascarpnumero!) do (
                set /a numerovariascarpbucle=%%i
                mkdir !nombrevariascarp!!numerovariascarpbucle!
            )
        ) else if !mkuov! EQU 3 (
            goto crear_AIOSv02
        ) else (
            call :error_AIOSv02
            goto ECRM
        )
    ) else if !maakfyf! EQU 3 (
        goto ECRM
    ) else (
        call :error_AIOSv02
        goto ECRM
    )
pause
goto ECRM

REM 4. Funcion: RENOMBRAR ------------------------------------------------------- RENOMBRAR
:renombrar_AIOSv02
call :logos
echo ==========================================================================================
echo /                              LISTA DE ARCHIVOS Y CARPETAS                              /
echo.
dir /b
echo.
echo /                                                                                        /
echo ==========================================================================================
echo /                                                                                        /
echo /                                      RENOMBRAR                                         /
echo /                                                                                        /
echo ==========================================================================================
echo     Ingrese el nombre del archivo o carpeta que desea renombrar junto con su extension
echo     [Escriba [AIOSrename] para volver al menu principal]
echo.
set /p mainname=Archivo o Carpeta a renombrar: 
if /i "!mainname!"=="AIOSrename" (
    goto ECRM
) else (
    set /p newname=Nuevo nombre: 
    rename !mainname! !newname!
)
echo ==========================================================================================
pause
goto ECRM

REM 5. Funcion: MOVER ------------------------------------------------------- MOVER
:mover_AIOSv02
call :logos
echo ==========================================================================================
echo /                              LISTA DE ARCHIVOS Y CARPETAS                              /
echo.
dir /b
echo.
echo ==========================================================================================
echo /                                                                                        /
echo /                                      MOVER                                             /
echo /                                                                                        /
echo ==========================================================================================
echo    Ingrese el nombre del archivo o carpeta que desea mover junto con su extension
echo    Ingrese la direccion a donde desea mover el archivo o carpeta
echo    [Escriba [AIOSmove] para volver al menu principal]
set /p movename=Nombre: 
if /i "!movename!"=="AIOSmove" (
    goto ECRM
) else (
    set /p spotmove=Direccion nueva: 
    if /i "!spotmove!"=="AIOSmove" (
        goto ECRM
    ) else (
    move !movename! !spotmove!
    :direction
    color 02
    echo ==========================================================================================
    echo /              Desea ir a la primera direccion o a la nueva direccion?                   /
    echo ==========================================================================================
    echo.
    echo   [pd] Primera Direccion
    echo.
    echo   [nd] Nueva Direccion
    echo.
    echo ==========================================================================================
    set /p changefolder=PrimeraDireccion-pd- NuevaDireccion-nd-: 
    if /i "!changefolder!"=="pd" (
        echo ==========================================================================================
        echo Usted ya esta en su carpeta principal
        echo ==========================================================================================
    ) else if /i "!changefolder!"=="nd" (
        cd !spotmove!
    ) else (
        call :error_AIOSv02
        goto direction
    )
    )
)
pause
goto ECRM

REM 6. Funcion: SALIR ------------------------------------------------------- SALIR
:salir_AIOSv02
call :logos
echo ==========================================================
echo -              ESTA SEGURO QUE DESEA SALIR?              -
echo ==========================================================
echo -                                                        -
echo -  [Si]  Finalizar el programa                           -
echo -                                                        -
echo -  [No]  Volver al menu principal                        -
echo -                                                        -
echo ==========================================================
set /p salida=Si o No: 
if /i "!salida!"=="si" (
    exit /b
) else if /i "!salida!"=="no" (
    goto ECRM
) else (
    goto ECRM
)

REM 7. Funcion: LEER ------------------------------------------------------- LEER
:leer_AIOSv02
call :logos
echo ==========================================================
echo /                    LISTA DE ARCHIVOS                   /
echo ==========================================================
for /f "delims=" %%z in ('dir /b /a-d') do (
    echo.
    echo Archivo: %%z
    echo.
)
echo =========================================================================
echo /  Ingrese el nombre del archivo que desea leer junto con su extension  /
echo /  Ingrese [AIOSread] para volver al menu principal                     /
echo =========================================================================
set /p seearch=Nombre del archivo: 
if /i "!seearch!"=="AIOSread" (
    goto ECRM
)
echo ===================================================================
for /f "delims=" %%l in (!seearch!) do (
    echo.
    echo  %%l
)
echo ===================================================================
pause
goto ECRM

REM 8. Funcion: UBICACION ------------------------------------------------------- UBICACION
:ubicacion_AIOSv02
call :logos
echo ========================================================================
echo /  Ubicacion Actual: "%CD%"                                            
echo ========================================================================
echo /                     DESEA CAMBIAR DE UBICACION?                      /
echo ========================================================================
echo.
echo    [Si]  Cambiar de Ubicacion
echo.
echo    [NO]  Mantener la Ubicacion
echo.
echo ========================================================================
    set /p nubi=Elija una opcion: 
    if /i "!nubi!"=="si" (
        goto location
    ) else if /i "!nubi!"=="no" (
        goto ECRM
    ) else (
        call :error_AIOSv02
        goto ECRM
    )
pause
goto ECRM

REM 9. FUNCION: EJECUCION --------------------------------------------------------EJECUCION / TODAVIA EN DESAROLLO. FUNCION NO CULMINADA NI LISTA
:ejecucion_AIOSv11
color 02
call :logos
echo ==========================================================================================
echo /                                   LISTA DE ARCHIVOS                                    /
echo.
dir /a-d /b
echo.
echo ==========================================================================================
echo /                                                                                        /
echo /                                       EJECUTAR                                         /
echo /                                                                                        /
echo ==========================================================================================
echo    Que desea ejecutar: un programa.exe o un archivo.bat?
echo.
echo    [exe] Ejecutar un .exe
echo.
echo    [bat] Ejecutar un .bat
echo.
echo    [men] Volver al menu
echo.
echo ==========================================================================================
set /p execucion=Elija una opcion: 
if /i "!execucion!"=="exe" (
    echo ================================================================
    echo.
    echo                  EJECUTAR UN PROGRAMA .exe ...
    echo.
    echo  escribir [AIOSexec] para cancelar
    echo ================================================================
    set /p ejecutable=Inserte el nombre del programa que desea ejecutar: 
    if /i "!ejecutable!"=="AIOSexec" (
        echo Accion cancelada. volviendo...
        timeout /nobreak /t 3 >nul
        goto ejecucion_AIOSv11
    )
    start !ejecutable!.exe 2>nul
    pause
    echo Accion completada. volviendo a la seccion de ejecucion...
    timeout /nobreak /t 3 >nul
    goto ejecucion_AIOSv11
) else if /i "!execucion!"=="bat" (
    echo ================================================================
    echo.
    echo                  EJECUTAR UN ARCHIVO .bat ...
    echo.
    echo  escribir [AIOSexec] para cancelar
    echo ================================================================
    set /p ejecutado=Inserte el nombre del archivo que desea ejecutar: 
    if /i "!ejecutado!"=="AIOSexec" (
        echo Accion cancelada. volviendo...
        timeout /nobreak /t 3 >nul
        goto ejecucion_AIOSv11
    )
    set ubiexe=%CD%
    for /f "delims=" %%i in ('"!ubiexe!\!ejecutado!.bat"') do (
    echo %%i 
    )
    pause
    echo Accion completada. volviendo a la seccion de ejecucion...
    timeout /nobreak /t 3 >nul
    goto ejecucion_AIOSv11
) else if /i "!execucion!"=="men" (
    goto ECRM
) else (
    call :error_AIOSv02
    goto ejecucion_AIOSv11
)
pause
goto ECRM

REM 10. FUNCION: AIOS ----------------------------------------------------------------AIOS
:logos
cls
echo.
echo  ============================================================================================================
echo  =                                                                                                          =
echo  =            AA            IIIIIIIIIIIIIIIIII         OOOOOOOO           SSSSSSSSSSSSSSSSSS                =
echo  =           AAAA           IIIIIIIIIIIIIIIIII      OOOOOOOOOOOOOO      SSSSSSSSSSSSSSSSSSSS                =
echo  =          AAAAAA                 IIII            OOOOO      OOOOO     SSS                                 =
echo  =         AAA  AAA                IIII           OOOOO        OOOOO     SSSS                               =
echo  =        AAA    AAA               IIII          OOOOO          OOOOO      SSSSSSSSSSSSSS                   =
echo  =       AAA      AAA              IIII          OOOOO          OOOOO       SSSSSSSSSSSSSSS                 =
echo  =      AAAAAAAAAAAAAA             IIII           OOOOO        OOOOO                    SSSS                =
echo  =     AAAAAAAAAAAAAAAA            IIII            OOOOO      OOOOO                      SSS                =
echo  =    AAA            AAA    IIIIIIIIIIIIIIIIII      OOOOOOOOOOOOOO      SSSSSSSSSSSSSSSSSSSS                =
echo  =   AAA              AAA   IIIIIIIIIIIIIIIIII         OOOOOOOO         SSSSSSSSSSSSSSSSSS       VER. !version!   =
echo  =                                                                                                          =
echo  ============================================================================================================
echo.
exit /b

REM 11. FUNCION: MAN ----------------------------------------------------------------------------- MANUAL / TODAVIA EN DESAROLLO. FUNCION NO CULMINADA NI LISTA
:manual_AIOSv12
color 02
set mandir="%~dp0"manual\
call :logos
echo  ============================================================================================================
echo  ==                                                                                                        ==
echo  ==                                      MANUAL DE USO DE AIOS                                             ==
echo  ==                                                                                                        ==
echo  ============================================================================================================
echo  /   [i]  Introduccion y conceptos basicos                                                                  /
echo  /   [p]  Primeros pasos                                                                                    /
echo  /   [1]  Eliminar                                                                                          /
echo  /   [2]  Crear                                                                                             /
echo  /   [3]  Renombrar                                                                                         /
echo  /   [4]  Mover                                                                                             /
echo  /   [5]  Leer                                                                                              /
echo  /   [6]  Ubicacion                                                                                         /
echo  /   [7]  Ejecutar                                                                                          /
echo  /   [0]  Salir                                                                                             /
echo  /   [k]  Palabras clave para volver                                                                        /
echo  /   [c]  Consejos y advertencias                                                                           /
echo  /   [n]  Novedades de la version                                                                           /
echo  /   [v]  Volver al menu principal                                                                          /
echo  ============================================================================================================
set /p manual=Elija su opcion: 
if /i "!manual!"=="i" (
    for /f "delims=" %%i in ('"!mandir!introduccion.bat"') do (
    echo %%i
    )
    pause
    goto manual_AIOSv12
) else if /i "!manual!"=="p" (
    for /f "delims=" %%i in ('"!mandir!primerospasos.bat"') do (
    echo %%i
    )
    pause
    goto manual_AIOSv12
) else if !manual! EQU 1 (
    for /f "delims=" %%i in ('"!mandir!eliminar.bat"') do (
    echo %%i
    )
    pause
    goto manual_AIOSv12
) else if !manual! EQU 2 (
    for /f "delims=" %%i in ('"!mandir!crear.bat"') do (
    echo %%i
    )
    pause
    goto manual_AIOSv12
) else if !manual! EQU 3 (
    for /f "delims=" %%i in ('"!mandir!renombrar.bat"') do (
    echo %%i
    )
    pause
    goto manual_AIOSv12
) else if !manual! EQU 4 (
    for /f "delims=" %%i in ('"!mandir!mover.bat"') do (
    echo %%i
    )
    pause
    goto manual_AIOSv12
) else if !manual! EQU 5 (
    for /f "delims=" %%i in ('"!mandir!leer.bat"') do (
    echo %%i
    )
    pause
    goto manual_AIOSv12
) else if !manual! EQU 6 (
    for /f "delims=" %%i in ('"!mandir!ubicacion.bat"') do (
    echo %%i
    )
    pause
    goto manual_AIOSv12
) else if !manual! EQU 7 (
    for /f "delims=" %%i in ('"!mandir!ejecutar.bat"') do (
    echo %%i
    )
    pause
    goto manual_AIOSv12
) else if !manual! EQU 0 (
    for /f "delims=" %%i in ('"!mandir!salir.bat"') do (
    echo %%i
    )
    pause
    goto manual_AIOSv12
) else if /i "!manual!"=="k" (
    for /f "delims=" %%i in ('"!mandir!palabrasclave.bat"') do (
    echo %%i
    )
    pause
    goto manual_AIOSv12
) else if /i "!manual!"=="c" (
    for /f "delims=" %%i in ('"!mandir!consejos.bat"') do (
    echo %%i
    )
    pause
    goto manual_AIOSv12
) else if /i "!manual!"=="n" (
    for /f "delims=" %%i in ('"!mandir!nuevasversiones.bat"') do (
    echo %%i
    )
    pause
    goto manual_AIOSv12
) else if /i "!manual!"=="v" (
    goto ECRM
) else (
    call :error_AIOSv02
    goto manual_AIOSv12
)
goto ECRM
