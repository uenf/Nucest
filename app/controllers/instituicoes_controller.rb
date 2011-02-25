# -*- encoding : utf-8 -*-
class InstituicoesController < InheritedResources::Base
  add_breadcrumb 'Instituições', :instituicoes_path

  def create
    create!(:notice => "Instituição cadastrada com sucesso.")
  end

  def update
    update!(:notice => "Instituição atualizada com sucesso.")
  end

  def gerar_termo
    @instituicao = Instituicao.find(params[:id])

    if @instituicao.tipo_de_convenio.nil?
      redirect_to(edit_instituicao_path, :alert => "Cadastre o tipo de convênio antes de gerar o termo.")
    else
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
          unless @instituicao.representantes.blank?
            r.add_field(:nome_representante, @instituicao.representantes.first.nome.to_s)
            r.add_field(:funcao_representante, @instituicao.representantes.first.funcao.to_s)
            r.add_field(:rg_representante, @instituicao.representantes.first.rg.to_s)
            r.add_field(:cpf_representante, @instituicao.representantes.first.cpf.to_s)
            r.add_field(:orgao_expedidor_representante, @instituicao.representantes.first.orgao_expedidor.to_s)
          end
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
          unless @instituicao.representantes.blank?
            r.add_field(:nome_representante, @instituicao.representantes.first.nome.to_s)
            r.add_field(:funcao_representante, @instituicao.representantes.first.funcao.to_s)
            r.add_field(:rg_representante, @instituicao.representantes.first.rg.to_s)
            r.add_field(:cpf_representante, @instituicao.representantes.first.cpf.to_s)
            r.add_field(:orgao_expedidor_representante, @instituicao.representantes.first.orgao_expedidor.to_s)
          end
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
          unless @instituicao.representantes.blank?
            r.add_field(:nome_representante, @instituicao.representantes.first.nome.to_s)
            r.add_field(:funcao_representante, @instituicao.representantes.first.funcao.to_s)
            r.add_field(:rg_representante, @instituicao.representantes.first.rg.to_s)
            r.add_field(:cpf_representante, @instituicao.representantes.first.cpf.to_s)
            r.add_field(:orgao_expedidor_representante, @instituicao.representantes.first.orgao_expedidor.to_s)
          end
        end
      end

      report_file_name = report.generate("./documentos/Termo de convênio.odt")
      send_file(report_file_name)
    end
  end

end

