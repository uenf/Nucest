# -*- encoding : utf-8 -*-

class InstituicoesController < InheritedResources::Base
  add_breadcrumb 'Instituições', :instituicoes_path
  respond_to :js, :only => :index

  def index
    if params[:search].blank?
      params[:search] = { :meta_sort => "nome.asc" }
    end
    @search = Instituicao.search(params[:q])
    @instituicoes = @search.result
    @instituicoes = @instituicoes.page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.json do
        render :json => Instituicao.where(
          'tipo = ? and nome like ?',
          Instituicao::TIPO_DE_INSTITUICAO['Instituição de ensino'], "%#{params[:q]}%"
        ).collect { |i| { 'id' => i.id, 'name' => i.nome } }
      end
    end
  end

  def create
    create!(:notice => "Instituição cadastrada com sucesso.") { redirect_to_on_success }
  end

  def update
    @instituicao = Instituicao.find(params[:id])
    @instituicao.area_ids = [] if params[:instituicao].nil?
    update!(:notice => 'Instituição atualizada com sucesso.') { redirect_to_on_success }
  end

  def areas
    @instituicao = Instituicao.find(params[:id])
    add_breadcrumb @instituicao.nome, :instituicao_url
    add_breadcrumb 'Cadastrar áreas da instituição', :areas_instituicao_url
    @super_areas = Area.where("father_id IS NULL").order('nome ASC')
  end

  def redirect_to_on_success
    if @instituicao.save
      if params[:salvar]
        instituicoes_path
      elsif params[:salvar_cadastrar_representante]
        new_instituicao_representante_path(@instituicao.id)
      elsif params[:salvar_cadastrar_convenio]
        instituicao_convenios_path(@instituicao.id)
      elsif params[:salvar_cadastrar_instituicao]
        new_instituicao_path
      elsif params[:salvar_areas]
        areas_instituicao_path(@instituicao)
      end
    end
  end

  def buscar_cep
    erro = false
    # Ex: ['Avenida', 'das Americas', 'Barra da Tijuca', 'RJ', 'Rio de Janeiro', 22640100]
    endereco = BuscaEndereco.por_cep params[:cep]
    rua = "#{endereco.fetch(0)} #{endereco.fetch(1)}"
    bairro = endereco.fetch(2)
    cidade = endereco.fetch(3)
    estado = ApplicationHelper::SIGLAS_ESTADOS.key(endereco.fetch(4))
    cep = endereco.fetch(5)
    rescue
      erro = true
    ensure
      data = { :erro => erro, :rua => rua, :bairro => bairro, :cidade => cidade, :estado => estado, :cep => cep }
    render :text => data.to_json
  end
end

