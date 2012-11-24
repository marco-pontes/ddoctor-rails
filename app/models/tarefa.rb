class Tarefa < ActiveRecord::Base
  
  PENDENTE = "pendente"
  RECUSADA = "recusada"
  ACEITA = "aceita"
  FINALIZADA = "finalizada"
  
  
  belongs_to :consulta
  belongs_to :usuario
  attr_accessible :descricao, :nome, :status, :created_at, :consulta, :usuario
  
  # Usada para recuperar as tarefas de um determinado status.
  # @param ddoctor.usuario.Usuario
  # @param {@link ddoctor.StatusTarefa}
  # @return {@link List}<Tarefa>
  def self.busca_tarefas_por_status(usuario, status)
    lista_tarefas = where("status = ? and usuario_id = ?", status, usuario.id).order("created_at desc").limit("4")
    return lista_tarefas
  end
  
  # Usada para criar uma tarefa de copnfirma‹o de consulta para um atendente.
  # @param {@link ddoctor.usuario.Usuario}
  # @param {@link ddoctor.Consulta}
  def self.criaTarefaConfirmacaoConsulta(usuario, consulta) 
    @tarefa = Tarefa.new
    @tarefa.nome = "Confirmar Nova Consulta"
    @tarefa.status = Tarefa::PENDENTE
    @tarefa.descricao = "Existe uma nova consulta marcada por um paciente e precisa ser confirmada."
    @tarefa.consulta = consulta
    @tarefa.save!
    usuario.tarefas << @tarefa
    end 
end
