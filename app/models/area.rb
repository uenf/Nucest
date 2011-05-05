# -*- encoding : utf-8 -*-
class Area < ActiveRecord::Base

  has_and_belongs_to_many :instituicoes

	has_many :children, :class_name => "Area", :foreign_key => "father_id", :dependent => :destroy
	belongs_to :father, :class_name => "Area"

  validates_presence_of :nome

  after_save 'self.class.atualizar_arvore'
  after_destroy 'self.class.atualizar_arvore'

  def last?
    return self == Area.find_all_by_father_id(self.father_id, :order => 'nome').last
  end

  def self.gerar_arvore(pai = nil)
    arvore = {}

    if pai == nil
      filhos = Area.where('father_id IS NULL')
    else
      filhos = Area.where('father_id = ?', pai)
    end

    filhos.each { |p| arvore[p] = Area.gerar_arvore(p.id) }

    return arvore
  end

  def self.arvore
    return @@arvore ||= Area.gerar_arvore
  end

  private

  def self.atualizar_arvore
    @@arvore = Area.gerar_arvore
  end
end

