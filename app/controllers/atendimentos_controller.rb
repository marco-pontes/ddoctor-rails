class AtendimentosController < ApplicationController
  # GET /atendimentos
  # GET /atendimentos.json
  def index
    params[:max] = params[:max] ? params[:max].to_i : 10
    params[:offset] = params[:offset] ? params[:offset].to_i : 0
    @atendimentos = Atendimento.all(:offset => params[:offset], :limit => params[:max])
    @totalAtendimentos = Atendimento.count
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @atendimentos }
    end
  end
  
  def confirmarChegada
    @atendimento = Atendimento.find(params[:atendimento_id])
    result = Hash.new
    @atendimento.status = Atendimento::AGUARDANDO_ATENDIMENTO
    @atendimento.data = DateTime.now
    @atendimento.save!
    flash[:mensagem] = Hash.new
    flash[:mensagem][:tipo] = Constantes::MENSAGEM_SUCESSO
    flash[:mensagem][:texto] = t :atendimento_confirmado_message
    result.status = Constantes::SUCESSO
    render :json => result
  end
  
  def buscaAtendimentosPorPaciente
    @atendimentosAguardandoChegada = Atendimento.buscaAtendimentosPorPaciente(params[:paciente_id].to_i)
    render :partial => "listaAtendimentos"
  end
  
    # GET /atendimentos
  # GET /atendimentos.json
  def inicializaModal
    @atendimento = Atendimento.new
    @consulta = Consulta.new
    flash[:mensagem] = nil
    render :partial => "criar"
  end

  # GET /atendimentos/1
  # GET /atendimentos/1.json
  def show
    @atendimento = Atendimento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @atendimento }
    end
  end

  # GET /atendimentos/new
  # GET /atendimentos/new.json
  def new
    @atendimento = Atendimento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @atendimento }
    end
  end

  # GET /atendimentos/1/edit
  def edit
    @atendimento = Atendimento.find(params[:id])
  end

  # POST /atendimentos
  # POST /atendimentos.json
  def create
    resposta = Hash.new
    flash[:mensagem] = Hash.new
    @atendimento = Atendimento.new
    @consulta = Consulta.new
    begin
      @consulta = Consulta.criaConsulta(params[:atendimento][:consulta], Consulta::CONFIRMADA, current_usuario)
      if (@consulta.errors.empty?)
        @atendimento = Atendimento.criaAtendimento(@consulta)
        if(@atendimento.errors.empty?)
          flash[:mensagem][:texto] = t :create_consultation_success_message
          flash[:mensagem][:tipo] = Constantes::MENSAGEM_SUCESSO
          resposta[:msg] = t :create_consultation_success_message
          resposta[:cod] = Constantes::ERRO
        else
          flash[:mensagem][:texto] = t :create_consultation_fail_message
          flash[:mensagem][:tipo] = Constantes::MENSAGEM_ERRO
          resposta[:msg] = t :create_consultation_fail_message
          resposta[:cod] = Constantes::ERRO
         end
      else
        flash[:mensagem][:texto] = t :create_consultation_fail_message
        flash[:mensagem][:tipo] = Constantes::MENSAGEM_ERRO
        resposta[:msg] = t :create_consultation_fail_message
        resposta[:cod] = Constantes::ERRO
      end
    rescue ConsultationLimitException
      flash[:mensagem][:texto] = t :create_consultation_duplicate_message
      flash[:mensagem][:tipo] = Constantes::MENSAGEM_ERRO
      resposta[:msg] = t :create_consultation_duplicate_message
      resposta[:cod] = Constantes::ERRO
    ensure
      resposta[:html] = render_to_string :partial => "criar", :usuario => current_usuario 
      render :json => resposta
    end
  end

  # PUT /atendimentos/1
  # PUT /atendimentos/1.json
  def update
    @atendimento = Atendimento.find(params[:id])

    respond_to do |format|
      if @atendimento.update_attributes(params[:atendimento])
        format.html { redirect_to @atendimento, :notice => 'Atendimento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @atendimento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /atendimentos/1
  # DELETE /atendimentos/1.json
  def destroy
    @atendimento = Atendimento.find(params[:id])
    @atendimento.destroy

    respond_to do |format|
      format.html { redirect_to atendimentos_url }
      format.json { head :no_content }
    end
  end
end
