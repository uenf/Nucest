# -*- encoding : utf-8 -*-
class InstituicoesController < ApplicationController
  before_filter :add_initial_breadcrumbs

  def index
    @instituicoes = Instituicao.all
  end

  def show
    @instituicao = Instituicao.find(params[:id])
    breadcrumbs.add @instituicao.nome, instituicao_path(@instituicao)
  end

  def new
    @instituicao = Instituicao.new
    breadcrumbs.add 'Cadastrar instituicao', new_instituicao_path
  end

  def edit
    @instituicao = Instituicao.find(params[:id])
    breadcrumbs.add 'Editar ' + @instituicao.nome, edit_instituicao_path(@instituicao)
  end

  def create
    @instituicao = Instituicao.new(params[:instituicao])
    if @instituicao.save
      flash[:notice] = 'Instituição cadastrada com sucesso.'
      redirect_to(@instituicao)
    else
      breadcrumbs.add 'Cadastrar instituicao', new_instituicao_path
      render :action => 'new'
    end
  end

  def update
    @instituicao = Instituicao.find(params[:id])
    if @instituicao.update_attributes(params[:atividade])
      flash[:notice] = 'Alterações realizadas com sucesso.'
      redirect_to(@instituicao)
    else
      breadcrumbs.add 'Editar instituicao' + @instituicao.nome, edit_instituicao_path(@instituicao)
      render :action => 'edit'
    end
  end

  def destroy
    @instituicao = Instituicao.find(params[:id])
    @instituicao.destroy
    redirect_to(instituicoes_url)
  end

  def gerar_termo
    @instituicao = Instituicao.find(params[:id])

    if @instituicao.tipo_de_convenio == 1
      report = ODFReport::Report.new("#{RAILS_ROOT}/instituicao_concedente.odt") do |r|
        r.add_field(:nome, @instituicao.nome.to_s)
        r.add_field(:cnpj, @instituicao.cnpj.to_s)
        r.add_field(:rua, @instituicao.rua.to_s)
        r.add_field(:numero, @instituicao.numero.to_s)
        r.add_field(:bairro, @instituicao.bairro.to_s)
        r.add_field(:cidade, @instituicao.cidade.to_s)
        r.add_field(:estado, @instituicao.estado.to_s)
        r.add_field(:cep, @instituicao.cep.to_s)
        r.add_field(:razao_social, @instituicao.razao_social.to_s)
        r.add_field(:nome_representante, @instituicao.representantes.first.nome.to_s)
        r.add_field(:funcao_representante, @instituicao.representantes.first.funcao.to_s)
        r.add_field(:rg_representante, @instituicao.representantes.first.rg.to_s)
        r.add_field(:cpf_representante, @instituicao.representantes.first.cpf.to_s)
        r.add_field(:orgao_expedidor_representante, @instituicao.representantes.first.orgao_expedidor.to_s)
      end
    end

    if @instituicao.tipo_de_convenio == 2
      report = ODFReport::Report.new("#{RAILS_ROOT}/uenf_concedente.odt") do |r|
        r.add_field(:nome, @instituicao.nome.to_s)
        r.add_field(:cnpj, @instituicao.cnpj.to_s)
        r.add_field(:rua, @instituicao.rua.to_s)
        r.add_field(:numero, @instituicao.numero.to_s)
        r.add_field(:bairro, @instituicao.bairro.to_s)
        r.add_field(:cidade, @instituicao.cidade.to_s)
        r.add_field(:estado, @instituicao.estado.to_s)
        r.add_field(:cep, @instituicao.cep.to_s)
        r.add_field(:razao_social, @instituicao.razao_social.to_s)
        r.add_field(:nome_representante, @instituicao.representantes.first.nome.to_s)
        r.add_field(:funcao_representante, @instituicao.representantes.first.funcao.to_s)
        r.add_field(:rg_representante, @instituicao.representantes.first.rg.to_s)
        r.add_field(:cpf_representante, @instituicao.representantes.first.cpf.to_s)
        r.add_field(:orgao_expedidor_representante, @instituicao.representantes.first.orgao_expedidor.to_s)
      end
    end

    if @instituicao.tipo_de_convenio == 3
      report = ODFReport::Report.new("#{RAILS_ROOT}/reciproco.odt") do |r|
        r.add_field(:nome, @instituicao.nome.to_s)
        r.add_field(:cnpj, @instituicao.cnpj.to_s)
        r.add_field(:rua, @instituicao.rua.to_s)
        r.add_field(:numero, @instituicao.numero.to_s)
        r.add_field(:bairro, @instituicao.bairro.to_s)
        r.add_field(:cidade, @instituicao.cidade.to_s)
        r.add_field(:estado, @instituicao.estado.to_s)
        r.add_field(:cep, @instituicao.cep.to_s)
        r.add_field(:razao_social, @instituicao.razao_social.to_s)
        r.add_field(:nome_representante, @instituicao.representantes.first.nome.to_s)
        r.add_field(:funcao_representante, @instituicao.representantes.first.funcao.to_s)
        r.add_field(:rg_representante, @instituicao.representantes.first.rg.to_s)
        r.add_field(:cpf_representante, @instituicao.representantes.first.cpf.to_s)
        r.add_field(:orgao_expedidor_representante, @instituicao.representantes.first.orgao_expedidor.to_s)
      end
    end

    report_file_name = report.generate("./documentos/Termo de convênio.odt")
    send_file(report_file_name)
  end

  private

  def add_initial_breadcrumbs
    breadcrumbs.add 'Instituições', instituicoes_path
  end
end

