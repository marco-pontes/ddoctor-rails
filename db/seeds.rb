# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

@perfil = Perfil.new(:authority => 'ROLE_ATENDENTE')
@perfil2 = Perfil.new(:authority => 'ROLE_MEDICO')
@perfil3 = Perfil.new(:authority => 'ROLE_PACIENTE')
@atendente = Atendente.new(:nome => 'atendente', :email => 'atendente@ddoctor.com', :password => "password", :password_confirmation => 'password')
@atendente.perfis << @perfil
@atendente.save!

@especialidade = Especialidade.new(:nome => "Neurologista", :descricao=> "Descricao")
@especialidade.save!

@agenda = Agenda.new()
@agenda.save!

@medico = Medico.new(:nome => 'medico', :email => 'medico@ddoctor.com', :password => "password", :password_confirmation => 'password', :agenda => @agenda, :especialidade => @especialidade, :precoConsulta => 125.0)
@medico.perfis << @perfil2
@medico.save!

@planoSaude = PlanoSaude.new(:nome => "Unimed", :tipo =>"Completo", :validade => DateTime.now, :numero => 32462347)
@planoSaude.save!

@paciente = Paciente.new(:nome => 'paciente', :email => 'paciente@ddoctor.com', :password => "password", :password_confirmation => 'password', :documento => "236236723", :planoSaude => @planoSaude)
@paciente.perfis << @perfil3
@paciente.save!

@paciente2 = Paciente.new(:nome => 'paciente 2', :email => 'paciente2@ddoctor.com', :password => "password", :password_confirmation => 'password', :documento => "236236723", :planoSaude => @planoSaude)
@paciente2.perfis << @perfil3
@paciente2.save!

@agenda2 = Agenda.new()
@agenda2.save!

@medico2 = Medico.new(:nome => 'medico 2', :email => 'medico2@ddoctor.com', :password => "password", :password_confirmation => 'password', :agenda => @agenda2, :especialidade => @especialidade, :precoConsulta => 140.0)
@medico2.perfis << @perfil2
@medico2.save!

#@consulta = Consulta.new(:medico => @medico, :paciente => @paciente, :status => Consulta::CONFIRMADA, :data => DateTime.now)
#@consulta.save!

#@agenda.consultas << @consulta
#@agenda.save!

#@exame = Exame.new(:nome => 'Exame', :preco => 145.50, :descricao => "Exame")
#@exame.save!

#@atendimento = Atendimento.new(:paciente => @paciente, :consulta => @consulta, :data => DateTime.now, :pago => true, :precoTotal => 150.40, :status => Atendimento::AGUARDANDO_ATENDIMENTO)
#@atendimento.save!

#@tarefa =  Tarefa.new(:consulta => @consulta, :usuario => @atendente, :descricao => "Voce deve fazer isso", :nome => "Tarefa 1", :status => Tarefa::PENDENTE)
#@tarefa.save!
