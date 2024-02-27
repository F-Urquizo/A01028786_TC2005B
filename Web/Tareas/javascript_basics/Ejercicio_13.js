"use strict"

function cadenaMasFrecuente (listaCadenas)
{
    let hashModa = {};
    let maxValue = 0;
    let maxKey = 0;
    for (let i = 0; i < listaCadenas.length; i++)
    {
        if (!hashModa[listaCadenas[i]])
        {
            hashModa[listaCadenas[i]] = 1;
        }
        else
        {
            hashModa[listaCadenas[i]] += 1;
        }
        if (hashModa[listaCadenas[i]] > maxValue)
        {
            maxKey = listaCadenas[i]
            maxValue = hashModa[listaCadenas[i]]
        } 
    }

    return maxKey;
}

console.log(cadenaMasFrecuente(['hola', 'hola', 'bye']))
