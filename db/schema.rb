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

ActiveRecord::Schema.define(:version => 20121102230212) do

  create_table "agendas", :force => true do |t|
    t.integer  "medico_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "atendentes", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "turno"
  end

  create_table "atendimentos", :force => true do |t|
    t.string   "status"
    t.boolean  "pago"
    t.float    "precoTotal"
    t.integer  "paciente_id"
    t.integer  "consulta_id"
    t.datetime "data"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "atendimentos", ["consulta_id"], :name => "index_atendimentos_on_consulta_id"
  add_index "atendimentos", ["paciente_id"], :name => "index_atendimentos_on_paciente_id"

  create_table "consultas", :force => true do |t|
    t.integer  "agenda_id"
    t.datetime "data"
    t.string   "status"
    t.integer  "entrevistaMedica_id"
    t.integer  "medico_id"
    t.integer  "paciente_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "consultas", ["agenda_id"], :name => "index_consultas_on_agenda_id"
  add_index "consultas", ["entrevistaMedica_id"], :name => "index_consultas_on_entrevistaMedica_id"

  create_table "enderecos", :force => true do |t|
    t.string   "rua"
    t.string   "cep"
    t.integer  "numero"
    t.string   "complemento"
    t.string   "cidade"
    t.string   "estado"
    t.integer  "usuario_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "enderecos", ["usuario_id"], :name => "index_enderecos_on_usuario_id"

  create_table "entrevista_medicas", :force => true do |t|
    t.string   "problema"
    t.string   "medicacao"
    t.string   "observacoes"
    t.string   "laudoMedico"
    t.string   "altura"
    t.string   "peso"
    t.string   "pressao"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "especialidades", :force => true do |t|
    t.string   "nome"
    t.string   "descricao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "exames", :force => true do |t|
    t.string   "nome"
    t.string   "descricao"
    t.float    "preco"
    t.integer  "atendimento_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "exames", ["atendimento_id"], :name => "index_exames_on_atendimento_id"

  create_table "medicacoes", :force => true do |t|
    t.string   "nome"
    t.string   "tarja"
    t.string   "bula"
    t.integer  "quantidade"
    t.string   "unidade"
    t.string   "fabricante"
    t.datetime "data_compra"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "mensagens", :force => true do |t|
    t.integer  "destinatario_id"
    t.integer  "remetente_id"
    t.string   "assunto"
    t.string   "tipo"
    t.string   "corpo"
    t.datetime "dataEnvio"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "mensagens", ["destinatario_id"], :name => "index_mensagens_on_destinatario_id"
  add_index "mensagens", ["remetente_id"], :name => "index_mensagens_on_remetente_id"

  create_table "perfis", :force => true do |t|
    t.string   "authority"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "perfis_usuarios", :id => false, :force => true do |t|
    t.integer "usuario_id", :null => false
    t.integer "perfil_id",  :null => false
  end

  add_index "perfis_usuarios", ["perfil_id"], :name => "index_perfis_usuarios_on_perfil_id"
  add_index "perfis_usuarios", ["usuario_id"], :name => "index_perfis_usuarios_on_usuario_id"

  create_table "planos_saude", :force => true do |t|
    t.string   "nome"
    t.string   "tipo"
    t.datetime "validade"
    t.integer  "numero"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tarefas", :force => true do |t|
    t.string   "nome"
    t.string   "descricao"
    t.string   "status"
    t.integer  "consulta_id"
    t.integer  "usuario_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "tarefas", ["consulta_id"], :name => "index_tarefas_on_consulta_id"
  add_index "tarefas", ["usuario_id"], :name => "index_tarefas_on_usuario_id"

  create_table "usuarios", :force => true do |t|
    t.boolean  "ativo"
    t.boolean  "contaExpirada"
    t.boolean  "contaBloqueada"
    t.boolean  "senhaExpirada"
    t.string   "nome"
    t.integer  "idade"
    t.string   "documento"
    t.string   "telefone"
    t.string   "sexo"
    t.string   "dataNascimento"
    t.string   "type"
    t.string   "historico"
    t.integer  "crm"
    t.string   "biografia"
    t.integer  "especialidade_id"
    t.integer  "planoSaude_id"
    t.float    "precoConsulta"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
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
  end

  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["especialidade_id"], :name => "index_usuarios_on_especialidade_id"
  add_index "usuarios", ["planoSaude_id"], :name => "index_usuarios_on_planoSaude_id"
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true

end
