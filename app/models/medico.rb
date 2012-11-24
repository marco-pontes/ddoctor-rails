class Medico < Usuario
  belongs_to :especialidade
  has_one :agenda
  belongs_to :consulta
  attr_accessible :biografia, :crm, :precoConsulta, :especialidade, :agenda

  validates :especialidade, :presence => true
  validates :agenda, :presence => true
  validates :precoConsulta, :presence => true
  
  def self.buscaEspecialidadesComMedicos
    especialidades = Array.new
    especialidades = Especialidade.joins(:medico).select("distinct especialidades.id, especialidades.nome")
    return especialidades
  end

end
