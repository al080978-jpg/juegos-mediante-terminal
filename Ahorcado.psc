Algoritmo proyecto
	Definir palabra, letra, giones, nuevo Como Cadena;
	Definir errores Como Entero;
	Definir acerto Como Logico;
	Definir i, numUsadas Como Entero;
	Definir usadas Como Cadena;
	Dimension usadas[50];
	numUsadas <- 0;
	
	Instrucciones;
	
	Escribir "Escriba la palabra a adivinar";
	Leer palabra;
	palabra <- Mayusculas(palabra);
	
	giones <- "";
	Para i <- 0 Hasta Longitud(palabra) - 1 Con Paso 1 Hacer
		Si Subcadena(palabra, i, i) = " " Entonces
			giones <- Concatenar(giones, " ");
		SiNo
			giones <- Concatenar(giones, "_");
		FinSi
	FinPara
	
	errores <- 0;
	
	Mientras giones <> palabra Y errores < 6 Hacer
		Borrar Pantalla;
		Escribir "Adivina la palabra";
		Escribir giones;
		Escribir "Errores: ", errores, " de 6";
		MostrarUsadas(usadas, numUsadas);
		Segun errores hacer
			0:
				Escribir "  -----";
				Escribir "  |   |";
				Escribir "  |   O";
				Escribir "  |  /|\";
				Escribir "  |  / \";
				Escribir "=====";
			1:
				Escribir "  -----";
				Escribir "  |   |";
				Escribir "  |   O";
				Escribir "  |  /|\";
				Escribir "  |  /";
				Escribir "=====";
			2:
				Escribir "  -----";
				Escribir "  |   |";
				Escribir "  |   O";
				Escribir "  |  /|\";
				Escribir "  |";
				Escribir "=====";
			3:
				Escribir "  -----";
				Escribir "  |   |";
				Escribir "  |   O";
				Escribir "  |  /|";
				Escribir "  |";
				Escribir "=====";
			4:
				Escribir "  -----";
				Escribir "  |   |";
				Escribir "  |   O";
				Escribir "  |   |";
				Escribir "  |";
				Escribir "=====";
			5:
				Escribir "  -----";
				Escribir "  |   |";
				Escribir "  |   O";
				Escribir "  |";
				Escribir "  |";
				Escribir "=====";
		FinSegun
		
		Escribir "Escribe una letra";
		Leer letra;
		letra <- Mayusculas(letra);
		
		Mientras Longitud(letra) <> 1 O YaUsada(usadas, numUsadas, letra) Hacer
			Escribir "Letra invalida o repetida, escribe otra";
			Leer letra;
			letra <- Mayusculas(letra);
		FinMientras
		numUsadas <- numUsadas + 1;
		usadas[numUsadas] <- letra;
		
		acerto <- Falso;
		nuevo <- "";
		Para i <- 0 Hasta Longitud(palabra) - 1 Con Paso 1 Hacer
			Si Subcadena(palabra, i, i) = letra Entonces
				nuevo <- Concatenar(nuevo, letra);
				acerto <- Verdadero;
				
			SiNo
				nuevo <- Concatenar(nuevo, Subcadena(giones, i, i));
			FinSi
		FinPara
		giones <- nuevo;
		
		Si !acerto Entonces
			errores <- errores + 1;
		FinSi
	FinMientras
	
	Borrar Pantalla;
	Si giones = palabra Entonces
		Escribir "Ganaste La palabra era: ", palabra;
	SiNo
		Escribir "Perdiste La palabra era: ", palabra;
	FinSi
FinAlgoritmo

SubProceso Instrucciones
	Borrar Pantalla;
	Escribir "========== AHORCADO ==========";
	Escribir "El jugador 1 escribe una palabra secreta y el jugador 2 la adivina.";
	Escribir "Cada _ es una letra que debes adivinar.";
	Escribir "En cada turno escribe UNA letra y presiona Enter.";
	Escribir "Si la letra esta en la palabra, aparece en su lugar.";
	Escribir "Si no esta, se cuenta un error.";
	Escribir "Con 6 errores pierdes. Si completas la palabra, ganas.";
	Escribir "Las letras repetidas no se pueden volver a usar.";
	Escribir "==============================";
	Escribir "Presiona una tecla para comenzar...";
	Esperar Tecla;
FinSubProceso

SubProceso MostrarUsadas(usadas, cantidad)
	Definir k Como Entero;
	Escribir Sin Saltar "Letras usadas: ";
	Para k <- 1 Hasta cantidad Con Paso 1 Hacer
		Escribir Sin Saltar usadas[k], " ";
	FinPara
	Escribir "";
FinSubProceso

Funcion encontrada <- YaUsada(usadas, cantidad, letra)
	Definir encontrada Como Logico;
	Definir k Como Entero;
	encontrada <- Falso;
	Para k <- 1 Hasta cantidad Con Paso 1 Hacer
		Si usadas[k] = letra Entonces
			encontrada <- Verdadero;
		FinSi
	FinPara
FinFuncion
