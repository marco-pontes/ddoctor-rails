class Especialidade < ActiveRecord::Base
  attr_accessible :descricao, :nome
  has_one :medico
end
