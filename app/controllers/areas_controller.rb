# -*- encoding: utf-8 -*-

class AreasController < InheritedResources::Base
  add_breadcrumb 'Áreas de estágio', :areas_path

  def index
    index!{ @super_areas = Area.where("father_id IS NULL").order('nome ASC') }
  end

  def create
    @area = Area.new(params[:area])
    @instituicao = Instituicao.where('id = ?', params[:instituicao_id]).first
    if @area.save
      flash[:notice] = 'Área cadastrada com sucesso.'
      render 'create', :format => :js
    else
      render :action => :new, :format => :js
    end
  end

  def new
    @area = Area.new(:father_id => params[:father_id])
    @instituicao = Instituicao.where('id = ?', params[:instituicao_id]).first
    render 'form', :format => :js
  end

  def edit
    @area = Area.find(params[:id])
    @instituicao = Instituicao.where('id = ?', params[:instituicao_id]).first
    render 'form', :format => :js
  end

  def update
    @area = Area.find(params[:id])
    if @area.update_attributes(params[:area])
      flash[:notice] = 'Área atualizada com sucesso.'
      render :action => :update, :format => :js
    else
      render :action => :edit, :format => :js
    end
  end

  def destroy
    @area = Area.find(params[:id])
    @pai = @area.father_id
    if @area.instituicoes.empty?
      @area.destroy
      flash[:notice] = 'Área excluída com sucesso.'
    else
      flash[:error] = 'Não foi possível apagar a área. Existem instituições ligadas a ela.'
    end
  end
end

