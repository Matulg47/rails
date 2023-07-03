# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)#usuario= User.find_or_create_by(nombre: "matu");#

#pedido1 = Pedido.find_or_create_by(producto: "torta", descripcion: "torta de chocolate")#, user_id: 0)

pedido_prueba = Pedido.find_or_create_by(producto: "torta")#, descripcion: "torta de chocolate", user_id:nil)#, user_id: 0)


#aca arranco a cargar las tortas
tort1=Torta.find_or_create_by(nombre: "Marquise Frutos Rojos", descripcion: "Brownie + dulce de leche + crema + frutos rojos", tamaño: nil, precio: nil, pedido_id: pedido_prueba.id)
tort2=Torta.find_or_create_by(nombre: "Marquise Oreo", descripcion:" Brownie + dulce de leche + crema oreo + merengue italiano", tamaño: nil, precio: nil, pedido_id: pedido_prueba.id)
tort3=Torta.find_or_create_by(nombre: "Marquise Praline", descripcion:" Brownie + dulce de leche + crema con nueces caramelizadas + merengue italiano", tamaño: nil, precio: nil, pedido_id: pedido_prueba.id)
tort4=Torta.find_or_create_by(nombre: "Cheesecake de frutos rojos", descripcion:" falta descriocion" ,tamaño: nil, precio: nil, pedido_id: pedido_prueba.id)
