class EntrevistaMedica < ActiveRecord::Base
  attr_accessible :altura, :laudoMedico, :medicacao, :observacoes, :peso, :pressao, :problema
  has_one :consulta
end
