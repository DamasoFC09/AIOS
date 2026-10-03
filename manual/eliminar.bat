@echo off
    echo  -----
    echo -
    echo    [1] Eliminar
    echo -
    echo -
    echo    Archivo = uno: escribe el nombre con su extension [ej. notas.txt.]
    echo -
    echo    Archivo = varios: borra archivos numerados que comparten nombre. Se piden el nombre base sin extension, la extension con punto y la cantidad. Ejemplo: base foto, extensión .png, cantidad 3 borra foto1.png, foto2.png y foto3.png. La numeracion siempre empieza en 1.
    echo -
    echo    Carpeta = una: AIOS pregunta si la carpeta tiene contenido. [SI] la borra con todo lo que hay dentro. [NO] solo la borra si esta vacia.
    echo -
    echo    Carpeta = varias: mismo patron de nombre base + numero, con la misma pregunta SI/NO.
    echo -
    echo    Volver: la opcion [3] de cada submenu regresa al menu anterior.
    echo -
    echo    Advertencia: el borrado es definitivo. No pasa por la Papelera y AIOS no pide confirmacion.
    echo -
    echo  -----