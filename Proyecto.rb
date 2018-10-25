require 'byebug'
require 'terminal-table'

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

#Nodo pila y cola
cola = {
    tope: nil,
    esta_vacio: true,
    final: nil,
    max: 5,
    size: 0
}
pila = {
  tope: nil,
  esta_vacio: true,
  size: 0
}

#Registro de Nuevo libro
def Reg_New_libro(pila,cola)
    if cola[:esta_vacio]
      puts 'No existen autores en el sistema. '
    else
      print 'Ingrese el nombre del autor:'
      nombre_autor = gets.chomp
      nodo_autor = buscar_autor(cola,nombre_autor)
      if nodo_autor == '***El autor no existe en el sistema***'
        puts nodo_autor
      else
          if pila[:esta_vacio]#cambio
            print 'Ingrese el ISBN: '
            isbn = gets.chomp
            print 'Ingrese el nombre del libro: '
            nombre_libro = gets.chomp
            print 'Ingrese el precio: '
            precio_libro = gets.to_i
            libro = {
              nombre:nombre_libro,
              ISBN:isbn,
              autor: nombre_autor,
              precio: precio_libro,
              se_imprime: 'si',
              siguiente: nil
            }
            pila[:tope]=libro
            pila[:esta_vacio]=false#cambio
            pila[:size]+=1#suma de libros
            nodo_autor[:libros]+=1
          else
            print 'Ingrese el ISBN: '
            isbn = gets.chomp
            nodo_libro = buscar_libro(pila,isbn)#cambio pila
            if nodo_libro == 'no existe el libro'
            print 'Ingrese el nombre del libro: '
            nombre_libro = gets.chomp
            print 'Ingrese el precio: '
            precio_libro = gets.to_i
            libro = {
              nombre:nombre_libro,
              ISBN:isbn,
              autor: nombre_autor,
              precio: precio_libro,
              se_imprime:'si',
              siguiente: nil
            }
            tope = pila[:tope]#cambio
            libro[:siguiente] = tope
            pila[:tope] = libro
            pila[:size]+=1 #suma de libros
            nodo_autor[:libros]+=1
            else
              if nombre_autor == nodo_libro[:autor]
              puts "El ISBN ingresado pertenece al libro -#{nodo_libro[:nombre]}-"
              puts "Perteneciente al autor -#{nodo_libro[:autor]}-"
              puts "Usted tendra una unidad mas de este libro"
              libro = {
              nombre:nodo_libro[:nombre],
              ISBN:nodo_libro[:ISBN],
              autor: nodo_libro[:autor],
              precio: nodo_libro[:precio],
              se_imprime: 'no',
              siguiente: nil
              }
              tope = pila[:tope]#cambio
              libro[:siguiente] = tope
              pila[:tope] = libro
              pila[:size]+=1 #suma de libros
              nodo_autor[:libros]+=1
              else
                puts "El ISBN #{isbn} le pertene al  libro -#{nodo_libro[:nombre]}-"
                puts "Perteneciente al autor -#{nodo_libro[:autor]}-"
                puts "Ingrese un ISBN DIFERENTE!!!"
              end
  
            end#fin del if si se encuntra un isbn igual al ingresado. se busca en el nodo autor
  
          end#fin de ingresar un libro en un autor sin libro
      end#fin condicion busqueda del autor
    end#fin primer if
    #gets
  end#fin de la funcion


#Menu 3 de Administracion de Libros
def menuadmin(pila,cola)
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
        when '1'  
            puts"Reg de Nue. Libros"
            Reg_New_libro(pila,cola)
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        when '2'  
            puts"Reg. de Autores"
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        when '3'  
            puts"Listado de Libros"
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        when '4' 
            puts"Listado de Autores"
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        when '5' 
            puts"Buscar Libro"
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        when '6' 
            puts"Buscar Autor"
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        when '7'  
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
        menuadmin(pila,cola)
    when '2'   
        limpiar_pantalla
        menucontrol
    when '3' 
        puts "Programa Terminado"
    else novalido 
    end
        
end while (opciones!='3')