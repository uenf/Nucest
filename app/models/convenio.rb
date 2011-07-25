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
  validate :validar_campos_ao_finalizar_tramitacao, :validar_inicio_e_fim

  flexible_date :inicio, :fim, :suffix => 'br'

#  def atualizar_convenio_vigente
#    if self.fim != nil && (self.fim > Date.today)
#      instituicao = Instituicao.find_by_id(self.instituicao_id)
#      instituicao.update_attribute(:tipo_de_convenio, self.tipo)
#    end
#  end

  def self.findar_convenios
    Convenio.all.each do |convenio|
      if convenio.fim?
        convenio.update_attribute(:situacao, Convenio::SITUACAO['Findado']) if convenio.fim < Date.today
      end
    end
  end

  def validar_campos_ao_finalizar_tramitacao
    if self.situacao == Convenio::SITUACAO['Em vigência']
      errors.add(:numero, 'não pode ser vazio') if self.numero.blank?
      errors.add(:inicio_br, 'não pode ser vazio') if self.inicio_br.blank?
      errors.add(:fim_br, 'não pode ser vazio') if self.fim_br.blank?
    end
  end

  def validar_inicio_e_fim
    if not self.fim.nil? and not self.inicio.nil?
      if self.fim < self.inicio
        errors.add(:fim_br, 'data final não pode ser menor que a inicial')
      end
    end
  end

end

