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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 140) do

  create_table "areas", :force => true do |t|
    t.string   "nome"
    t.integer  "father_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "areas_instituicoes", :id => false, :force => true do |t|
    t.integer "area_id"
    t.integer "instituicao_id"
  end

  create_table "convenios", :force => true do |t|
    t.string   "numero"
    t.integer  "tipo"
    t.integer  "situacao",       :default => 1
    t.date     "inicio"
    t.date     "fim"
    t.integer  "instituicao_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "estagiarios", :force => true do |t|
    t.string   "matricula_grh"
    t.string   "nome"
    t.date     "data_de_nascimento"
    t.string   "cpf"
    t.string   "rg"
    t.string   "orgao_expedidor"
    t.date     "data_de_expedicao"
    t.string   "nacionalidade"
    t.string   "naturalidade"
    t.string   "sexo"
    t.string   "filiacao"
    t.string   "estado_civil"
    t.string   "nome_do_conjuge"
    t.string   "certificado_de_reservista"
    t.string   "titulo_de_eleitor"
    t.string   "cep"
    t.string   "estado"
    t.string   "cidade"
    t.string   "bairro"
    t.string   "rua"
    t.string   "numero"
    t.string   "complemento"
    t.string   "telefone"
    t.string   "celular"
    t.string   "email"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "passaporte"
  end

  create_table "estagios", :force => true do |t|
    t.text     "atividades"
    t.text     "outras_ajudas_de_custo"
    t.date     "data_inicial"
    t.date     "data_final"
    t.boolean  "remunerado"
    t.string   "estagio_supervisionado"
    t.string   "carga_horaria_semanal"
    t.string   "carga_horaria_total"
    t.string   "valor_da_bolsa"
    t.string   "setor"
    t.string   "subsetor"
    t.string   "curso"
    t.string   "matricula"
    t.string   "periodo"
    t.string   "carga_horaria_total_necessaria"
    t.string   "local_estagio_uenf"
    t.string   "departamento"
    t.string   "polo"
    t.string   "diretor"
    t.string   "disponibilidade"
    t.boolean  "obrigatorio"
    t.integer  "grau_ensino"
    t.integer  "termo"
    t.integer  "instituicao_destino_id"
    t.integer  "supervisor_id"
    t.integer  "instituicao_origem_id"
    t.integer  "estagiario_id"
    t.integer  "agente_integracao_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
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
    t.integer  "numero",           :limit => 8
    t.string   "complemento"
    t.string   "telefone"
    t.string   "celular"
    t.string   "fax"
    t.string   "caixa_postal"
    t.string   "email"
    t.string   "site"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "contato_nome"
    t.string   "contato_email"
    t.string   "contato_telefone"
    t.string   "contato_celular"
    t.string   "filiada_a_id"
  end

  create_table "itens_tramitacao", :force => true do |t|
    t.integer  "convenio_id"
    t.date     "data"
    t.string   "origem_do_contato"
    t.string   "forma_de_contato"
    t.text     "descricao"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
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
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
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
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "usuarios", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true

end
