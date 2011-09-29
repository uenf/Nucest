# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'manipular área' do
  background do
    @usuario = Factory.create :usuario
    login @usuario.email, 'nucest123'
  end

  context 'excluir uma área' do
    before :each do
      @area = Factory.create :area, :nome => 'foo'
    end

    scenario 'com sucesso', :js => true do
      visit areas_path
      click_link 'Excluir'
      page.driver.browser.switch_to.alert.accept
      page.should_not have_content 'foo'
      page.should have_content 'Área excluída com sucesso.'
    end

    scenario 'sem sucesso (Quando existe instituição ligada à área.)', :js => true do
      visit areas_path
      Factory.create :instituicao, :areas => [@area]
      click_link 'Excluir'
      page.driver.browser.switch_to.alert.accept
      page.should have_content 'foo'
      page.should have_content 'Não foi possível apagar a área. Existem instituições ligadas a ela.'
    end
  end

  scenario 'cadastrar sub-área com sucesso', :js => true do
    pai = Factory.create :area, :nome => 'pai'
    visit areas_path
    page.should have_xpath("//li[@data-id='#{pai.id}']")
    within("li[@data-id='#{pai.id}']") do
      click_link 'Nova sub-area'
    end
    fill_in 'area_nome', :with => 'Filho'
    click_button 'Salvar'
    within("li[@data-id='#{pai.id}']") do
      page.should have_content 'Filho'
    end
    page.should have_content 'Área cadastrada com sucesso.'
  end

  scenario 'cadastrar super-área com sucesso', :js => true do
    visit areas_path
    click_link 'Cadastrar área'
    fill_in 'area_nome', :with => 'área'
    click_button 'Salvar'
    page.should have_content 'área'
    page.should have_content 'Área cadastrada com sucesso.'
  end

  scenario 'editar sub-área com sucesso', :js => true do
    area = Factory.create :area, :nome => 'antigo'
    visit areas_path
    page.should have_xpath("//li[@data-id='#{area.id}']")
    within("li[@data-id='#{area.id}']") do
      click_link 'Editar'
    end
    fill_in 'area_nome', :with => 'novo'
    click_button 'Salvar'
    within("li[@data-id='#{area.id}']") do
      page.should have_content 'novo'
    end
    page.should have_content 'Área atualizada com sucesso.'
  end
end

