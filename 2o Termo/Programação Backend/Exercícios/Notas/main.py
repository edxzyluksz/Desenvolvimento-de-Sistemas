from notas import clean_screen, coletar_nome, numero_notas, calculo_media, continuar

def main():
    clean_screen()
    
user = coletar_nome() 

while True:        
    numnotas = numero_notas(user) 
    
    if not calculo_media(numnotas, user):
        continue

    if not continuar(user):
        break

if __name__ == "__main__":
    main()
