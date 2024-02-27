"use strict"

function esPotencia (num)
{
    if (Number.isInteger(Math.log2(num)))
    {
        return true;
    }
    else
    {
        return false;
    }
}

console.log(esPotencia(6)) 
