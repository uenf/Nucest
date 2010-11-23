# -*- encoding : utf-8 -*-
class InstituicoesController < ApplicationController
  # GET /instituicoes
  # GET /instituicoes.xml
  def index
    @instituicoes = Instituicao.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @instituicoes }
    end
  end

  # GET /instituicoes/1
  # GET /instituicoes/1.xml
  def show
    @instituicao = Instituicao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @instituicao }
    end
  end

  # GET /instituicoes/new
  # GET /instituicoes/new.xml
  def new
    @instituicao = Instituicao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @instituicao }
    end
  end

  # GET /instituicoes/1/edit
  def edit
    @instituicao = Instituicao.find(params[:id])
  end

  # POST /instituicoes
  # POST /instituicoes.xml
  def create
    @instituicao = Instituicao.new(params[:instituicao])

    respond_to do |format|
      if @instituicao.save
        format.html { redirect_to(@instituicao, :notice => 'Instituição cadastrada com sucesso.') }
        format.xml  { render :xml => @instituicao, :status => :created, :location => @instituicao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @instituicao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /instituicoes/1
  # PUT /instituicoes/1.xml
  def update
    @instituicao = Instituicao.find(params[:id])

    respond_to do |format|
      if @instituicao.update_attributes(params[:instituicao])
        format.html { redirect_to(@instituicao, :notice => 'Instituição atualizada com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @instituicao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /instituicoes/1
  # DELETE /instituicoes/1.xml
  def destroy
    @instituicao = Instituicao.find(params[:id])
    @instituicao.destroy

    respond_to do |format|
      format.html { redirect_to(instituicoes_url) }
      format.xml  { head :ok }
    end
  end
end

