"use strict"

function factores (entero)
{
    let factors = [];
    let i = 0;
    while (i <= entero)
    {
        if (entero % i == 0)
        {
            factors.push(i)
        }
        i++;
    }
    return factors;
}
 
console.log(factores(12))
