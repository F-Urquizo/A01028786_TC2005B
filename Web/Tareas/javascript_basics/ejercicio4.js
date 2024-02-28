"use strict"

function capString(cadena)
{
    let cadena2 = ""
    let i = 0
    while (i < cadena.length) 
    {
        if (i == 0)
        { 
            cadena2 += cadena[i].toUpperCase()
            i++
        }
        else if (cadena[i] == " ")
        {
            cadena2 += cadena[i]
            cadena2 += cadena[i + 1].toUpperCase()
            i++
            i++
        }
        else
        {
            cadena2 += cadena[i]
            i++
        }

    }
    return cadena2
}

console.log(capString("hola soy francisco"))