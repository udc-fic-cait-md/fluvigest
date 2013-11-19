# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131118202903) do

  create_table "abonados", force: true do |t|
    t.string   "nombre"
    t.string   "apellidos"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "telefono"
    t.string   "razon_social"
    t.string   "nif"
  end

  create_table "barrios", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calles", force: true do |t|
    t.string   "nombre"
    t.string   "zona"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contadores", force: true do |t|
    t.string   "num_serie"
    t.string   "calibre"
    t.datetime "dt_instalacion"
    t.datetime "dt_retirada"
    t.datetime "dt_revision"
    t.string   "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contratos", force: true do |t|
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.integer  "abonados_id"
    t.integer  "tipo_forma_pagos_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contratos", ["abonados_id"], name: "index_contratos_on_abonados_id", using: :btree
  add_index "contratos", ["tipo_forma_pagos_id"], name: "index_contratos_on_tipo_forma_pagos_id", using: :btree

  create_table "domiciliacions", force: true do |t|
    t.string   "ccc"
    t.string   "titular"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "nif"
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.integer  "contrato_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "domiciliacions", ["contrato_id"], name: "index_domiciliacions_on_contrato_id", using: :btree

  create_table "inmuebles", force: true do |t|
    t.string   "numero"
    t.string   "piso"
    t.string   "portal"
    t.string   "puerta"
    t.string   "nombre"
    t.integer  "orden"
    t.string   "cod_postal"
    t.string   "escalera"
    t.string   "inmueblescol"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
end

ActiveRecord::Schema.define(version: 20131112230901) do

  create_table "facturas", force: true do |t|
    t.text     "descripcion"
    t.string   "periodo"
    t.date     "fecha_emision"
    t.integer  "estado"
    t.string   "detalle_facturacion"
    t.string   "nombre_cliente"
    t.string   "direccion"
    t.integer  "codigo_postal"
    t.string   "poblacion"
    t.string   "provincia"
    t.string   "banco"
    t.string   "numero_cuenta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "modelos_contadores", force: true do |t|
    t.string   "marca"
    t.string   "modelo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "linea_facturas", force: true do |t|
    t.integer  "factura_id"
    t.integer  "numero"
    t.text     "descripcion"
    t.float    "importe"
    t.float    "lectura"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "servicio_contratados", force: true do |t|
    t.integer  "contrato_id"
    t.integer  "tipo_servicio_id"
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.integer  "tipo_tarifa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "servicio_contratados", ["contrato_id"], name: "index_servicio_contratados_on_contrato_id", using: :btree
  add_index "servicio_contratados", ["tipo_servicio_id"], name: "index_servicio_contratados_on_tipo_servicio_id", using: :btree
  add_index "servicio_contratados", ["tipo_tarifa_id"], name: "index_servicio_contratados_on_tipo_tarifa_id", using: :btree

  create_table "tipo_forma_pagos", force: true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_servicios", force: true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "linea_facturas", ["factura_id"], name: "index_linea_facturas_on_factura_id", using: :btree

  create_table "tarifas", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "tipo"
    t.decimal  "precioBasura",     precision: 10, scale: 0
    t.decimal  "precioAlquiler",   precision: 10, scale: 0
    t.boolean  "engancheContador"
  end

  create_table "lecturas", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
