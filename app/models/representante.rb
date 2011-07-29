# -*- encoding : utf-8 -*-
class Representante < ActiveRecord::Base
  belongs_to :instituicao

  usar_como_cpf :cpf

  validates_presence_of :nome

  validates_format_of :email,
                      :with => /(\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z)|(^$)/i

  validate :validar_unicidade_do_cpf_por_inscricao

  def validar_unicidade_do_cpf_por_inscricao
    if self.instituicao and self.cpf
      if self.instituicao.representantes.map(&:cpf).include?(self.cpf)
        errors.add(:cpf, 'já cadastrado em outro representante dessa instituição.')
      end
    end
  end
end

