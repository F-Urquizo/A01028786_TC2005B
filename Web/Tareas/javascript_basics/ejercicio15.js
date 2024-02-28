"use strict"

function numerosDescendente (listaNumeros)
{
    listaNumeros.sort(function(a, b)
    {
        return b - a
    });
    return listaNumeros;
}
 
console.log(numerosDescendente([1, 2, 3, 4, 5])) 