"use strict"

function quitaDuplicados(lista)
{
    let sinDuplicados = [];
    let duplicadosHash = {};

    for (let i = 0; i < lista.length; i++)
    {
        if (!duplicadosHash[lista[i]])
        {
            duplicadosHash[lista[i]] = 1
        }
        else
        {
            duplicadosHash[lista[i]] += 1;
        }
        
    }

    for (let key in duplicadosHash)
    {
        if (duplicadosHash[key] > 1)
        {
            sinDuplicados.push(Number(key));
        }
    }
    return sinDuplicados;

}

console.log(quitaDuplicados([1, 1, 0, 0, 1]))

