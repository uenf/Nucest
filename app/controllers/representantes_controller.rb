# -*- encoding : utf-8 -*-
class RepresentantesController < ApplicationController
  before_filter :get_instituicao
  before_filter :add_initial_breadcrumbs

  def index
  end

  def show
    @representante = @instituicao.representantes.find(params[:id])
    breadcrumbs.add @representante.nome, instituicao_representante_path(@instituicao, @representante)
  end

  def new
    @representante = @instituicao.representantes.new
    breadcrumbs.add 'Cadastrar representante', new_instituicao_representante_path(@instituicao)
  end

  def edit
    @representante = @instituicao.representantes.find(params[:id])
    breadcrumbs.add 'Editar ' + @representante.nome, edit_instituicao_representante_path(@instituicao, @representante)
  end

  def create
    @representante = @instituicao.representantes.new(params[:representante])
    if @representante.save
      flash[:notice] = 'Representante cadastrado com sucesso.'
      redirect_to(instituicao_representantes_url)
    else
      breadcrumbs.add 'Cadastrar representante', new_instituicao_representante_path(@instituicao)
      render :action => 'new'
    end
  end

  def update
    @representante = @instituicao.representantes.find(params[:id])
    if @representante.update_attributes(params[:representante])
      flash[:notice] = 'Representante cadastrado com sucesso.'
      redirect_to(instituicao_representantes_url)
    else
      breadcrumbs.add 'Editar representante', edit_instituicao_representante_path(@instituicao)
      render :action => 'edit'
    end
  end

  def destroy
    @representante = @instituicao.representantes.find(params[:id])
    @representante.destroy
    redirect_to(instituicao_representantes_url)
  end

  private

  def get_instituicao
    @instituicao = Instituicao.find(params[:instituicao_id])
  end

  def add_initial_breadcrumbs
    breadcrumbs.add 'Instituições', instituicoes_path
    breadcrumbs.add 'Representantes', instituicao_representantes_url
  end
end

