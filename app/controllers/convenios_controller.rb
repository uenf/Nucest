# -*- encoding : utf-8 -*-
class ConveniosController < InheritedResources::Base
  before_filter :breadcrumbs
  belongs_to :instituicao

  def index
    @convenios = Convenio.where("instituicao_id =?", params[:instituicao_id]).order("inicio DESC")
    @convenio = Convenio.new
    @instituicao = Instituicao.find(params[:instituicao_id])
    index!
  end

  def create
    create!(:notice => "Convênio cadastrado com sucesso.") { redirect_to_on_success }
  end

  def update
    update!(:notice => "Convênio atualizado com sucesso.") { redirect_to_on_success }
  end

  def breadcrumbs
    add_breadcrumb 'Instituições', :instituicoes_path
    add_breadcrumb Instituicao.find(params[:instituicao_id]).nome, edit_instituicao_path(params[:instituicao_id])
    add_breadcrumb 'Convênios', :instituicao_convenios_path
  end

  def redirect_to_on_success
    if @convenio.save
      if params[:Salvar]
        instituicao_convenios_path
      elsif params[:salvar_cadastrar_convenio]
        new_instituicao_convenio_path(@instituicao.id)
      elsif params[:salvar_cadastrar_representante]
        new_instituicao_representante_path(@instituicao.id)
      elsif params[:salvar_cadastrar_supervisor]
        new_instituicao_supervisor_path(@instituicao.id)
      end
    end
  end

  def gerar_termo
    @convenio = Convenio.find(params[:id])
    @instituicao = Instituicao.find(params[:instituicao_id])

    report = ODFReport::Report.new("#{RAILS_ROOT}/app/reports/#{Convenio::TIPO.key(@convenio.tipo)}.odt") do |r|
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

