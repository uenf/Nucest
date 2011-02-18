# -*- encoding : utf-8 -*-
class SupervisoresController < ApplicationController
  before_filter :get_instituicao
  before_filter :add_initial_breadcrumbs

  def index
  end

  def show
    @supervisor = @instituicao.supervisores.find(params[:id])
    breadcrumbs.add @supervisor.nome, instituicao_supervisor_path(@instituicao, @supervisor)
  end

  def new
    @supervisor = @instituicao.supervisores.new
    breadcrumbs.add 'Cadastrar supervisor', new_instituicao_supervisor_path(@instituicao)
  end

  def edit
    @supervisor = @instituicao.supervisores.find(params[:id])
    breadcrumbs.add 'Editar ' + @supervisor.nome, edit_instituicao_supervisor_path(@instituicao, @supervisor)
  end

  def create
    @supervisor = @instituicao.supervisores.new(params[:supervisor])
    if @supervisor.save
      flash[:notice] = 'Supervisor cadastrado com sucesso.'
      redirect_to(instituicao_supervisores_url)
    else
      breadcrumbs.add 'Cadastrar supervisor', new_instituicao_supervisor_path(@instituicao)
      render :action => 'new'
    end
  end

  def update
    @supervisor = @instituicao.supervisores.find(params[:id])
    if @supervisor.update_attributes(params[:supervisor])
      flash[:notice] = 'Supervisor cadastrado com sucesso.'
      redirect_to(instituicao_supervisores_url)
    else
      breadcrumbs.add 'Editar supervisor', edit_instituicao_supervisor_path(@instituicao)
      render :action => 'edit'
    end
  end

  def destroy
    @supervisor = @instituicao.supervisores.find(params[:id])
    @supervisor.destroy
    redirect_to(instituicao_supervisores_url)
  end

  private

  def get_instituicao
    @instituicao = Instituicao.find(params[:instituicao_id])
  end

  def add_initial_breadcrumbs
    breadcrumbs.add 'Instituições', instituicoes_path
    breadcrumbs.add 'Supervisores', instituicao_supervisores_url
  end
end

