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

ActiveRecord::Schema.define(:version => 20111026043223) do

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

  create_table "competencia", :force => true do |t|
    t.string   "nombre"
    t.date     "fecha"
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
    t.boolean  "show_or_wait"
  end

  create_table "nadadors", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.date     "fecha_nacimiento"
    t.string   "club"
    t.string   "sexo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partidas", :force => true do |t|
    t.integer  "competencia_id"
    t.boolean  "show_or_wait"
    t.boolean  "partida_rapida"
    t.string   "tipo_prueba"
    t.string   "distancia"
    t.integer  "nadador_id_1"
    t.string   "tiempo_1"
    t.integer  "nadador_id_2"
    t.string   "tiempo_2"
    t.integer  "nadador_id_3"
    t.string   "tiempo_3"
    t.integer  "nadador_id_4"
    t.string   "tiempo_4"
    t.integer  "nadador_id_5"
    t.string   "tiempo_5"
    t.integer  "nadador_id_6"
    t.string   "tiempo_6"
    t.integer  "nadador_id_7"
    t.string   "tiempo_7"
    t.integer  "nadador_id_8"
    t.string   "tiempo_8"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
