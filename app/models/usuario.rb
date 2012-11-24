class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :ativo, :contaBloqueada, :contaExpirada, :dataNascimento, :documento, :idade, :nome, :senhaExpirada, :sexo, :telefone
  has_one :endereco
  has_many :tarefas, :class_name => "Tarefa"
  has_and_belongs_to_many :perfis, :class_name => "Perfil"
end
