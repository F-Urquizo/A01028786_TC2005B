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
        
        if (cadena[i + 1] == " ")
        {
            i++;
            i++;
        }
        else
        {
            i++;
        }

        if (cadena[j - 1] == " ")
        {
            j--;
            j--;
        }
        else
        {
            j--;
        }
    }
    return true
}

console.log(esPalindromo("yo soy"))