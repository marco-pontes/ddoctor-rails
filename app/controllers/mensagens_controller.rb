class MensagensController < ApplicationController
  def inicializaModalDetalhes
    @mensagemInstancia = Mensagem.find(params[:mensagem_id])
    render :partial => "modalDetalhes"
  end

  def index
    params[:max] = params[:max] ? params[:max].to_i : 10
    params[:offset] = params[:offset] ? params[:offset].to_i : 0
    @mensagens = Mensagem.all(:offset => params[:offset], :limit => params[:max])
    @totalMensagens = Mensagem.count
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @mensagens }
    end
  end

  def destroy
    @mensagem = Mensagem.find(params[:id])
    resposta = Hash.new
    if (!@mensagem)
      flash[:message] = t :default_not_found_message, :modelo => "Mensagem", :id => params[:id]
      redirect_to :action => "listar"
    end
    @mensagem.destroy
      resposta[:code] = 1
      resposta[:message] = t :default_deleted_message, :modelo => 'Mensagem', :id => params[:id]
      render :json => resposta
    end

  # GET /mensagems/1
  # GET /mensagems/1.json
  def show
    @mensagem = Mensagem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @mensagem }
    end
  end

  # GET /mensagems/new
  # GET /mensagems/new.json
  def new
    @mensagem = Mensagem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @mensagem }
    end
  end

  # GET /mensagems/1/edit
  def edit
    @mensagem = Mensagem.find(params[:id])
  end

  # POST /mensagems
  # POST /mensagems.json
  def create
    @mensagem = Mensagem.new(params[:mensagem])

    respond_to do |format|
      if @mensagem.save
        format.html { redirect_to @mensagem, :notice => 'Mensagem was successfully created.' }
        format.json { render :json => @mensagem, :status => :created, :location => @mensagem }
      else
        format.html { render :action => "new" }
        format.json { render :json => @mensagem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mensagems/1
  # PUT /mensagems/1.json
  def update
    @mensagem = Mensagem.find(params[:id])

    respond_to do |format|
      if @mensagem.update_attributes(params[:mensagem])
        format.html { redirect_to @mensagem, :notice => 'Mensagem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @mensagem.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  end
