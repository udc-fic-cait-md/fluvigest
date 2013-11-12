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

ActiveRecord::Schema.define(version: 20131112230901) do

  create_table "facturas", force: true do |t|
    t.text     "descripcion"
    t.datetime "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "linea_facturas", force: true do |t|
    t.integer  "factura_id"
    t.integer  "numero"
    t.text     "descripcion"
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

end
