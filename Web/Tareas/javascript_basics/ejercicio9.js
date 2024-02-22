"use strict"

function cadenaMasCorta (listaCadenas)
{
    let min = listaCadenas[0];
    for (let i = 1; i < listaCadenas.length; i++)
    {
        if (listaCadenas[i].length < min)
        {
            min = listaCadenas[i];
        }
    }
    return min;
}

console.log(cadenaMasCorta(['hola', 'adios', 'hasta luego']))