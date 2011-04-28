# -*- encoding : utf-8 -*-
require 'brazilian_date'

class Estagiario < ActiveRecord::Base

  belongs_to :instituicao

  TEMPO_EM_CURSO = { "1º" => 1, "2º" => 2, "3º" => 3, "4º" => 4, "5º" => 5,
                       "6º" => 6, "7" => 7, "8º" => 8, "9º" => 9, "10º" => 10,
                       "11º" => 11, "12º" => 12 }

  usar_como_cpf :cpf

  use_in_brazilian_format :data_de_expedicao, :data_de_nascimento

  validates_presence_of :nome

  validates_format_of :email,
                      :with => /(\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z)|(^$)/i

end

