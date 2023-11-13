# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)#usuario= User.find_or_create_by(nombre: "matu");#

#pedido1 = Pedido.find_or_create_by(producto: "torta", descripcion: "torta de chocolate")#, user_id: 0)

pedido_prueba = Pedido.find_or_create_by(producto: "torta")#, descripcion: "torta de chocolate", user_id:nil)#, user_id: 0)



Precio.find_or_create_by(nombre:"Marquise Frutos Rojos", precioC: 1600,precioM:5900 ,precioG:7900)
Precio.find_or_create_by(nombre:"Marquise Oreo", precioC: 1600,precioM:5900 ,precioG:7900)
Precio.find_or_create_by(nombre:"Marquise Praline", precioC: 1600,precioM:5900 ,precioG:7900)
Precio.find_or_create_by(nombre:"Cheesecake Frutos Rojos", precioC: 1600,precioM:5900 ,precioG:7900)
Precio.find_or_create_by(nombre:"Marquise Clásica", precioC: 1400,precioM:5400 ,precioG:6400)
Precio.find_or_create_by(nombre:"Marquise Ferrero", precioC: 2000,precioM:7500 ,precioG:9000)
Precio.find_or_create_by(nombre:"Rogel", precioC: 1700,precioM:6100 ,precioG:7900)
Precio.find_or_create_by(nombre:"Lemon Pie", precioM:2600 ,precioG:6600)
Precio.find_or_create_by(nombre:"Tarta Tofi", precioM:2600 ,precioG:6600)
Precio.find_or_create_by(nombre:"Tarta Tofi con Oreos", precioM:2600 ,precioG:6600)
Precio.find_or_create_by(nombre:"Tarta de Ricota", precioM:2600 ,precioG:6600)
Precio.find_or_create_by(nombre:"Crumble de Manzana", precioM:2600 ,precioG:6600)
Precio.find_or_create_by(nombre:"Tarta de Ricota y Frambuesas", precioM:2800 ,precioG:6800)
Precio.find_or_create_by(nombre:"Tarta de Coco",precioM:2100 ,precioG:4500)
Precio.find_or_create_by(nombre:"Pasta Frolla de Membrillo o Batata",precioM:2100 ,precioG:4500)
Precio.find_or_create_by(nombre:"Tarta de Maracuyá y Frambuesa", precioG:9000)
Precio.find_or_create_by(nombre:"Budín de Limón y Frutos Rojos", precioC: 1700,precioG:2900)
Precio.find_or_create_by(nombre:"Budín de Banana, Chocolate y Nueces", precioC: 1500,precioG:2600)
Precio.find_or_create_by(nombre:"Budín de Vainilla y Chips de Chocolate", precioC: 1500,precioG:2600)
Precio.find_or_create_by(nombre:"Budín de Limón", precioC: 1500,precioG:2600)
Precio.find_or_create_by(nombre:"Budín de Banana y Dulce de Leche", precioC: 1500,precioG:2600)
Precio.find_or_create_by(nombre:"Streusel Ula Hua", precioC: 1000,precioG:3800)
Precio.find_or_create_by(nombre:"Brownie", precioC: 500)
Precio.find_or_create_by(nombre:"Brownie con Oreos", precioC: 550)
Precio.find_or_create_by(nombre:"Brownie con Nueces", precioC: 550)
Precio.find_or_create_by(nombre:"Cookies de Vainilla y Chips de Chocolate", precioC: 400,precioM:1300 ,precioG:2300)
Precio.find_or_create_by(nombre:"Cookies de Limón y Almendras", precioC: 400,precioM:1300 ,precioG:2300)
Precio.find_or_create_by(nombre:"Cookies de Chocolate y Chips de Chocolate Blanco", precioC: 450,precioM:1450 ,precioG:2600)
Precio.find_or_create_by(nombre:"Alfajor de Maicena", precioC: 650,precioG:2400)
Precio.find_or_create_by(nombre:"Macaron", precioC:850,precioM:2500)
Precio.find_or_create_by(nombre:"Chipá", precioC:950)
Precio.find_or_create_by(nombre:"Chips de Jamón y Queso",precioC:1000)
Precio.find_or_create_by(nombre:"Panera de Papel con Pan Integral o Común Casero",precioC:400)
Precio.find_or_create_by(nombre:"Panera de Papel con Tostadas Varias de Pan Integral de Masa Madre y Pan Común",precioC:300)
Precio.find_or_create_by(nombre:"Mermelada de Frutos Rojos x 30g",precioC:450)
Precio.find_or_create_by(nombre:"Queso Crema x 30g",precioC:400)
Precio.find_or_create_by(nombre:"Manteca x 2 Unidades de 20g",precioC:250)
Precio.find_or_create_by(nombre:"Jugo Exprimido de Naranja (360cc) en Frasco con Cartelito con Nombre",precioC:1300)
Precio.find_or_create_by(nombre:"Bandeja de cartón con visor (incluye flores, velita y tarjeta con dedicatoria)",precioC:950)
Precio.find_or_create_by(nombre:"Bandeja de Madera chica (incluye flores, velita y tarjeta con dedicatoria)",precioC:2600)
Precio.find_or_create_by(nombre:"Bandeja de Madera grande (incluye flores, velita y tarjeta con dedicatoria)",precioC:3700)

