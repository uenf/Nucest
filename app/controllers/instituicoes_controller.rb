# -*- encoding : utf-8 -*-
class InstituicoesController < InheritedResources::Base
  add_breadcrumb 'Instituições', :instituicoes_path
  respond_to :js, :only => :index

  def index
    if params[:search].blank?
      params[:search] = { :meta_sort => "nome.asc" }
    end
    @search = Instituicao.search(params[:search])
    @instituicoes = @search.all.paginate(:per_page => 20, :page => params[:page])
    index!
  end

  def create
    create!(:notice => "Instituição cadastrada com sucesso.") { redirect_to_on_success }
  end

  def update
    @instituicao = Instituicao.find(params[:id])
    @instituicao.area_ids = [] if params[:instituicao].nil?
    update!(:notice => "Instituição atualizada com sucesso.") { redirect_to_on_success }
  end

  def areas
    @instituicao = Instituicao.find(params[:id])
    add_breadcrumb @instituicao.nome, :instituicao_url
    add_breadcrumb 'Cadastrar áreas da instituição', :areas_instituicao_url
    @super_areas = Area.where("father_id IS NULL").order('nome')
  end

  def buscar_cep
    erro = false
    # Ex: ['Avenida', 'das Americas', 'Barra da Tijuca', 'RJ', 'Rio de Janeiro', 22640100]
    endereco = BuscaEndereco.por_cep params[:cep]
    rua = "#{endereco.fetch(0)} #{endereco.fetch(1)}"
    bairro = endereco.fetch(2)
    estado = Instituicao::SIGLAS.key(endereco.fetch(3))
    cidade = endereco.fetch(4)
    cep = endereco.fetch(5)
    rescue
      erro = true
    ensure
      data = { :erro => erro, :rua => rua, :bairro => bairro, :cidade => cidade, :estado => estado, :cep => cep }
    render :text => data.to_json
  end

  def redirect_to_on_success
    if @instituicao.save
      if params[:salvar]
        instituicoes_path
      elsif params[:salvar_editar]
        edit_instituicao_path
      elsif params[:salvar_cadastrar_instituicao]
        new_instituicao_path
      elsif params[:salvar_cadastrar_representante]
        new_instituicao_representante_path(@instituicao.id)
      elsif params[:salvar_cadastrar_supervisor]
        new_instituicao_supervisor_path(@instituicao.id)
      end
    end
  end

  def gerar_termo
    @instituicao = Instituicao.find(params[:id])

    if @instituicao.tipo_de_convenio.nil?
      redirect_to(edit_instituicao_path, :alert => "Cadastre o tipo de convênio antes de gerar o termo.")
    else
      report = ODFReport::Report.new("#{RAILS_ROOT}/app/reports/#{Instituicao::TIPO_DE_CONVENIO.key(@instituicao.tipo_de_convenio)}.odt") do |r|
        r.add_field(:nome, @instituicao.nome.to_s) if @instituicao.nome?
        r.add_field(:cnpj, @instituicao.cnpj.to_s) if @instituicao.cnpj?
        r.add_field(:rua, @instituicao.rua.to_s) if @instituicao.rua?
        r.add_field(:numero, @instituicao.numero.to_s) if @instituicao.numero?
        r.add_field(:bairro, @instituicao.bairro.to_s) if @instituicao.bairro?
        r.add_field(:cidade, @instituicao.cidade.to_s) if @instituicao.cidade?
        r.add_field(:estado, @instituicao.estado.to_s) if @instituicao.estado?
        r.add_field(:cep, @instituicao.cep.to_s) if @instituicao.cep?
        r.add_field(:razao_social, @instituicao.razao_social.to_s) if @instituicao.razao_social?
        unless @instituicao.representantes.blank?
          r.add_field(:nome_representante, @instituicao.representantes.first.nome.to_s) if @instituicao.representantes.first.nome?
          r.add_field(:funcao_representante, @instituicao.representantes.first.funcao.to_s) if @instituicao.representantes.first.funcao?
          r.add_field(:rg_representante, @instituicao.representantes.first.rg.to_s) if @instituicao.representantes.first.rg?
          r.add_field(:cpf_representante, @instituicao.representantes.first.cpf.to_s) if @instituicao.representantes.first.cpf?
          r.add_field(:orgao_expedidor_representante, @instituicao.representantes.first.orgao_expedidor.to_s) if @instituicao.representantes.first.orgao_expedidor?
        end
      end
      send_file(report.generate, :filename => "Termo de convênio - Nucest.odt")
    end
  end

end

