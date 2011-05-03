# -*- encoding : utf-8 -*-
require 'brazilian_date'

class Convenio < ActiveRecord::Base

  TIPO = {
    "Agente de integração" => 1,
    "Instituição concedente" => 2,
    "Recíproco" => 3,
    "UENF concedente" => 4
  }

  belongs_to :instituicao

  after_save :atualizar_convenio_vigente

  validates_presence_of :numero, :tipo, :inicio_br, :fim_br

  use_in_brazilian_format :inicio, :fim

  def atualizar_convenio_vigente
    if self.fim > Date.today
      instituicao = Instituicao.find_by_id(self.instituicao_id)
      instituicao.update_attribute(:tipo_de_convenio, self.tipo)
    end
  end

end

