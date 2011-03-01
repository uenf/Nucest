# -*- encoding : utf-8 -*-
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

ActiveRecord::Schema.define(:version => 40) do

  create_table "areas", :force => true do |t|
    t.string   "nome"
    t.integer  "father_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instituicoes", :force => true do |t|
    t.string   "nome"
    t.string   "origem"
    t.string   "pais"
    t.string   "registro_local"
    t.string   "cnpj"
    t.string   "sigla"
    t.integer  "tipo"
    t.string   "razao_social"
    t.integer  "tipo_de_convenio"
    t.string   "cep"
    t.string   "estado"
    t.string   "cidade"
    t.string   "bairro"
    t.string   "rua"
    t.integer  "numero"
    t.string   "complemento"
    t.string   "telefone"
    t.string   "celular"
    t.string   "fax"
    t.string   "caixa_postal"
    t.string   "email"
    t.string   "site"
    t.date     "inicio_do_convenio"
    t.date     "fim_do_convenio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "representantes", :force => true do |t|
    t.string   "nome"
    t.string   "funcao"
    t.string   "rg"
    t.string   "orgao_expedidor"
    t.string   "cpf"
    t.string   "telefone"
    t.string   "celular"
    t.string   "email"
    t.integer  "instituicao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supervisores", :force => true do |t|
    t.string   "nome"
    t.string   "lotacao"
    t.string   "matricula"
    t.string   "funcao"
    t.string   "telefone"
    t.string   "celular"
    t.string   "email"
    t.integer  "instituicao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
