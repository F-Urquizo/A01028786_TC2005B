"use strict"

function toHackerSpeak (cadena)
{
    let hackerHash = { 'i': '1', 'o' : '0', 'a' : '4', 's' : '5', 'e' : '3'};
    let result = '';

    for (let i = 0; i < cadena.length; i++)
    {
        if (cadena[i] in hackerHash)
        {
            result += hackerHash[cadena[i]];
        }
        else
        {
            result += cadena[i];
        }
    }
    return result;
}

console.log(toHackerSpeak("Javascript es divertido")) 