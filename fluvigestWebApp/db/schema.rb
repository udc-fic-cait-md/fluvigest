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

ActiveRecord::Schema.define(version: 20131120115246) do

  create_table "abonados", force: true do |t|
    t.string   "nombre"
    t.string   "apellidos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lecturas", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "lectura"
    t.string   "incidencia"
    t.datetime "fecha"
    t.float    "lectura_anterior"
    t.integer  "usuarios_id"
    t.integer  "contadores_id"
    t.integer  "tincidencias_id"
  end

  create_table "usuarios", force: true do |t|
    t.string   "usuario"
    t.string   "password"
    t.datetime "fechacreacion"
    t.string   "nombre"
    t.string   "apellidos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
