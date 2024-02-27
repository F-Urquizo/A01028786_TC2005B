"use strict"

function primerCaracter(texto)
{
    let hashmap = {};
    for (let i = 0; i < texto.length; ++i)
    {
        if (texto[i] in hashmap)
        {
            hashmap[texto[i]]++;
        }
        else
        {
            hashmap[texto[i]] = 1; 
        }
    }

    for (let i = 0; i < texto.length; ++i)
    {
        if (hashmap[texto[i]] == 1)
        {
            return texto[i];
        }
    }

}

console.log(primerCaracter("abacddbec"));
