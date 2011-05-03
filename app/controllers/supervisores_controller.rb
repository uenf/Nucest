# -*- encoding : utf-8 -*-
class SupervisoresController < InheritedResources::Base
  before_filter :breadcrumbs
  belongs_to :instituicao

  def create
    create!(:notice => "Supervisor cadastrado com sucesso.") { redirect_to_on_success }
  end

  def update
    update!(:notice => "Supervisor atualizado com sucesso.") { redirect_to_on_success }
  end

  def breadcrumbs
    add_breadcrumb 'Instituições', :instituicoes_path
    add_breadcrumb Instituicao.find(params[:instituicao_id]).nome, edit_instituicao_path(params[:instituicao_id])
    add_breadcrumb 'supervisores', :instituicao_supervisores_path
  end

  def redirect_to_on_success
    if @supervisor.save
      if params[:salvar]
        instituicao_supervisores_path
      elsif params[:salvar_cadastrar_convenio]
        new_instituicao_convenio_path(@instituicao.id)
      elsif params[:salvar_cadastrar_representante]
        new_instituicao_representante_path(@instituicao.id)
      elsif params[:salvar_cadastrar_supervisor]
        new_instituicao_supervisor_path(@instituicao.id)
      end
    end
  end

end

