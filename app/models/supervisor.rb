# -*- encoding : utf-8 -*-
class Supervisor < ActiveRecord::Base
  belongs_to :instituicao

  validates_presence_of :nome

  validates_format_of :email,
                      :with => /(\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z)|(^$)/i

end

