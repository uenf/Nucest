# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Instituicao do

  before do
    @instituicao = Instituicao.new
  end

  it do
    @instituicao.should be_an_instance_of(Instituicao)
  end

end

