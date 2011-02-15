# -*- encoding : utf-8 -*-
class InstituicoesController < ApplicationController
  # GET /instituicoes
  # GET /instituicoes.xml
  def index
    @instituicoes = Instituicao.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @instituicoes }
    end
  end

  # GET /instituicoes/1
  # GET /instituicoes/1.xml
  def show
    @instituicao = Instituicao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @instituicao }
    end
  end

  # GET /instituicoes/new
  # GET /instituicoes/new.xml
  def new
    @instituicao = Instituicao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @instituicao }
    end
  end

  # GET /instituicoes/1/edit
  def edit
    @instituicao = Instituicao.find(params[:id])
  end

  # POST /instituicoes
  # POST /instituicoes.xml
  def create
    @instituicao = Instituicao.new(params[:instituicao])

    respond_to do |format|
      if @instituicao.save
        format.html { redirect_to(@instituicao, :notice => 'Instituição cadastrada com sucesso.') }
        format.xml  { render :xml => @instituicao, :status => :created, :location => @instituicao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @instituicao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /instituicoes/1
  # PUT /instituicoes/1.xml
  def update
    @instituicao = Instituicao.find(params[:id])

    respond_to do |format|
      if @instituicao.update_attributes(params[:instituicao])
        format.html { redirect_to(@instituicao, :notice => 'Instituição atualizada com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @instituicao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /instituicoes/1
  # DELETE /instituicoes/1.xml
  def destroy
    @instituicao = Instituicao.find(params[:id])
    @instituicao.destroy

    respond_to do |format|
      format.html { redirect_to(instituicoes_url) }
      format.xml  { head :ok }
    end
  end


  def print
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

end

