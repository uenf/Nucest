# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'manipular convênio' do
  background do
    @usuario = FactoryGirl.create :usuario
    @instituicao = FactoryGirl.create :instituicao
    login @usuario.email, 'nucest123'
  end

  scenario 'excluir um convênio' do
    @convenio = FactoryGirl.create :convenio, :instituicao => @instituicao

    visit instituicao_convenios_path(@convenio.instituicao)
    click_link 'Excluir'
    Convenio.where(:id => @convenioid).should be_empty
  end

  context 'editar um convênio' do
    before(:each) do
      @convenio = FactoryGirl.create :convenio, :instituicao => @instituicao
      visit edit_instituicao_convenio_path(@convenio.instituicao, @convenio)
    end

    scenario 'com sucesso' do
      fill_in 'Número', :with => '123213123'
      select 'UENF concedente', :from => 'Tipo'
      fill_in 'Início', :with => '27/03/2013'
      fill_in 'Fim', :with => '27/03/2015'
      click_button 'Salvar'
    end

    scenario 'com falha' do
      fill_in 'Número', :with => '123213123'
      select 'UENF concedente', :from => 'Tipo'
      fill_in 'Início', :with => '27/27/2013'
      fill_in 'Fim', :with => '27/27/2015'
      click_button 'Salvar'
      page.should have_content('Convênio não pode ser atualizado.')
    end
  end

  context 'fluxo do processo de convenio', :js => true do
    scenario 'iniciar processo' do
      visit instituicao_convenios_path(@instituicao)
      click_link 'Iniciar processo de convênio'
      select 'Agente de integração', :from => 'Tipo'
      click_button 'Salvar'
      page.should have_content('Convênio cadastrado com sucesso')
      @instituicao.convenios.should have(1).items
      @instituicao.convenios.first.situacao.should == Convenio::SITUACAO['Em tramitação']
    end

    context 'adicionar entradas na tramitação', :js => true do
      before(:each) do
        @convenio = FactoryGirl.create :convenio, :instituicao => @instituicao
        visit instituicao_convenios_path(@convenio.instituicao)
        click_link 'Tramitação'
        sleep 1
        click_link 'Nova entrada'
        sleep 1
      end

      scenario 'com sucesso' do
        fill_in 'Data', :with => '01/01/2013'
        fill_in 'Origem do contato', :with => 'Foo'
        fill_in 'Forma de contato', :with => 'Foo'
        fill_in 'Descrição', :with => 'Foo'
        click_button 'Salvar'
        page.should have_xpath("//table[@id='itens_tramitacao']/tbody/tr")
      end

      scenario 'sem sucesso' do
        fill_in 'Data', :with => ''
        fill_in 'Origem do contato', :with => ''
        fill_in 'Forma de contato', :with => ''
        fill_in 'Descrição', :with => ''
        click_button 'Salvar'
        page.should have_content('não pode ser vazio')
        page.should_not have_xpath("//table[@id='itens_tramitacao']/tbody/tr")
      end
    end

    scenario 'finalizar processo' do
      convenio = FactoryGirl.create :convenio, :instituicao => @instituicao,
        :situacao => Convenio::SITUACAO['Em tramitação']
      visit instituicao_convenios_path(convenio.instituicao)
      click_link 'Tramitação'
      sleep 1
      click_link 'Finalizar tramitação'
      sleep 1
      fill_in 'Número', :with => '123456'
      fill_in 'Início', :with => '10/08/2011'
      fill_in 'Fim', :with => '10/08/2020'
      click_button 'Salvar'
      page.should have_content("Processo de tramitação finalizada com sucesso.")
      convenio.reload.situacao.should == Convenio::SITUACAO['Em vigência']
    end
  end
end

