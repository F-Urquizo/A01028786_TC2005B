"use strict"

function medianaYModa (listaNumeros)
{
    // Moda
    let hashModa = {};
    let maxValue = 0;
    let maxKey = 0;
    for (let i = 0; i < listaNumeros.length; i++)
    {
        if (!hashModa[listaNumeros[i]])
        {
            hashModa[listaNumeros[i]] = 1;
        }
        else
        {
            hashModa[listaNumeros[i]] += 1;
        }
        if (hashModa[listaNumeros[i]] > maxValue)
        {
            maxKey = listaNumeros[i]
            maxValue = hashModa[listaNumeros[i]]
        }
    }

    // Mediana
    let median;
    listaNumeros.sort(function(a, b) {
        return a - b;
    });
    
    if (listaNumeros.length % 2 === 0) {
        let middle1 = listaNumeros[listaNumeros.length / 2 - 1];
        let middle2 = listaNumeros[listaNumeros.length / 2];
        median = (middle1 + middle2) / 2;
    } else {
        median = listaNumeros[Math.floor(listaNumeros.length / 2)];
    }
    
    console.log("Median:", median);
    
    
    
    return [median, maxKey];



}

console.log(medianaYModa([1, 2, 3, 4]))