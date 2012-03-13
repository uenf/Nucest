# -*- encoding : utf-8 -*-

class Estagiario < ActiveRecord::Base
  usar_como_cpf :cpf

  flexible_date :data_de_expedicao, :data_de_nascimento, :suffix => 'br'

  validates_format_of :email, :with => /(\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z)|(^$)/i
  validates_format_of :cep, :with => /^[0-9]{2}.[0-9]{3}-[0-9]{3}$/, :allow_blank => true
  validates_presence_of :nome
  validates_uniqueness_of :cpf, :allow_blank => true
end

