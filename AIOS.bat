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
echo  SuperUsuario: %SystemRoot%
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
echo    Ingrese el nombre del archivo que desea ejecutar junto con su extension
echo    - Ejecuta solo comandos de texto -
echo    [Escriba [AIOSexec] para volver al menu principal]
set /p aioseje=Nombre: 
if /i "!aioseje!"=="AIOSexec" (
    goto ECRM
)
for /f "delims=" %%a in ('!aioseje!') do (
    echo %%a
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
    echo  -----
    echo.
    echo  [i] Introduccion y conceptos basicos
    echo.
    echo.
    echo    Que es: AIOS es una herramienta de consola para gestionar archivos y carpetas desde menus, sin escribir comandos. Es gratuita, de codigo abierto y funciona en Windows.
    echo.
    echo    Carpeta actual: es la carpeta donde AIOS trabaja. Todo lo que crees, borres, renombres o leas ocurre ahi. Es el concepto más importante del programa.
    echo.
    echo    Ruta y extension: la ruta es la direccion de una carpeta ej.[C:\Users\TuUsuario\Desktop]. La extension es lo que va despues del punto en un archivo [.txt, .bat].
    echo.
    echo    Colores: verde significa funcionamiento normal. Rojo significa que ingresaste un valor no valido; pulsas una tecla y vuelves al menu.
    echo.
    echo -----
    pause
    goto manual_AIOSv12
) else if /i "!manual!"=="p" (
    echo  -----
    echo.
    echo  [p] Primeros pasos
    echo.
    echo.
    echo    Bienvenida: al abrir AIOS aparecen la version, la fecha y la hora. Pulsa cualquier tecla para continuar.
    echo.
    echo    Elegir ubicacion: AIOS muestra la carpeta actual con sus carpetas y archivos. Escribe una ruta completa o el nombre de una subcarpeta. Con .. subes un nivel.
    echo.
    echo    Pantalla de informacion: explica qué es cada dato en palabras simples: carpeta actual, carpeta del usuario, sistema operativo, procesadores, nombre de usuario y del equipo, carpeta de Windows, arquitectura, y nombre y ubicacion del archivo de AIOS.
    echo.
    echo    Uso del menu: escribe un numero del 0 al 7, o man para el manual, y pulsa Enter.    
    echo.
    echo  -----
    pause
    goto manual_AIOSv12
) else if !manual! EQU 1 (
    echo  -----
    echo.
    echo    [1] Eliminar
    echo.
    echo.
    echo    Archivo = uno: escribe el nombre con su extension [ej. notas.txt.]
    echo.
    echo    Archivo = varios: borra archivos numerados que comparten nombre. Se piden el nombre base sin extension, la extension con punto y la cantidad. Ejemplo: base foto, extensión .png, cantidad 3 borra foto1.png, foto2.png y foto3.png. La numeración siempre empieza en 1.
    echo.
    echo    Carpeta = una: AIOS pregunta si la carpeta tiene contenido. [SI] la borra con todo lo que hay dentro. [NO] solo la borra si esta vacia.
    echo.
    echo    Carpeta = varias: mismo patron de nombre base + numero, con la misma pregunta SI/NO.
    echo.
    echo    Volver: la opción [3] de cada submenu regresa al menu anterior.
    echo.
    echo    Advertencia: el borrado es definitivo. No pasa por la Papelera y AIOS no pide confirmacion.
    echo.
    echo  -----
    pause
    goto manual_AIOSv12
) else if !manual! EQU 2 (
    echo  -----
    echo.
    echo    [2] Crear
    echo.
    echo.
    echo    Archivo = uno: escribe el nombre con extension y luego la primera linea de texto. Despues el archivo se abre en el Bloc de notas para seguir escribiendo.
    echo.
    echo    Archivo = varios: pide nombre base, extension con punto, una primera linea [la misma para todos] y la cantidad. Crea archivo1.txt, archivo2.txt, etc.
    echo.
    echo    Carpeta = una / varias: [varias] usa el mismo patron de nombre base + numero [proyecto1, proyecto2...].
    echo.
    echo    Advertencia: si ya existe un archivo con ese nombre, se reemplaza y se pierde su contenido.
    echo.
    echo  -----
    pause
    goto manual_AIOSv12
) else if !manual! EQU 3 (
    echo  -----
    echo.
    echo    [3] Renombrar
    echo.
    echo.
    echo    Escribe el nombre actual con extension y luego el nuevo nombre, tambien con extension. Si la omites, el archivo la pierde.
    echo.
    echo    Solo cambia el nombre, no la carpeta; para eso existe Mover. Escribe AIOSrename en el primer campo para volver.
    echo.
    echo  -----
    pause
    goto manual_AIOSv12
) else if !manual! EQU 4 (
    echo  -----
    echo.
    echo    [4] Mover
    echo.
    echo.
    echo    Escribe el nombre del archivo o carpeta y despues la ruta de destino. AIOSmove funciona en cualquiera de los dos campos.
    echo.
    echo    Al terminar, AIOS pregunta pd [quedarte en la carpeta actual] o nd [pasar a la carpeta destino].
    echo.
    echo    Consejo: la carpeta destino debe existir. Si no existe, el archivo no entra a ninguna carpeta: se queda donde estaba y toma ese nombre.
    echo.
    echo  -----
    pause
    goto manual_AIOSv12
) else if !manual! EQU 5 (
    echo  -----
    echo.
    echo    [5] Leer
    echo.
    echo.
    echo    Escribe el nombre con extension y su contenido se muestra en pantalla. Escribe AIOSread para volver.
    echo.
    echo    Sirve para archivos de texto [.txt, .bat, .log, .csv], no para .docx, .pdf, imagenes ni programas.
    echo.
    echo  -----
    pause
    goto manual_AIOSv12
) else if !manual! EQU 6 (
    echo  -----
    echo.
    echo    [6] Ubicacion
    echo.
    echo    Muestra la carpeta actual. Si respondes [Si], vas a la pantalla para elegir una nueva ubicacion, igual que al inicio. Si respondes [No], vuelves al menu.
    echo.
    echo  -----
    pause
    goto manual_AIOSv12
) else if !manual! EQU 7 (
    echo  -----
    echo.
    echo    [7] Ejecutar [en desarrollo]
    echo.
    echo    Escribe el nombre del archivo con extension. AIOS lo ejecuta y muestra el texto que produce cuando termina. Escribe AIOSexec para volver.
    echo.
    echo    Está pensado para scripts que solo muestran texto. Con programas que piden datos o abren ventanas, AIOS puede parecer congelado.
    echo.
    echo  -----
    pause
    goto manual_AIOSv12
) else if !manual! EQU 0 (
    echo  -----
    echo.
    echo    [0] Salir
    echo.
    echo    Si cierra AIOS. No, o cualquier otra respuesta, vuelve al menu.
    echo.
    echo    Si abriste AIOS desde una ventana de CMD, regresas a esa ventana. Si lo abriste con doble clic, la ventana se cierra.
    echo.
    echo  -----
    pause
    goto manual_AIOSv12
) else if /i "!manual!"=="k" (
    echo  -----
    echo.
    echo    [k] Palabras clave para volver
    echo.
    echo.
    echo    Ninguna distingue mayusculas de minusculas.
    echo.
    echo    Donde / Escribe
    echo.
    echo    Renombrar / AIOSrename
    echo.
    echo    Mover / AIOSmove
    echo.
    echo    Leer / AIOSread
    echo.
    echo    Ejecutar / AIOSexec
    echo.
    echo    Eliminar y Crear / opcion [3]
    echo.
    echo    Menu principal = manual / man
    echo.
    echo  -----
    pause
    goto manual_AIOSv12
) else if /i "!manual!"=="c" (
    echo  -----
    echo.
    echo    [c] Consejos y advertencias
    echo.
    echo.
    echo    Esta seccion reune en un solo lugar lo que mas errores evita:
    echo.
    echo    -   Revisa la carpeta actual antes de borrar o crear. Por eso siempre se ponen los archivos y carpetas disponibles en el directorio actual.
    echo.
    echo    -   Escribe los archivos con extension, excepto en las opciones de [varios], donde la extension se pide aparte y con punto.
    echo.
    echo    -   La numeracion automatica empieza en 1 y no usa ceros [archivo1, no archivo01].
    echo.
    echo    -   Borrar es definitivo y crear puede reemplazar archivos existentes.
    echo.
    echo  -----
    pause
    goto manual_AIOSv12
) else if /i "!manual!"=="n" (
    echo  -----
    echo.
    echo    [n] Novedades de la version !version!
    echo.
    echo.
    echo    - Arreglo de Bugs: La version 1.1 y anteriores contaban con un error que hacia que el usuario a la hora de salir del programa tuviera que presionar varias veces la opcion de salir.
    echo    Ahora el bug esta solucionado.
    echo.
    echo    - Nueva funcion en desarrollo: La funcion [ejecutar] esta en desarrollo. Trata de ejecutar programas de texto .bat y .txt.
    echo.
    echo  -----
    pause
    goto manual_AIOSv12
) else if /i "!manual!"=="v" (
    goto ECRM
) else (
    call :error_AIOSv02
)
pause
goto ECRM
