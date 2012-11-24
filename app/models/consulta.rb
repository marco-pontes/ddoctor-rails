class Consulta < ActiveRecord::Base
  CONFIRMADA = "confirmada"
  CANCELADA = "cancelada"
  PENDENTE = "pendente"
  FINALIZADA = "finalizada"

  belongs_to :medico
  belongs_to :paciente
  belongs_to :agenda
  has_one :atendimento
  belongs_to :entrevistaMedica
  attr_accessible :data, :status, :paciente, :medico
  validates :medico, :presence => true
  validates :paciente, :presence => true
  validates :data, :presence => true
  # Busca todas as consultas de um determinado status.
  # @return Consulta
  def self.busca_consultas_por_status(status)
    @consultas = where(:status => status)
    return @consultas
  end

  # Cria uma consulta, manda mensagens de aviso e cria tarefas para confirmação recebendo params.
  # @param java.util.Map
  # @return ddoctor.Consulta
  def self.criaConsulta(params, status, usuario)
    medicoId = params[:medico][:id]
    pacienteId = params[:paciente][:id]
    filtroMedico = medicoId.is_i? && medicoId != "-1"
    filtroPaciente = pacienteId.is_i?
    @consulta = Consulta.new
    if(filtroMedico && filtroPaciente)
      @medico = Medico.find(medicoId)
      @paciente = Paciente.find(pacienteId)
      @consulta.medico = @medico
      @consulta.paciente = @paciente
    end
    @consulta.status = status
    if(!params[:data].blank?)
      @consulta.data = DateTime.strptime(params[:data], '%d/%m/%Y %H:%M').to_time #Time.zone.parse(params[:atendimento][:consulta][:data]) #DateTime.strptime('30/07/2012 10:00', '%d-%m-%Y %H:%M').to_time
    end
    if(@medico && @consulta)
      if(isConsultaDuplicada(@medico, @paciente))
        raise ConsultationLimitException, "O paciente #{@paciente.nome} já tem uma consulta marcada com o médico #{@medico.nome}"
      end
    end
    if(@consulta.save)
      @medico.agenda.consultas << @consulta
      Mensagem.consultaMarcada(@medico, usuario)
      if(status == Consulta::PENDENTE)
        Tarefa.criaTarefaConfirmacaoConsulta(@medico, @consulta)
      end
      for atendente in Atendente.find(:all) do
        Mensagem.consultaMarcada(atendente, usuario)
        if(status == Consulta::PENDENTE)
          Tarefa.criaTarefaConfirmacaoConsulta(atendente, @consulta)
        end
      end
    end
    return @consulta
  end

  # Usado para buscar os atendimentos de um paciente e um médico específico, com status confirmado ou pendente.
  # Usado para evitar a duplicação de consultas.
  # @return {@link List}<{@link ddoctor.Consulta}>
  def self.buscaConsultas(medico, paciente)
    consultas = Array.new
    start = Time.now
    consultas = Consulta.where("medico_id = ? and paciente_id = ? and (status = ? or status = ?)",
    medico.id, paciente.id, Consulta::PENDENTE, Consulta::CONFIRMADA)
    puts Time.now - start
    return consultas
  end

  # Usada para verificar se o paciente ja marcou uma consulta com um médico especifico.
  # @return Boolean
  def self.isConsultaDuplicada(medico, paciente)
    consultasMarcadas = Consulta.buscaConsultas(medico, paciente)
    if(consultasMarcadas.empty?)
    return false
    else
    return true
    end
  end
  
  # Busca todas as consultas de um usuario e status específico.
  # @return List<ddoctor.Consulta>
  def self.buscaConsultasPorUsuario(usuario, status)
    consultas = Array.new
    consultas = Consulta.where("paciente_id = ? and status = ?", usuario.id, status)
    return consultas
  end

end
