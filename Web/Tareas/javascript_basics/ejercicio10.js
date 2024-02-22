"use strict"

function esPalindromo (cadena)
{
    let i = 0
    let j = cadena.length - 1

    while (i <= j)
    {
        if (cadena[i] != cadena[j])
        {
            return false;
        }
        i++;
        j--;
    }
    return true
}

console.log(esPalindromo("yosoy"))