
class DashboardController < ApplicationController
  def index
    usuario_session[:perfil] = current_usuario.perfis.first.authority
    if usuario_session[:perfil] == 'ROLE_PACIENTE'
      redirect_to :action => "paciente"
    end
    if usuario_session[:perfil] == 'ROLE_MEDICO'
      redirect_to :action => "medico"
    end
    if usuario_session[:perfil] == 'ROLE_ATENDENTE'
      redirect_to :action => "atendente"
    end
  end

  def atendente
    @atendimentosAguardandoChegada = Atendimento.busca_atendimentos_por_status(Atendimento::AGUARDANDO_CHEGADA)
    @consultasAguardandoConfirmacao = Consulta.busca_consultas_por_status(Consulta::PENDENTE)
    @atendimentosMes = Atendimento.busca_atendimentos_por_periodo("mes")
    @atendimentosHoje = Atendimento.busca_atendimentos_por_periodo("dia")
    @listaMensagens = Array.new
    @listaTarefas = Array.new
    if(current_usuario != nil)
      @listaMensagens = Mensagem.busca_mensagens(current_usuario)
      @listaTarefas = Tarefa.busca_tarefas_por_status(current_usuario, Tarefa::PENDENTE)
    end
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def medico
    @consultasFinalizadas = Atendimento.buscaAtendimentosMedico(current_usuario, Atendimento::FINALIZADO)
    @proximosAtendimentos = Atendimento.buscaAtendimentosMedico(current_usuario, Atendimento::AGUARDANDO_ATENDIMENTO)
    @listaMensagens = Array.new
    @listaMensagens = Mensagem.busca_mensagens(current_usuario)
    if(@listaMensagens.length() > 4)
      @listaMensagens = @listaMensagens[0..3]
    end
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def paciente
    @consultasNaoConfirmadas = Consulta.buscaConsultasPorUsuario(current_usuario, Consulta::PENDENTE)
    @proximasConsultas = Consulta.buscaConsultasPorUsuario(current_usuario, Consulta::CONFIRMADA)
    @atendimentosAnteriores = Atendimento.buscaAtendimentosAnteriores(current_usuario)
    @graficoAtendimentosAnteriores =  Atendimento.agrupaAtendimentosPorDia(@atendimentosAnteriores)
    @listaMensagens = Array.new
    @listaMensagens = Mensagem.busca_mensagens(current_usuario)
    if(@listaMensagens.length() > 4)
      @listaMensagens = @listaMensagens[0..3]
    end
    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
