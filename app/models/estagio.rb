# -*- encoding : utf-8 -*-

class Estagio < ActiveRecord::Base
  belongs_to :supervisor
  belongs_to :estagiario
  belongs_to :instituicao_origem, :class_name => 'Instituicao'
  belongs_to :instituicao_destino, :class_name => 'Instituicao'
  belongs_to :agente_integracao, :class_name => 'Instituicao'

  flexible_date :data_inicial, :data_final, :suffix => 'br'

  TERMOS = {
    'Contrato inicial (Termo de compromisso)' => 0,
    'Renovação (Termo aditivo)' => 1
  }

  GRAUS_ENSINO = { 'Ensino médio' => 0, 'Ensino superior' => 1}
end

