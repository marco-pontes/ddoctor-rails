class Endereco < ActiveRecord::Base
  belongs_to :usuario
  attr_accessible :cep, :cidade, :complemento, :estado, :numero, :rua
end
