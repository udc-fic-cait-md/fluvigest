# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

abonados = Abonado.create([
  {nombre: 'Pepe', apellidos: 'Pérez González', telefono: '981666666', razon_social: 'Ni idea', nif: '12345678Y'},
  {nombre: 'Juan', apellidos: 'Castiñeiras Castiñeiras', telefono: '667142283', nif: '31415926K'},
  {nombre: 'Sandra', apellidos: 'Pitesti Vieites', telefono: '666666666', razon_social: 'Mafiosillas S.A.', nif: '00000000N'}
])

tipo_forma_pagos = TipoFormaPago.create([
  {nombre: 'Efectivo', descripcion: 'Pago en efectivo en ventanilla'},
  {nombre: 'Domiciliacion bancaria', descripcion: 'Pago periódico automático mediante domiciliación bancaria'}
])

tipo_servicios = TipoServicio.create([
  {nombre: 'Agua doméstica'},
  {nombre: 'Basura doméstica'},
  {nombre: 'Alcantarillado doméstico'},
  {nombre: 'Agua empresarial'},
  {nombre: 'Basura empresarial'},
  {nombre: 'Alcantarillado empresrial'},
  {nombre: 'Agua industrial'},
  {nombre: 'Basura industral'},
  {nombre: 'Alcantarillado industrial'},
])

usuario = Usuario.create([
{usuario: 'revisor', nombre:'nombre1'}
])
