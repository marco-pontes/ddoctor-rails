class Perfil < ActiveRecord::Base
  attr_accessible :authority
  has_and_belongs_to_many :usuarios
end
