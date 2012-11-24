class Atendimento < ActiveRecord::Base
  AGUARDANDO_CHEGADA = "aguardando_chegada"
  AGUARDANDO_ATENDIMENTO = "aguardando_atendimento"
  EM_ATENDIMENTO = "em_atendimento"
  FINALIZADO = "finalizado"
  
  belongs_to :paciente
  belongs_to :consulta
  has_many :exames, :class_name => "Exame"
  attr_accessible :data, :pago, :precoTotal, :status, :consulta, :paciente
  validates :paciente, :presence => true
  validates :consulta, :presence => true
  # Busca os atendimentos de status espec’fico.
  # @param java.lang.String idPaciente
  # @return List<ddoctor.Atendimento>
  def self.busca_atendimentos_por_status(status)
    atendimentos = joins(:consulta).where("atendimentos.status = ?", status).order("consultas.data desc").limit("4")
    return atendimentos
  end
  
  def self.busca_atendimentos_por_periodo(periodo) 
    dataInicial = Time.now
    dataFinal = DateTime.now.change(:hour => 23, :min => 59, :sec => 59)
    case periodo
      when "dia"
        dataFinal += 1
      when "semana"
        dataFinal += 7
      when "mes"
        dataFinal = dataFinal >> 1
      else 
        logger.info "default...."
    end
    atendimentos = where(:data => dataInicial..dataFinal)
    return atendimentos
  end
  
  # Cria um novo atendimento com o status AGUARDANDO_CHEGADA, baseado na consulta recebida.
  # @param ddoctor.Consulta
  # @return ddoctor.Atendimento
  def self.criaAtendimento(consulta)
    atendimento = Atendimento.new
    atendimento.paciente = consulta.paciente
    atendimento.status = Atendimento::AGUARDANDO_CHEGADA
    atendimento.pago = true #assumir que a consulta s— Ž criada depois de paga.
    atendimento.precoTotal = consulta.medico.precoConsulta
    atendimento.consulta = consulta
    atendimento.save!
    return atendimento
  end
  
  # Busca o historico de atendimentos do paciente.
  # @param ddoctor.usuario.Usuario
  # @param org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap
  # @return List<Atendimento>
  def self.buscaAtendimentosAnteriores(usuario)
    listaAtendimentos = Array.new
    listaAtendimentos = Atendimento.where("paciente_id = ? and status = ?", usuario.id, Atendimento::FINALIZADO).order("data asc")
    return listaAtendimentos
  end
  
  # Agrupa os valores de atendimentos anteriores por dia
  # @param java.util.ArrayList<atendimentos>
  # @return List<ddoctor.Atendimento>
  def self.agrupaAtendimentosPorDia(atendimentos)
    atendimentosInfo = Array.new
    set = Set.new
    var = atendimentos.collect{|a| a.data.to_date}
    set.merge(var)
    
    set.each() {|dia|
      atendimentosDia = atendimentos.find_all{|atendimento| atendimento.data.to_date == dia } #atendimentos.findAll{it.data.date == dia}
      valor = 0.0
      for atendimento in atendimentosDia
        data = atendimento.data
        valor += atendimento.precoTotal
      end
      atendimentoInfo = Hash.new
      atendimentoInfo[:data] = data
      atendimentoInfo[:valor] = valor
      atendimentosInfo.push(atendimentoInfo)
    }
    return atendimentosInfo 
  end
  
  def self.buscaAtendimentosMedico(medico, status) 
    @atendimentos = Array.new
    @atendimentos = Atendimento.joins(:consulta).select("atendimentos.*").where("consultas.medico_id = ? and atendimentos.status = ?", medico.id, status)
    return @atendimentos
  end
  
  # Busca os atendimentos de um paciente espec’fico.
  # @param java.lang.String idPaciente
  # @return List<ddoctor.Atendimento>
  def self.buscaAtendimentosPorPaciente(idPaciente) 
    @atendimentos = Array.new
    @atendimentos = Atendimento.joins(:consulta).select("atendimentos.*").where("consultas.paciente_id = ? and atendimentos.status = ?", idPaciente, Atendimento::AGUARDANDO_CHEGADA).order("consultas.data desc").limit("4")
    return @atendimentos
  end
  
end