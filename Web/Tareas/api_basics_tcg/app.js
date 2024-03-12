"use strict"

import express from 'express';

const app = express()

const port = 3000

let autoID = 0

app.use(express.json())

let cartas = []

app.listen(port, () => (
    console.log(`Listening on port ${port}`)
))

app.get('/api/api_basics_tcg/cartas', (req, resp) =>
{
    if (cartas.length === 0)
    {
        resp.status(404).send("No hay cartas en el servidor");
    }
    else
    {
        resp.status(200).json(cartas);
    }
    
})

app.get('/api/api_basics_tcg/cartas/:id', (req, resp) =>
{
    
    let cartaID = req.params.id

    let carta = null

    for (let card of cartas)
    {
        if (card.id == cartaID)
        {
            carta = card
        }
    }

    if (!carta)
    {
        resp.status(404).send(`No hay cartas con id ${req.params.id}.`);
    }
    else
    {
        resp.status(200).json(carta);
    }
    
})


app.post('/api/api_basics_tcg/addCards', (req, resp) => {
    if (req.body.cards) {
        let existingCards = [];

        for (let cardJ of req.body.cards) {
            let carta = null;

            for (let card of cartas) {
                if (
                    cardJ.nombre == card.nombre &&
                    cardJ.tipo == card.tipo &&
                    cardJ.ataque == card.ataque &&
                    cardJ.defensa == card.defensa
                ) {
                    carta = card;
                    break;
                }
            }

            if (!carta) {
                if (
                    cardJ.nombre &&
                    cardJ.tipo &&
                    cardJ.ataque &&
                    cardJ.defensa
                ) {
                    cardJ.id = ++autoID;
                    cartas.push(cardJ);
                } else {
                    console.log("Falta de atributos de carta. No se pudo añadir.");
                    resp.status(404).send("Falta de atributos de carta. No se pudo añadir.");
                    //return; 
                }
            } else {
                existingCards.push(cardJ);
            }
        }

        if (existingCards.length === 0) {
            console.log("Cartas añadidas correctamente.");
            resp.status(200).send("Cartas añadidas correctamente.");
        } else {
            console.log("Algunas cartas ya existen:", existingCards);
            resp.status(409).send("Algunas cartas ya existen y no se añadieron:" + JSON.stringify(existingCards));
        }
    } else {
        console.log("No se mandó un array de cartas.");
        resp.status(404).send("No se mandó un array de cartas.");
    }
});


app.delete('/api/api_basics_tcg/delete/:id', (req, resp) =>
{
    
    let cartaID = req.params.id

    let carta = null

    let idx = 0

    for (let card of cartas)
    {
        if (card.id == cartaID)
        {
            carta = card
            break
        }
        idx++
    }

    if (!carta)
    {
        console.log("No existen cartas con ese id")
        resp.status(404).send(`No existen cartas con el id ${cartaID} \n`)
    }

    else
    {
        cartas.splice(idx, 1)
        console.log("Se borró la carta exitosamente")
        resp.status(200).send(`Se borró la carta con id ${cartaID} \n`)
    }
})

app.put('/api/api_basics_tcg/update/:id', (req, resp) =>
{
    
    let cartaID = req.params.id

    let carta = null

    for (let card of cartas)
    {
        if (card.id == cartaID)
        {
            carta = card
            break
        }
    }

    if (!carta)
    {
        console.log("No existen cartas con ese id")
        resp.status(404).send(`No existen cartas con el id ${cartaID} \n`)
    }

    else
    {
        if (req.body.nombre)
        {
            carta.nombre = req.body.nombre
        }
        if (req.body.tipo)
        {
            carta.tipo = req.body.tipo
        }
        if (req.body.ataque)
        {
            carta.ataque = req.body.ataque
        }
        if (req.body.defensa)
        {
            carta.defensa = req.body.defensa
        }
        console.log("Se actualizó la carta exitosamente")
        resp.status(200).send(`Se actualizó la carta exitosamente`)
    }
})