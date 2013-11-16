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

ActiveRecord::Schema.define(version: 20131116211023) do

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

  create_table "modelos_contadores", force: true do |t|
    t.string   "marca"
    t.string   "modelo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
