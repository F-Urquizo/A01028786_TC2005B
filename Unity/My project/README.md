# Instrucciones de juego SIMON:

## Francisco Urquizo

El juego de SIMON fue desarrollado en el entorno de Unity. El juego consta de cuatro botones de diferentes colores. Los botones se iluminan y emiten un sonido en un orden aleatorio y el jugador debe repetir la secuencia vista. Cada turno, la secuencia se incrementa por una activación del botón. El objetivo del juego es pasar la mayor cantidad de turnos posibles sin errar en la repetición de la secuencia.

Dentro del proyecto de Unity, se debe proceder a la carpeta de "Scenes" en la carpeta de "Assets" y seleccionar la escena de "Simon". Habiendo seleccionado la escena, se debe optimir el boton de iniciar juego en la parte superior central del entorno de desarrollo. Habiendo hecho esto, se debe presionar el botón de "START" para que el juego comience con su ejecución.

A lo largo del juego, el botón de "REPEAT" puede ser utilizado solamente una vez para repetir la secuencia actual en caso de que el jugador quiera verla de nuevo. Al oprimir el botón, este se desactivará y cambiará de color blanco a gris para indicar que ya fue utilizado. 

Cuando pierda el jugador, automáticamente será trasladado a otra escena llamada "SimonResults", en donde podrá apreciar el número de turnos que logró superar ("Score"), el número máximo de turnos que se ha superado en la historia del juego ("Highscore"), y tendrá la alternativa de iniciar un nuevo juego oprimiendo el botón "New Game" en la parte central inferior de la patalla del juego. Esto lo volverá a llevar a la escena de "Simon", en donde podrá volver a oprimir "START" y utilizar nuevamente el botón de "REPEAT", si así lo desea, en un momento cualquiera de su partida.