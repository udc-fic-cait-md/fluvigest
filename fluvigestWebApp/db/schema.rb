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

ActiveRecord::Schema.define(version: 20131119031542) do

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
    t.string   "dni"
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

  add_index "linea_facturas", ["factura_id"], name: "index_linea_facturas_on_factura_id", using: :btree

  create_table "tarifas", force: true do |t|
    t.float    "precio"
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.integer  "tipo_tarifa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_tarifas", force: true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.integer  "tipo_servicio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
