void main() {
    String palabra, letra, giones, nuevo;
    int errores, i, numUsadas;
    boolean acerto;
    String[] usadas = new String[50];
    numUsadas = 0;
 
    instrucciones();
 
    palabra = IO.readln("Escriba la palabra a adivinar: ");
    palabra = palabra.toUpperCase();
 
    giones = "";
    for (i = 0; i <= palabra.length() - 1; i++) {
        if (palabra.charAt(i) == ' ') {
            giones = giones + " ";
        } else {
            giones = giones + "_";
        }
    }
 
    errores = 0;
 
    while (!giones.equals(palabra) && errores < 6) {
        borrarPantalla();
        IO.println("Adivina la palabra");
        IO.println(giones);
        IO.println("Errores: " + errores + " de 6");
        mostrarUsadas(usadas, numUsadas);
        switch (errores) {
            case 0 -> {
                IO.println("  -----");
                IO.println("  |   |");
                IO.println("  |   O");
                IO.println("  |  /|\\");
                IO.println("  |  / \\");
                IO.println("=====");
            }
            case 1 -> {
                IO.println("  -----");
                IO.println("  |   |");
                IO.println("  |   O");
                IO.println("  |  /|\\");
                IO.println("  |  /");
                IO.println("=====");
            }
            case 2 -> {
                IO.println("  -----");
                IO.println("  |   |");
                IO.println("  |   O");
                IO.println("  |  /|\\");
                IO.println("  |");
                IO.println("=====");
            }
            case 3 -> {
                IO.println("  -----");
                IO.println("  |   |");
                IO.println("  |   O");
                IO.println("  |  /|");
                IO.println("  |");
                IO.println("=====");
            }
            case 4 -> {
                IO.println("  -----");
                IO.println("  |   |");
                IO.println("  |   O");
                IO.println("  |   |");
                IO.println("  |");
                IO.println("=====");
            }
            case 5 -> {
                IO.println("  -----");
                IO.println("  |   |");
                IO.println("  |   O");
                IO.println("  |");
                IO.println("  |");
                IO.println("=====");
            }
            default -> {
            }
        }
 
        letra = IO.readln("Escribe una letra: ").toUpperCase();
 
        while (letra.length() != 1 || yaUsada(usadas, numUsadas, letra)) {
            letra = IO.readln("Letra invalida o repetida, escribe otra: ").toUpperCase();
        }
        usadas[numUsadas] = letra;
        numUsadas++;
 
        acerto = false;
        nuevo = "";
        for (i = 0; i <= palabra.length() - 1; i++) {
            if (palabra.charAt(i) == letra.charAt(0)) {
                nuevo = nuevo + letra;
                acerto = true;
            } else {
                nuevo = nuevo + giones.charAt(i);
            }
        }
        giones = nuevo;
 
        if (!acerto) {
            errores = errores + 1;
        }
    }
 
    borrarPantalla();
    if (giones.equals(palabra)) {
        IO.println("Ganaste La palabra era: " + palabra);
    } else {
        IO.println("Perdiste La palabra era: " + palabra);
    }
}
 
void borrarPantalla() {
    System.out.print("\033[H\033[2J");
    System.out.flush();
}
 
void instrucciones() {
    borrarPantalla();
    IO.println("========== AHORCADO ==========");
    IO.println("El jugador 1 escribe una palabra secreta y el jugador 2 la adivina.");
    IO.println("Cada _ es una letra que debes adivinar.");
    IO.println("En cada turno escribe UNA letra y presiona Enter.");
    IO.println("Si la letra esta en la palabra, aparece en su lugar.");
    IO.println("Si no esta, se cuenta un error.");
    IO.println("Con 6 errores pierdes. Si completas la palabra, ganas.");
    IO.println("Las letras repetidas no se pueden volver a usar.");
    IO.println("==============================");
    IO.readln("Presiona Enter para comenzar...");
}
 
void mostrarUsadas(String[] usadas, int cantidad) {
    int k;
    IO.print("Letras usadas: ");
    for (k = 0; k < cantidad; k++) {
        IO.print(usadas[k] + " ");
    }
    IO.println();
}
 
boolean yaUsada(String[] usadas, int cantidad, String letra) {
    boolean encontrada;
    int k;
    encontrada = false;
    for (k = 0; k < cantidad; k++) {
        if (usadas[k].equals(letra)) {
            encontrada = true;
        }
    }
    return encontrada;
}