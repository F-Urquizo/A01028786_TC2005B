"use strict"

function invertArray(lista)
{
    let i = 0; 
    let j = lista.length - 1; 
    let tmp;
    while (i <= j)
    {
        tmp = lista[i];
        lista[i] = lista[j];
        lista[j] = tmp;
        i++;
        j--;
    }
    return lista
}

function newInvertedArray(lista)
{
    let lista2 = []
    for (let i = lista.length - 1; i >= 0; i--)
    {
        lista2.push(lista[i]);
    }

    return lista2
}

console.log(invertArray([1, 2, 3, 4, 5]))
console.log(newInvertedArray([1, 2, 3, 4, 5]))