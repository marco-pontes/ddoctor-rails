class Medicacao < ActiveRecord::Base
  attr_accessible :bula, :data_compra, :fabricante, :nome, :quantidade, :tarja, :unidade
end
