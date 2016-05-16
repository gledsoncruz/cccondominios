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

ActiveRecord::Schema.define(version: 20160516193635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocos", force: :cascade do |t|
    t.integer  "condominio_id"
    t.string   "descricao",     limit: 80,  null: false
    t.string   "sigla",         limit: 10,  null: false
    t.string   "obs",           limit: 200
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "blocos", ["condominio_id"], name: "index_blocos_on_condominio_id", using: :btree

  create_table "condominios", force: :cascade do |t|
    t.string   "nome"
    t.string   "cnpj"
    t.string   "endereco"
    t.string   "cidade"
    t.string   "uf"
    t.string   "cep"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unidades", force: :cascade do |t|
    t.integer  "bloco_id"
    t.string   "numero",     limit: 5,  null: false
    t.string   "piso",       limit: 10, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "unidades", ["bloco_id"], name: "index_unidades_on_bloco_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "username",               limit: 80
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "blocos", "condominios"
  add_foreign_key "unidades", "blocos"
end
