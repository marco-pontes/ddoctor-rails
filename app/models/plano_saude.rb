class PlanoSaude < ActiveRecord::Base
  attr_accessible :nome, :numero, :tipo, :validade
  has_one :paciente
end
