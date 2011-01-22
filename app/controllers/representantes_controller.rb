# -*- encoding : utf-8 -*-
class RepresentantesController < ApplicationController
  before_filter :get_instituicao

  def index
    @representantes = Representante.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @representantes }
    end
  end

  def show
    @representante = @instituicao.representantes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @representante }
    end
  end

  def new
    @representante = @instituicao.representantes.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @representante }
    end
  end

  def edit
    @representante = @instituicao.representantes.find(params[:id])
  end

  def create
    @representante = @instituicao.representantes.new(params[:representante])

    respond_to do |format|
      if @representante.save
        format.html { redirect_to([@instituicao, @representante], :notice => 'Representante cadastrado com sucesso.') }
        format.xml  { render :xml => @representante, :status => :created, :location => @representante }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @representante.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @representante = @instituicao.representantes.find(params[:id])

    respond_to do |format|
      if @representante.update_attributes(params[:representante])
        format.html { redirect_to([@instituicao, @representante], :notice => 'Representante alterado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @representante.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @representante = @instituicao.representantes.find(params[:id])
    @representante.destroy

    respond_to do |format|
      format.html { redirect_to(instituicao_representantes_url(@instituicao)) }
      format.xml  { head :ok }
    end
  end

  private

  def get_instituicao
    @instituicao = Instituicao.find(params[:instituicao_id])
  end
end

