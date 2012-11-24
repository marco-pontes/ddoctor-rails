class Mensagem < ActiveRecord::Base
  SUCESSO = "sucesso"
  INFO = "info"
  ATENCAO = "atencao"
  ERRO = "erro"
  
  attr_accessible :assunto, :corpo, :destinatario, :remetente, :tipo, :destinatario_id, :dataEnvio
  belongs_to :destinatario, :class_name => "Usuario"
  belongs_to :remetente, :class_name => "Usuario"
  
  # MŽtodo chamado para buscar mensagens de um usu‡rio.
  # @param ddoctor.usuario.Usuario
  # @return ArrayList<Atendimento>
  def self.busca_mensagens(usuario)
    mensagens = Array.new
    mensagens = where(:destinatario_id => usuario.id).limit("4")
    return mensagens
  end

  # MŽtodo usado para criar uma mensagem para avisar o atendente
  # de que uma nova consulta foi marcada por um usu‡rio.
  # @param {@link ddoctor.usuario.Usuario} destinatario
  def self.consultaMarcada(destinatario, usuario)
    mensagemInstancia = Mensagem.new
    mensagemInstancia.destinatario = destinatario
    mensagemInstancia.remetente = usuario
    mensagemInstancia.assunto = "Nova Consulta Marcada"
    mensagemInstancia.tipo = Mensagem::INFO
    mensagemInstancia.corpo = "Nova consulta incluida no sistema"
    mensagemInstancia.dataEnvio  = DateTime.now
    mensagemInstancia.save!
  end
  
  # MŽtodo usado para criar uma mensagem para informar o usu‡rio
  # sobre o cancelamento de uma consulta.
  # @param {@link ddoctor.Consulta} consulta
  def self.consultaCancelada(consulta, usuario) 
    @mensagem = Mensagem.new
    @mensagem.destinatario = consulta.paciente
    @mensagem.remetente = usuario
    @mensagem.assunto = "Consulta nao confirmada"
    @mensagem.tipo = Mensagem::INFO
    dataFormatada = I18n.localize(consulta.data, :format => :date)
    @mensagem.corpo = """A consulta marcada para o dia  #{dataFormatada}
                  foi cancelada no sistema!
                  Marque a consulta em uma outra data ou ligue para a clinica para agendar um novo horario."""
    @mensagem.dataEnvio  = DateTime.now
    @mensagem.save!
  end 
  
  # MŽtodo usado para criar uma mensagem para informar o usu‡rio
  # sobre a confirma‹o de uma consulta.
  # @param {@link ddoctor.Consulta} consulta
  def self.consultaConfirmada(consulta, usuario)
    @mensagem = Mensagem.new
    @mensagem.destinatario = consulta.paciente
    @mensagem.remetente = usuario
    @mensagem.assunto = "A Sua Consulta Foi Confirmada!"
    @mensagem.tipo = Mensagem::INFO
    dataFormatada = I18n.localize(consulta.data, :format => :date)
    horaFormatada = I18n.localize(consulta.data, :format => :time)
    @mensagem.corpo = """A consulta marcada para o dia  #{dataFormatada}
                  foi confirmada no sistema!
                  Compareca na clinica no dia #{dataFormatada} as #{horaFormatada}
                  para realizar a consulta com o medico #{consulta.medico.nome}."""
    @mensagem.dataEnvio  = DateTime.now
    @mensagem.save!
  end
  
end
