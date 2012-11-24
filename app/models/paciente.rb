class Paciente < Usuario
  belongs_to :planoSaude
  belongs_to :consulta
  has_one :atendimento
  attr_accessible :historico, :planoSaude
  
  validates :planoSaude, :presence => true
end

