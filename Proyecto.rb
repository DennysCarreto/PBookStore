require 'byebug'
require 'terminal-table'

def limpiar_pantalla
    system('clear')
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

def librosporautor(nombre,pila)
  libro = pila[:tope]
  conta=1
  unidad=0
  while conta<=pila[:size]
    if libro[:autor]==nombre
      unidad+=1
    end
    if  libro[:siguiente]==nil
      conta=pila[:size]+1
    else
      nuevo_elemento = libro[:siguiente]
      libro = nuevo_elemento
      conta+=1
    end
  end
  return unidad
end
# cant Unidades
def ver_unidades(pila,isbn)
  libro = pila[:tope]
  conta=1
  unidad=0
  while conta<=pila[:size]
    if libro[:ISBN]==isbn
      unidad+=1
    end

    if  libro[:siguiente]==nil
      conta=pila[:size]+1

    else
      nuevo_elemento = libro[:siguiente]
      libro = nuevo_elemento
      conta+=1
    end
  end
  return unidad
end

#BUSCAR AUTOR
def buscar_autor(cola,nombre)
  elemento = cola[:tope]
  conta=1
  while conta<=cola[:size]
    if elemento[:nombre]==nombre
      conta=6
      return elemento
      break
    elsif   elemento[:siguiente]==nil && elemento[:valor]!=nombre
      return '***El autor no existe en el sistema***'
      break
    else
      nuevo_elemento = elemento[:siguiente]
      elemento = nuevo_elemento
      conta+=1
    end
  end
end
# Mostrar autor
def mostrar_autor(cola,pila)
  if cola[:max]==5
    puts 'no hay autores para mostrar'
  else
    print 'Ingrese el nombre del autor: '
    nombre = gets.chomp
    elemento = buscar_autor(cola,nombre)
    if elemento=='***El autor no existe en el sistema***'
      puts elemento
    else
      if elemento[:libros]==0
        tabla = Terminal::Table.new do |t|
        t.title = "Nombre Autor: #{elemento[:nombre]}"
        t.add_row(['El autor no tiene ningun libro'])
      end
        puts tabla
      else
        tope = pila[:tope]
        tabla = Terminal::Table.new do |t|
        t.title = " Autor -#{elemento[:nombre]}-"
        t.headings=(['ISBN','NOMBRE','PRECIO','Unidades'])
    loop do
      if tope[:autor] == elemento[:nombre] && tope[:se_imprime] != 'no'
      t.add_row([
        tope[:ISBN],
        tope[:nombre],
        tope[:precio],
        ver_unidades(pila,tope[:ISBN])

      ])
      if tope[:siguiente] == nil
        break
      end
      tope = tope[:siguiente]
    else
    if tope[:siguiente] == nil
      break
    end
    tope = tope[:siguiente]
  end
      end

        end
        puts tabla
      end

    end
  end

end

#Registro de autor
def nuevo_autor(cola)
  if cola[:max]>0
    if cola[:esta_vacio]            #Verifica si el Autor existe en la Pila
      print 'Ingrese el nombre del autor: '
      nombre_autor = gets.chomp
      autor = {
        nombre:nombre_autor,
        libros: 0,
        siguiente:nil,#cambio
      }
      cola[:tope] = autor
      cola[:final] = autor
      cola[:esta_vacio] = false
      cola[:max]-=1
      cola[:size]+=1
    else                                      #si ya existe mas de algun autor
      print 'Ingrese el nombre del autor: '
      nombre_autor = gets.chomp
      elemento = cola[:tope]
      conta=1
      b=0
      while conta<=cola[:size]                #Verifica si hay autores iguales
        if elemento[:nombre]==nombre_autor
          b+=1
        end
        if conta!=cola[:size]
        nuevo_elemento = elemento[:siguiente]
        elemento = nuevo_elemento
        end
      conta+=1

    end
    if b>0                                 #Cuando se ingresa el mismo autor
      puts 'Existe un Autor con el mismo Nombre'
    else                                      #cuando no existe crea uno nuevo autor
      autor = {
        nombre:nombre_autor,
        libros: 0,
        libros1: nil,
        esta_vacio: true,
        siguiente:nil,
      }
      a = cola[:final]
      a[:siguiente] = autor
      cola[:final] = autor
      cola[:max]-=1
      cola[:size]+=1
    end
    end
  else
    puts "\nLista De Autores Llenas"

  end
