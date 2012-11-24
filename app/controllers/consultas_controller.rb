class ConsultasController < ApplicationController
  def confirmar
    @tarefa = Tarefa.find(params[:tarefa_id])
    @consulta = Consulta.find(params[:id])
    @consulta.status = Consulta::CONFIRMADA
    @tarefa.status = Tarefa::FINALIZADA
    flash[:mensagem] = Hash.new
    if (Atendimento.criaAtendimento(@consulta)) 
      @tarefa.save!
      @consulta.save!
      Mensagem.consultaConfirmada(@consulta, current_usuario)
      flash[:mensagem][:tipo] = Constantes::MENSAGEM_SUCESSO
      flash[:mensagem][:texto] = t :consultation_confirmed_message
      flash[:mensagem][:tipo] = Mensagem::INFO
      if params[:irPara] == 'dashboard'
        redirect_to dashboard_index_path
        return
      else
        redirect_to @consulta
        return
      end
    end
    flash[:mensagem][:tipo] = Constantes::MENSAGEM_ERRO
    flash[:mensagem][:texto] = t :consultation_confirmation_error
    render :partial => "tarefas/modalDetalhes"
  end

  def cancelar
    @tarefa = Tarefa.find(params[:tarefa_id])
    @consulta = Consulta.find(params[:id])
    @consulta.status = Consulta::CANCELADA
    @tarefa.status = Tarefa::FINALIZADA
    @consulta.save!
    @tarefa.save!
    flash[:mensagem] = Hash.new
    Mensagem.consultaCancelada(@consulta, current_usuario)
    flash[:mensagem][:texto] = t :consultation_canceled_message
    flash[:mensagem][:tipo] = Constantes::MENSAGEM_SUCESSO
    redirect_to consulta_path(:id => @consulta.id)
    return
  end

  # GET /consulta
  # GET /consulta.json
  def index
    @consulta = Consulta.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @consulta }
    end
  end

  # GET /consulta/1
  # GET /consulta/1.json
  def show
   @tarefa = Tarefa.new
   @consulta = Consulta.find(params[:id])
    if params[:tarefa_id] != nil
      @tarefa = Tarefa.find(params[:tarefa_id])
    end
    if (@consulta == nil) 
      redirect_to atedimentos_path
      return
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @consulta }
    end
  end

  # GET /consulta/new
  # GET /consulta/new.json
  def inicializaModal
    @consulta = Consulta.new
    @especialidadesMedicosDisponiveis = Medico.buscaEspecialidadesComMedicos()
    respond_to do |format|
      format.html {render :partial => "criar" }
      format.json { render :json => @consulta }
    end
  end

  # GET /consulta/1/edit
  def edit
    @consulta = Consulta.find(params[:id])
  end

  # POST /consulta
  # POST /consulta.json
  def create
    resposta = Hash.new
    flash[:mensagem] = Hash.new
    @consulta = Consulta.new
    begin
      @consulta = Consulta.criaConsulta(params[:consulta], Consulta::PENDENTE, current_usuario)
        if(@consulta.errors.empty?)
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
    rescue ConsultationLimitException
      flash[:mensagem][:texto] = t :create_consultation_duplicate_message
      flash[:mensagem][:tipo] = Constantes::MENSAGEM_ERRO
      resposta[:msg] = t :create_consultation_duplicate_message
      resposta[:cod] = Constantes::ERRO
    ensure
      @especialidadesMedicosDisponiveis = Medico.buscaEspecialidadesComMedicos()
      resposta[:html] = render_to_string :partial => "criar"
      #g.render(template: "/consulta/criar", model: [consultaInstancia: consultaInstancia, usuario:springSecurityService.getCurrentUser(), especialidadesMedicosDisponiveis:especialidadesMedicosDisponiveis])
      render :json => resposta
    end
  end

  # PUT /consulta/1
  # PUT /consulta/1.json
  def update
    @consulta = Consulta.find(params[:id])

    respond_to do |format|
      if @consulta.update_attributes(params[:consultum])
        format.html { redirect_to @consulta, :notice => 'Consulta was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @consulta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /consulta/1
  # DELETE /consulta/1.json
  def destroy
    @consulta = Consulta.find(params[:id])
    @consulta.destroy

    respond_to do |format|
      format.html { redirect_to consulta_url }
      format.json { head :no_content }
    end
  end
end
