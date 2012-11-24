class UsuarioPerfilsController < ApplicationController
  # GET /usuario_perfils
  # GET /usuario_perfils.json
  def index
    @usuario_perfils = UsuarioPerfil.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @usuario_perfils }
    end
  end

  # GET /usuario_perfils/1
  # GET /usuario_perfils/1.json
  def show
    @usuario_perfil = UsuarioPerfil.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @usuario_perfil }
    end
  end

  # GET /usuario_perfils/new
  # GET /usuario_perfils/new.json
  def new
    @usuario_perfil = UsuarioPerfil.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @usuario_perfil }
    end
  end

  # GET /usuario_perfils/1/edit
  def edit
    @usuario_perfil = UsuarioPerfil.find(params[:id])
  end

  # POST /usuario_perfils
  # POST /usuario_perfils.json
  def create
    @usuario_perfil = UsuarioPerfil.new(params[:usuario_perfil])

    respond_to do |format|
      if @usuario_perfil.save
        format.html { redirect_to @usuario_perfil, :notice => 'Usuario perfil was successfully created.' }
        format.json { render :json => @usuario_perfil, :status => :created, :location => @usuario_perfil }
      else
        format.html { render :action => "new" }
        format.json { render :json => @usuario_perfil.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /usuario_perfils/1
  # PUT /usuario_perfils/1.json
  def update
    @usuario_perfil = UsuarioPerfil.find(params[:id])

    respond_to do |format|
      if @usuario_perfil.update_attributes(params[:usuario_perfil])
        format.html { redirect_to @usuario_perfil, :notice => 'Usuario perfil was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @usuario_perfil.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /usuario_perfils/1
  # DELETE /usuario_perfils/1.json
  def destroy
    @usuario_perfil = UsuarioPerfil.find(params[:id])
    @usuario_perfil.destroy

    respond_to do |format|
      format.html { redirect_to usuario_perfils_url }
      format.json { head :no_content }
    end
  end
end
