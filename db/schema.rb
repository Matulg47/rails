# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "timescaledb"
  create_table "cakes", force: :cascade do |t|
    t.string "tamaño"
    t.string "nombre"
    t.integer "precio"
    t.string "descripcion"
    t.integer "pedido_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer "cantidad"
    t.float "precio_final"
    t.string "a_nombre_de"
    t.date "fecha_de_entrega"
    t.string "producto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tortas", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.string "tamaño"
    t.integer "precio"
    t.integer "pedido_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
