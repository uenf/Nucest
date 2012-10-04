require 'spec_helper'

describe ItemTramitacao do
  context 'relationships' do
    it { should belong_to :convenio }
  end

  context 'validations' do
    context 'origem_do_contato' do
      it { should have_valid(:origem_do_contato).when('foo') }
      it { should_not have_valid(:origem_do_contato).when(nil, '') }
    end
    context 'data_br' do
      it { should have_valid(:data_br).when('30/12/2012') }
      it { should_not have_valid(:data_br).when(nil, '', '12/30/2012') }
    end
    context 'forma_de_contato' do
      it { should have_valid(:forma_de_contato).when('foo') }
      it { should_not have_valid(:forma_de_contato).when(nil, '') }
    end
    context 'descricao' do
      it { should have_valid(:descricao).when('foo') }
      it { should_not have_valid(:descricao).when(nil, '') }
    end
  end
end

