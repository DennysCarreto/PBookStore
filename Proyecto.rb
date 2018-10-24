def limpiar_pantalla
    system('clear')
    #En caso de que no limpie la pantalla comenten la anterior linea y des comenten la siguiente
    #system('cls')
end
def novalido
    puts "LA OPCION INGRESADA NO EXISTE"
    #Limpiar pantalla y una pausa
    gets()
    limpiar_pantalla
end

#Menu 3 de Administracion de Libros
def menuadmin()
    begin
        puts "\tMenu de Administracion de Libros "
        puts 'Listado de Opciones '
        puts '1-Registro de Nuevos Libros'
        puts '2-Registro de Autores'
        puts '3-Listado de Libros'
        puts '4-Listado de Autores'
        puts '5-Buscar Libro'
        puts '6-Buscar Autor'
        puts '7-Salir'
        print 'Ingrese una opcion: '
        #uso de case para crear el menu
        opciones = gets.chomp
        limpiar_pantalla
        case opciones 
        when '1' then 
            puts"Reg de Nue. Libros"
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        when '2' then 
            puts"Reg. de Autores"
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        when '3' then 
            puts"Listado de Libros"
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        when '4' then 
            puts"Listado de Autores"
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        when '5' then 
            puts"Buscar Libro"
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        when '6' then 
            puts"Buscar Autor"
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        when '7' then 
            puts"Menu 1 Terminado"
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        else novalido 
        end

    end while (opciones!='7')
end

#Menu de 2 Control de Ventas
def menucontrol()
    begin
        puts "\t Control de Ventas "
        puts 'Listado de opciones '
        puts '1-Registrar una Venta'
        puts '2-Buscar una Venta'
        puts '3-Listado de Ventas'
        puts '4-Salir'
        print 'Ingrese una opcion: '
        #uso de case para crear el menu
        opciones = gets.chomp
        limpiar_pantalla
        
        case opciones 
        when '1' 
            puts'Reg. Una Venta'
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        when '2'   
            puts "Buscar una Venta"
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        when '3'   
            puts "Listado de Ventas"
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        when '4' 
            puts "Menu 2 Terminado "
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        else novalido 
        end
          
    end while (opciones!='4')
end

#Menu Principal
begin
    puts "\tProyecto BookStore "
    puts 'Opciones de BookStore '
    puts '1-Administracion de Libros'
    puts '2-Control de Ventas'
    puts '3-Salir'
    print 'Ingrese una opcion: '
    opciones = gets.chomp
    #uso de case para crear el menu
    case opciones 
    when '1' 
        limpiar_pantalla
        menuadmin
    when '2'   
        limpiar_pantalla
        menucontrol
    when '3' 
        puts "Programa Terminado"
    else novalido 
    end
        
end while (opciones!='3')