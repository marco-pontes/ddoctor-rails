class EntrevistaMedicasController < ApplicationController
  # GET /entrevista_medicas
  # GET /entrevista_medicas.json
  def index
    @entrevista_medicas = EntrevistaMedica.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @entrevista_medicas }
    end
  end

  # GET /entrevista_medicas/1
  # GET /entrevista_medicas/1.json
  def show
    @entrevista_medica = EntrevistaMedica.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @entrevista_medica }
    end
  end

  # GET /entrevista_medicas/new
  # GET /entrevista_medicas/new.json
  def new
    @entrevista_medica = EntrevistaMedica.new
    @atendimento = Atendimento.find(params[:atendimento_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @entrevista_medica }
    end
  end

  # GET /entrevista_medicas/1/edit
  def edit
    @entrevista_medica = EntrevistaMedica.find(params[:id])
  end

  # POST /entrevista_medicas
  # POST /entrevista_medicas.json
  def create
    @entrevista_medica = EntrevistaMedica.new(params[:entrevista_medica])
    @atendimento = Atendimento.find(params[:atendimento_id])
    @atendimento.status = Atendimento::FINALIZADO
    @entrevista_medica.save!
    flash[:mensagem] = Hash.new
    if @entrevista_medica.errors.empty?
      @atendimento.consulta.entrevistaMedica = @entrevista_medica
      @atendimento.consulta.status = Consulta::FINALIZADA
      @atendimento.consulta.save!
      @atendimento.save!
      flash[:mensagem][:texto] = t :default_created_message, :modelo => "entrevista", :id => @entrevista_medica.id
      flash[:mensagem][:tipo] = Constantes::MENSAGEM_SUCESSO
      redirect_to dashboard_medico_path
    else 
      flash[:mensagem][:texto] = t :entrevista_validation_fail_message
      flash[:mensagem][:tipo] = Constantes::MENSAGEM_ERRO
    end
  end

  # PUT /entrevista_medicas/1
  # PUT /entrevista_medicas/1.json
  def update
    @entrevista_medica = EntrevistaMedica.find(params[:id])

    respond_to do |format|
      if @entrevista_medica.update_attributes(params[:entrevista_medica])
        format.html { redirect_to @entrevista_medica, :notice => 'Entrevista medica was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @entrevista_medica.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entrevista_medicas/1
  # DELETE /entrevista_medicas/1.json
  def destroy
    @entrevista_medica = EntrevistaMedica.find(params[:id])
    @entrevista_medica.destroy

    respond_to do |format|
      format.html { redirect_to entrevista_medicas_url }
      format.json { head :no_content }
    end
  end
end
