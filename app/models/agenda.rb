class Agenda < ActiveRecord::Base
  has_many :consultas
  belongs_to :medico
  attr_accessible :consultas
end