end
# Lista de autores
def lista_de_autores(cola,pila)
  if cola[:max]==5
    puts "No se tienen autores registrados"
  else
    tabla = Terminal::Table.new do |t|
    t.title = 'Lista De Autores'
    t.headings = ['Nombre', 'Libros']

    aux = cola[:tope]
    loop do
      siguiente = aux[:siguiente]
      t.add_row([
        aux[:nombre],
        librosporautor(aux[:nombre],pila)
      ])
      if aux[:siguiente] == nil
        break
      end
      aux = aux[:siguiente]
    end
  end
  puts tabla
  end
end
# buscar libro 1
def buscar_libro(pila,isbn)
  libro = pila[:tope] # cambio de puntero
  conta=1
  while conta<=pila[:size]
    if libro[:ISBN]==isbn
      conta=pila[:size]+1
      return libro
    elsif   libro[:siguiente]==nil && libro[:ISBN]!=isbn
      return 'no existe el libro'
      break
    else
      nuevo_elemento = libro[:siguiente]
      libro = nuevo_elemento
      conta+=1
    end
  end
end

#lista de libros
def lista_libros(pila)
  if pila[:tope] == nil
    puts 'No hay libros en el sistema'
  else
  tabla = Terminal::Table.new do |t|
    t.title = 'LISTA DE LIBROS'
    t.headings = ['ISBN', 'Nombre', 'Precio','Autor','Unidades']

    aux = pila[:tope]

    loop do
      if aux[:se_imprime]!='no'
        t.add_row([
          aux[:ISBN],
          aux[:nombre],
          aux[:precio],
          aux[:autor],
          ver_unidades(pila,aux[:ISBN])])
    end
      if aux[:siguiente] == nil
        break
      end
      aux = aux[:siguiente]
    end
  end

  puts tabla
end
end
#BUSCAR UN LIBRO
def buscar_libro1(pila)
  libro = pila[:tope]
  print 'Ingrese el ISBN: '
  isbn = gets.chomp
  conta=1
  b=0
  while conta<=pila[:size]
    if isbn == libro[:ISBN]
      conta=pila[:size]+1
      b=1
    elsif libro[:siguiente]==nil&&libro[:ISBN]!=isbn
      b=0
    else
      libro = libro[:siguiente]
    end
    conta+=1
  end
  if b==1
    limpiar_pantalla
    tabla = Terminal::Table.new do |t|
      t.headings = ['Nombre','Autor','ISBN','Precio','Unidades']
      t.add_row([
        libro[:nombre],
        libro[:autor],
        libro[:ISBN],
        libro[:precio],
        ver_unidades(pila,libro[:ISBN])
      ])
    end
    puts tabla
  else
    limpiar_pantalla
    puts 'El libro que busca no existe en el sistema'
  end

end
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
            pila[:esta_vacio]=false
            pila[:size]+=1
            nodo_autor[:libros]+=1
          else
            print 'Ingrese el ISBN: '
            isbn = gets.chomp
            nodo_libro = buscar_libro(pila,isbn)
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
            tope = pila[:tope]
            libro[:siguiente] = tope
            pila[:tope] = libro
            pila[:size]+=1
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
              tope = pila[:tope]
              libro[:siguiente] = tope
              pila[:tope] = libro
              pila[:size]+=1
              nodo_autor[:libros]+=1
              else
                puts "El ISBN #{isbn} le pertene al  libro -#{nodo_libro[:nombre]}-"
                puts "Perteneciente al autor -#{nodo_libro[:autor]}-"
                puts "Ingrese un ISBN DIFERENTE!!!"
              end

            end

          end
      end
    end

  end


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
            nuevo_autor(cola)
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        when '3'
            puts"Listado de Libros"
            lista_libros(pila)
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        when '4'
            puts"Listado de Autores"
            lista_de_autores(cola,pila)
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        when '5'
            puts"Buscar Libro"
            buscar_libro1(pila)
            #Limpiar pantalla y una pausa
            gets()
            limpiar_pantalla
        when '6'
            puts"Buscar Autor"
            mostrar_autor(cola,pila)
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
