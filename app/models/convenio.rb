# -*- encoding : utf-8 -*-
class Convenio < ActiveRecord::Base

  has_many :itens_tramitacao

  belongs_to :instituicao

  SITUACAO = { 'Em tramitação' => 1, 'Em vigência' => 2, 'Findado' => 3 }

  TIPO = {
    'Agente de integração' => 1,
    'Instituição concedente' => 2,
    'Recíproco' => 3,
    'UENF concedente' => 4
  }

#  after_save :atualizar_convenio_vigente

  validates_presence_of :tipo

  flexible_date :inicio, :fim, :suffix => 'br'

#  def atualizar_convenio_vigente
#    if self.fim != nil && (self.fim > Date.today)
#      instituicao = Instituicao.find_by_id(self.instituicao_id)
#      instituicao.update_attribute(:tipo_de_convenio, self.tipo)
#    end
#  end

  def self.findar_convenios
    Convenio.all.each do |convenio|
      convenio.update_attribute(:situacao, Convenio::SITUACAO['Findado']) if convenio.fim < Date.today
    end
  end

end

