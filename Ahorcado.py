import os
 
 
def borrar_pantalla():
    os.system("cls" if os.name == "nt" else "clear")
 
 
def instrucciones():
    borrar_pantalla()
    print("========== AHORCADO ==========")
    print("El jugador 1 escribe una palabra secreta y el jugador 2 la adivina.")
    print("Cada _ es una letra que debes adivinar.")
    print("En cada turno escribe UNA letra y presiona Enter.")
    print("Si la letra esta en la palabra, aparece en su lugar.")
    print("Si no esta, se cuenta un error.")
    print("Con 6 errores pierdes. Si completas la palabra, ganas.")
    print("Las letras repetidas no se pueden volver a usar.")
    print("==============================")
    input("Presiona Enter para comenzar...")
 
 
def mostrar_usadas(usadas, cantidad):
    print("Letras usadas: ", end="")
    for k in range(cantidad):
        print(usadas[k], end=" ")
    print()
 
 
def ya_usada(usadas, cantidad, letra):
    encontrada = False
    for k in range(cantidad):
        if usadas[k] == letra:
            encontrada = True
    return encontrada
 
 
def main():
    usadas = [""] * 50
    num_usadas = 0
 
    instrucciones()
 
    palabra = input("Escriba la palabra a adivinar: ")
    palabra = palabra.upper()
 
    giones = ""
    for i in range(len(palabra)):
        if palabra[i] == " ":
            giones = giones + " "
        else:
            giones = giones + "_"
 
    errores = 0
 
    while giones != palabra and errores < 6:
        borrar_pantalla()
        print("Adivina la palabra")
        print(giones)
        print("Errores:", errores, "de 6")
        mostrar_usadas(usadas, num_usadas)
 
        if errores == 0:
            print("  -----")
            print("  |   |")
            print("  |   O")
            print("  |  /|\\")
            print("  |  / \\")
            print("=====")
        elif errores == 1:
            print("  -----")
            print("  |   |")
            print("  |   O")
            print("  |  /|\\")
            print("  |  /")
            print("=====")
        elif errores == 2:
            print("  -----")
            print("  |   |")
            print("  |   O")
            print("  |  /|\\")
            print("  |")
            print("=====")
        elif errores == 3:
            print("  -----")
            print("  |   |")
            print("  |   O")
            print("  |  /|")
            print("  |")
            print("=====")
        elif errores == 4:
            print("  -----")
            print("  |   |")
            print("  |   O")
            print("  |   |")
            print("  |")
            print("=====")
        elif errores == 5:
            print("  -----")
            print("  |   |")
            print("  |   O")
            print("  |")
            print("  |")
            print("=====")
 
        letra = input("Escribe una letra: ")
        letra = letra.upper()
 
        while len(letra) != 1 or ya_usada(usadas, num_usadas, letra):
            letra = input("Letra invalida o repetida, escribe otra: ")
            letra = letra.upper()
        usadas[num_usadas] = letra
        num_usadas = num_usadas + 1
 
        acerto = False
        nuevo = ""
        for i in range(len(palabra)):
            if palabra[i] == letra:
                nuevo = nuevo + letra
                acerto = True
            else:
                nuevo = nuevo + giones[i]
        giones = nuevo
 
        if not acerto:
            errores = errores + 1
 
    borrar_pantalla()
    if giones == palabra:
        print("Ganaste La palabra era:", palabra)
    else:
        print("Perdiste La palabra era:", palabra)
 
 
main()
 