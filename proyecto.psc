Algoritmo proyecto
	Definir palabra, letra, giones, nuevo Como Cadena;
	Definir errores,i Como Entero;
	Definir acerto Como Logico;
	
	Escribir "Escriba la palabra a adivinar";
	Leer palabra;
	palabra <- Mayusculas(palabra);
	
	giones <- "";
	Para i <- 1 Hasta Longitud(palabra) Con Paso 1 Hacer
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
		
		acerto <- Falso;
		nuevo <- "";
		Para i <- 1 Hasta Longitud(palabra) Con Paso 1 Hacer
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