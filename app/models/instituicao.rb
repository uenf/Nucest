# -*- encoding : utf-8 -*-
require 'brazilian_date'

class Instituicao < ActiveRecord::Base

  has_many :representantes, :dependent => :destroy
  has_many :supervisores, :dependent => :destroy
  has_many :estagiarios
  has_and_belongs_to_many :areas

  TIPO_DE_CONVENIO = {
    "Agentede integração" => 1,
    "Instituição concedente" => 2,
    "Recíproco" => 3,
    "UENF concedente" => 4
  }

  TIPO_DE_INSTITUICAO = {
    "Empresa" => 1,
    "Instituição de ensino" => 2
  }

  ORIGEM = {
    "Nacional" => 1,
    "Estrangeira" => 2
  }

  ESTADOS = ['Acre', 'Alagoas', 'Amapá', 'Amazonas', 'Bahia', 'Ceará',
              'Distrito Federal', 'Espírito Santo', 'Goiás', 'Maranhão',
              'Mato Grosso', 'Mato Grosso do Sul', 'Minas Gerais', 'Paraná',
              'Paraíba', 'Pará', 'Pernambuco', 'Piauí', 'Rio de Janeiro',
              'Rio Grande do Norte', 'Rio Grande do Sul', 'Rondônia', 'Roraima',
              'Santa Catarina', 'Sergipe', 'São Paulo', 'Tocantins']

  SIGLAS = {'Acre' => 'AC', 'Alagoas' => 'AL', 'Amapá' => 'AP', 'Amazonas' => 'AM',
            'Bahia' => 'BA', 'Ceará' => 'CE', 'Distrito Federal' => 'DF',
            'Espírito Santo' => 'ES', 'Goiás' => 'GO', 'Maranhão' => 'MA',
             'Mato Grosso' => 'MT', 'Mato Grosso do Sul' => 'MS',
             'Minas Gerais' => 'MG', 'Paraná' => 'PR', 'Paraíba' => 'PB',
             'Pará' => 'PA', 'Pernambuco' => 'PE', 'Piauí' => 'PI',
             'Rio de Janeiro' => 'RJ', 'Rio Grande do Norte' => 'RN',
             'Rio Grande do Sul' => 'RS', 'Rondônia' => 'RO', 'Roraima' => 'RR',
             'Santa Catarina' => 'SC', 'Sergipe' => 'SE', 'São Paulo' => 'SP', 'Tocantins' => 'TO'}

  acts_as_url :site

  use_in_brazilian_format :inicio_do_convenio, :fim_do_convenio

  usar_como_cnpj :cnpj

  validates_presence_of :nome

  validates_uniqueness_of :nome
  validates_uniqueness_of :cnpj, :allow_blank => true
  validates_uniqueness_of :razao_social, :allow_blank => true

  validates_format_of :email,
                      :with => /(\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z)|(^$)/i

  validates_numericality_of :caixa_postal, :greater_than_or_equal_to => 0, :only_integer => true, :allow_blank => true

end

