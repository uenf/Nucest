# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  include Breadcrumbs
  before_filter :authenticate_usuario!

  def buscar_cep
    erro = false
    # Ex: ['Avenida', 'das Americas', 'Barra da Tijuca', 'RJ', 'Rio de Janeiro', 22640100]
    endereco = BuscaEndereco.por_cep params[:cep]
    rua = "#{endereco.fetch(0)} #{endereco.fetch(1)}"
    bairro = endereco.fetch(2)
    estado = ApplicationHelper::SIGLAS_ESTADOS.key(endereco.fetch(3))
    cidade = endereco.fetch(4)
    cep = endereco.fetch(5)
    rescue
      erro = true
    ensure
      data = { :erro => erro, :rua => rua, :bairro => bairro, :cidade => cidade, :estado => estado, :cep => cep }
    render :text => data.to_json
  end

end

