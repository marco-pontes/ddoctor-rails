class AtendentesController < ApplicationController
  # GET /atendentes
  # GET /atendentes.json
  def index
    @atendentes = Atendente.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @atendentes }
    end
  end

  # GET /atendentes/1
  # GET /atendentes/1.json
  def show
    @atendente = Atendente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @atendente }
    end
  end

  # GET /atendentes/new
  # GET /atendentes/new.json
  def new
    @atendente = Atendente.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @atendente }
    end
  end

  # GET /atendentes/1/edit
  def edit
    @atendente = Atendente.find(params[:id])
  end

  # POST /atendentes
  # POST /atendentes.json
  def create
    @atendente = Atendente.new(params[:atendente])

    respond_to do |format|
      if @atendente.save
        format.html { redirect_to @atendente, :notice => 'Atendente was successfully created.' }
        format.json { render :json => @atendente, :status => :created, :location => @atendente }
      else
        format.html { render :action => "new" }
        format.json { render :json => @atendente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /atendentes/1
  # PUT /atendentes/1.json
  def update
    @atendente = Atendente.find(params[:id])

    respond_to do |format|
      if @atendente.update_attributes(params[:atendente])
        format.html { redirect_to @atendente, :notice => 'Atendente was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @atendente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /atendentes/1
  # DELETE /atendentes/1.json
  def destroy
    @atendente = Atendente.find(params[:id])
    @atendente.destroy

    respond_to do |format|
      format.html { redirect_to atendentes_url }
      format.json { head :no_content }
    end
  end
end
