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

ActiveRecord::Schema[7.0].define(version: 2022_09_12_054236) do
  create_table "instituicaos", force: :cascade do |t|
    t.string "nome"
    t.string "sigla"
    t.integer "codigo"
    t.integer "pai"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "natureza"
    t.string "administracao"
  end

  create_table "uorgs", force: :cascade do |t|
    t.string "nome"
    t.string "sigla"
    t.integer "codigo"
    t.integer "pai"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "instituicao_id"
    t.index ["instituicao_id"], name: "index_uorgs_on_instituicao_id"
  end

end
