# -*- encoding : utf-8 -*-

class ConveniosController < InheritedResources::Base
  actions :all, :except => [ :new, :show ]
  respond_to :js, :only => :index
  before_filter :breadcrumbs, :except => [ :findar_convenios ]
  belongs_to :instituicao

  def index
    @item_tramitacao = ItemTramitacao.new
    @convenios = Convenio.where("instituicao_id =?", params[:instituicao_id]).order("inicio DESC")
    @convenio = Convenio.new
    @instituicao = Instituicao.find(params[:instituicao_id])
    index!
  end

  def edit
    @instituicao = Instituicao.find(params[:instituicao_id])
    edit!
  end

  def create
    @convenio = Convenio.new(params[:convenio])

    if @convenio.save
      flash[:notice] = 'Convênio cadastrado com sucesso.'
    else
      flash[:notice] = 'Convênio não pode ser cadastrado.'
    end

    redirect_to instituicao_convenios_path
  end


  def update
    @convenio = Convenio.find(params[:id])
    @instituicao = Instituicao.find(@convenio.instituicao_id)

    if @convenio.update_attributes(params[:convenio])
      if params[:finalizar_tramitacao]
        flash[:notice] = 'Processo de tramitação finalizada com sucesso.'
      else
        flash[:notice] = 'Convênio atualizado com sucesso.'
      end

      redirect_to instituicao_convenios_path
    else
      @input_situacao = false
      flash[:error] = 'Convênio não pode ser atualizado.'
      render :action => 'finalizar_tramitacao'
    end
  end

  def breadcrumbs
    add_breadcrumb 'Instituições', :instituicoes_path
    add_breadcrumb Instituicao.find(params[:instituicao_id]).nome, edit_instituicao_path(params[:instituicao_id])
    add_breadcrumb 'Convênios', :instituicao_convenios_path
  end

  def gerar_termo
    @convenio = Convenio.find(params[:id])
    @instituicao = Instituicao.find(params[:instituicao_id])

    report = ODFReport::Report.new("#{RAILS_ROOT}/app/reports/#{Convenio::TIPO.key(@convenio.tipo)}.odt") do |r|
      r.add_field(:nome, @instituicao.nome.to_s) if @instituicao.nome?
      r.add_field(:sigla_cx_alta, @instituicao.sigla.to_s.upcase) if @instituicao.sigla?
      r.add_field(:cnpj, @instituicao.cnpj.to_s) if @instituicao.cnpj?
      r.add_field(:rua, @instituicao.rua.to_s) if @instituicao.rua?
      r.add_field(:numero, @instituicao.numero.to_s) if @instituicao.numero?
      r.add_field(:bairro, @instituicao.bairro.to_s) if @instituicao.bairro?
      r.add_field(:cidade, @instituicao.cidade.to_s) if @instituicao.cidade?
      r.add_field(:estado, @instituicao.estado.to_s) if @instituicao.estado?
      r.add_field(:cep, @instituicao.cep.to_s) if @instituicao.cep?
      r.add_field(:razao_social_cx_alta, @instituicao.razao_social.to_s.upcase) if @instituicao.razao_social?
      r.add_field(:razao_social, @instituicao.razao_social.to_s) if @instituicao.razao_social?
      unless @instituicao.representantes.blank?
        r.add_field(:nome_representante, @instituicao.representantes.first.nome.to_s) if @instituicao.representantes.first.nome?
        r.add_field(:nome_representante_cx_alta, @instituicao.representantes.first.nome.to_s.upcase) if @instituicao.representantes.first.nome?
        r.add_field(:funcao_representante, @instituicao.representantes.first.funcao.to_s) if @instituicao.representantes.first.funcao?
        r.add_field(:rg_representante, @instituicao.representantes.first.rg.to_s) if @instituicao.representantes.first.rg?
        r.add_field(:cpf_representante, @instituicao.representantes.first.cpf.to_s) if @instituicao.representantes.first.cpf?
        r.add_field(:orgao_expedidor_representante_cx_alta, @instituicao.representantes.first.orgao_expedidor.to_s.upcase) if @instituicao.representantes.first.orgao_expedidor?
      end
    end
    send_file(report.generate, :filename => "Termo de convênio - Nucest.odt")
  end

  def finalizar_tramitacao
    @convenio = Convenio.find(params[:id])
    @instituicao = Instituicao.find(params[:instituicao_id])
    @input_situacao = false
  end

  def findar_convenios
    Convenio.findar_convenios
    render :nothing => true
  end

end

