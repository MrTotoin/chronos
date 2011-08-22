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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110822035108) do

  create_table "borradors", :force => true do |t|
    t.integer  "nadador_id"
    t.string   "tipo_prueba"
    t.decimal  "tiempo"
    t.integer  "distancia"
    t.boolean  "competencia"
    t.boolean  "borrar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entrenamientos", :force => true do |t|
    t.integer  "nadador_id"
    t.string   "tipo_prueba"
    t.string   "distancia"
    t.decimal  "tiempo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nadadors", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "fecha_nacimiento"
    t.string   "club"
    t.string   "sexo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
