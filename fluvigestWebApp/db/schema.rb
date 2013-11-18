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

end
