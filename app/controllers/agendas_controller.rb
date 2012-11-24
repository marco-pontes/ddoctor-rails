class AgendasController < ApplicationController
  # GET /agendas
  # GET /agendas.json
  def index
    @medico = Medico.find(params[:medico_id])
    resposta = Hash.new
    consultas = @medico.agenda.consultas.where(:status => Consulta::CONFIRMADA)
    if(consultas)
      resposta[:consultas] = consultas
      resposta[:mensagem] = t :get_agenda_success_message
      resposta[:codigo] = Constantes::SUCESSO
    else
      resposta[:mensagem] = t :get_agenda_fail_message
      resposta[:codigo] = Constantes::SEM_RESULTADOS
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => resposta }
    end
  end
  
  # GET /agendas/1
  # GET /agendas/1.json
  def show
    @agenda = Agenda.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @agenda }
    end
  end

  # GET /agendas/new
  # GET /agendas/new.json
  def inicializaModal
    @medico = Medico.find(params[:medico_id])
    if (!@medico) 
      flash.message = t :default_not_found_message
    end
    render :partial => "mostrar"
  end

  # GET /agendas/1/edit
  def edit
    @agenda = Agenda.find(params[:id])
  end

  # POST /agendas
  # POST /agendas.json
  def create
    @agenda = Agenda.new(params[:agenda])

    respond_to do |format|
      if @agenda.save
        format.html { redirect_to @agenda, :notice => 'Agenda was successfully created.' }
        format.json { render :json => @agenda, :status => :created, :location => @agenda }
      else
        format.html { render :action => "new" }
        format.json { render :json => @agenda.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /agendas/1
  # PUT /agendas/1.json
  def update
    @agenda = Agenda.find(params[:id])

    respond_to do |format|
      if @agenda.update_attributes(params[:agenda])
        format.html { redirect_to @agenda, :notice => 'Agenda was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @agenda.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /agendas/1
  # DELETE /agendas/1.json
  def destroy
    @agenda = Agenda.find(params[:id])
    @agenda.destroy

    respond_to do |format|
      format.html { redirect_to agendas_url }
      format.json { head :no_content }
    end
  end
end
