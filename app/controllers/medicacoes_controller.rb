class MedicacoesController < ApplicationController
  def index
    @medicacoes = Medicacao.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @medicacoes }
    end
  end
  def show
    @medicacao = Medicacao.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @medicacao }
    end
  end
  def new
    @medicacao = Medicacao.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @medicacao }
    end
  end
  def edit
    @medicacao = Medicacao.find(params[:id])
  end
  def create
    @medicacao = Medicacao.new(params[:medicacao])
    respond_to do |format|
      if @medicacao.save
        format.html { redirect_to @medicacao, :notice => 'Medicacao was successfully created.' }
        format.json { render :json => @medicacao, :status => :created, :location => @medicacao }
      else
        format.html { render :action => "new" }
        format.json { render :json => @medicacao.errors, :status => :unprocessable_entity }
      end
    end
  end
  def update
    @medicacao = Medicacao.find(params[:id])
    respond_to do |format|
      if @medicacao.update_attributes(params[:medicacao])
        format.html { redirect_to @medicacao, :notice => 'Medicacao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @medicacao.errors, :status => :unprocessable_entity }
      end
    end
  end
  def destroy
    @medicacao = Medicacao.find(params[:id])
    @medicacao.destroy
    respond_to do |format|
      format.html { redirect_to medicacoes_url }
      format.json { head :no_content }
    end
  end
end
