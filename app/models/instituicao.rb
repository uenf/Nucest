# -*- encoding : utf-8 -*-

class Instituicao < ActiveRecord::Base

  has_many :representantes, :dependent => :destroy
  has_many :supervisores, :dependent => :destroy
  has_many :convenios, :dependent => :destroy
  has_and_belongs_to_many :areas

  TIPO_DE_INSTITUICAO = {
    'Empresa' => 1,
    'Instituição de ensino' => 2
  }

  ORIGEM = {
    'Nacional' => 1,
    'Estrangeira' => 2
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

  before_save :capitalizar_sigla, :capitalizar_razao_social

  usar_como_cnpj :cnpj

  validates_presence_of :nome

  validates_uniqueness_of :nome
  validates_uniqueness_of :cnpj, :allow_blank => true
  validates_uniqueness_of :razao_social, :allow_blank => true
  validates_numericality_of :caixa_postal, :greater_than_or_equal_to => 0, :only_integer => true, :allow_blank => true
  validates_format_of :cep, :with => /^[0-9]{2}.[0-9]{3}-[0-9]{3}$/, :allow_blank => true
  validates_format_of :site, :allow_blank => true, :with => /^(?:(?:https?|ftp|git):\/\/)?(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?$/i
  validates_format_of :email,
                      :with => /(\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z)|(^$)/i

  before_validation :add_protocol_to_site

  def capitalizar_sigla
    self.sigla.strip!
    self.sigla.upcase!
  end

  def capitalizar_razao_social
    self.razao_social.capitalize if self.razao_social
  end

  def self.uenf
    Instituicao.find_by_sigla('UENF')
  end

  def uenf?
    self == Instituicao.uenf
  end

  def sigla_nome
    self.sigla.blank? ? self.nome : "#{self.sigla} - #{self.nome}"
  end

  def self.de_ensino
    Instituicao.where('tipo = ?', Instituicao::TIPO_DE_INSTITUICAO['Instituição de ensino'])
  end

  private

  def add_protocol_to_site
    [:site].each do |link|
      unless self.send(link).blank?
        self.send(link.to_s+'=', 'http://' + self.send(link)) if self.send(link).match(/^(\w*):\/\//i).nil?
      end
    end
  end
end

