# -*- encoding : utf-8 -*-
require 'brazilian_date'

class Instituicao < ActiveRecord::Base

  has_many :representantes, :dependent => :destroy
  has_many :supervisores, :dependent => :destroy
  has_and_belongs_to_many :areas

  TIPO_DE_CONVENIO = {
    "Instituição concedente" => 1,
    "UENF concedente" => 2,
    "Recíproco" => 3,
    "Agentede integração" => 4
  }

  TIPO_DE_INSTITUICAO = {
    "Empresa" => 1,
    "Instituição de ensino" => 2
  }

  ORIGEM = {
    "Nacional" => 1,
    "Estrangeira" => 2
  }


  use_in_brazilian_format :inicio_do_convenio, :fim_do_convenio

  usar_como_cnpj :cnpj

  validates_presence_of :nome

  validates_uniqueness_of :nome
  validates_uniqueness_of :cnpj, :allow_blank => true
  validates_uniqueness_of :razao_social, :allow_blank => true

  validates_format_of :email,
                      :with => /(\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z)|(^$)/i

  validates_format_of :site,
                      :with => /^(?#Protocol)(?:(?:ht|f)tp(?:s?)\:\/\/|~\/|\/)?(?#Username:Password)(?:\w+:\w+@)?(?#Subdomains)(?:(?:[-\w]+\.)+(?#TopLevel Domains)(?:com|org|net|gov|mil|biz|info|mobi|name|aero|jobs|museum|travel|[a-z]{2}))(?#Port)(?::[\d]{1,5})?(?#Directories)(?:(?:(?:\/(?:[-\w~!$+|.,=]|%[a-f\d]{2})+)+|\/)+|\?|#)?(?#Query)(?:(?:\?(?:[-\w~!$+|.,*:]|%[a-f\d{2}])+=?(?:[-\w~!$+|.,*:=]|%[a-f\d]{2})*)(?:&(?:[-\w~!$+|.,*:]|%[a-f\d{2}])+=?(?:[-\w~!$+|.,*:=]|%[a-f\d]{2})*)*)*(?#Anchor)(?:#(?:[-\w~!$+|.,*:=]|%[a-f\d]{2})*)?$/, :allow_blank => true

  validates_numericality_of :caixa_postal, :greater_than_or_equal_to => 0, :only_integer => true, :allow_blank => true

end

