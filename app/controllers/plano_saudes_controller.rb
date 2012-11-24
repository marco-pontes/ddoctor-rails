class PlanoSaudesController < ApplicationController
  # GET /plano_saudes
  # GET /plano_saudes.json
  def index
    @plano_saudes = PlanoSaude.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @plano_saudes }
    end
  end

  # GET /plano_saudes/1
  # GET /plano_saudes/1.json
  def show
    @plano_saude = PlanoSaude.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @plano_saude }
    end
  end

  # GET /plano_saudes/new
  # GET /plano_saudes/new.json
  def new
    @plano_saude = PlanoSaude.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @plano_saude }
    end
  end

  # GET /plano_saudes/1/edit
  def edit
    @plano_saude = PlanoSaude.find(params[:id])
  end

  # POST /plano_saudes
  # POST /plano_saudes.json
  def create
    @plano_saude = PlanoSaude.new(params[:plano_saude])

    respond_to do |format|
      if @plano_saude.save
        format.html { redirect_to @plano_saude, :notice => 'Plano saude was successfully created.' }
        format.json { render :json => @plano_saude, :status => :created, :location => @plano_saude }
      else
        format.html { render :action => "new" }
        format.json { render :json => @plano_saude.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plano_saudes/1
  # PUT /plano_saudes/1.json
  def update
    @plano_saude = PlanoSaude.find(params[:id])

    respond_to do |format|
      if @plano_saude.update_attributes(params[:plano_saude])
        format.html { redirect_to @plano_saude, :notice => 'Plano saude was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @plano_saude.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plano_saudes/1
  # DELETE /plano_saudes/1.json
  def destroy
    @plano_saude = PlanoSaude.find(params[:id])
    @plano_saude.destroy

    respond_to do |format|
      format.html { redirect_to plano_saudes_url }
      format.json { head :no_content }
    end
  end
end
