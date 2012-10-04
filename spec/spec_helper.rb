# -*- encoding : utf-8 -*-
require 'rubygems'
require 'spork'

Spork.prefork do
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'valid_attribute'
  require 'capybara/rails'
  require 'capybara/rspec'
  require 'capybara/poltergeist'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    Capybara.javascript_driver = :poltergeist

    Capybara.register_driver :poltergeist do |app|
      Capybara::Poltergeist::Driver.new(app, :inspector => true)
    end

    config.mock_with :rspec
    config.use_transactional_fixtures = false

    config.before :each do
      if Capybara.current_driver == :rack_test
        DatabaseCleaner.strategy = :transaction
      else
        DatabaseCleaner.strategy = :truncation
      end
      DatabaseCleaner.start
    end

    config.after do
      DatabaseCleaner.clean
      Capybara.use_default_driver if example.metadata[:js]
    end

    config.include Delorean
  end

  def login_usuario opts={}
    @usuario ||= FactoryGirl.create :usuario
    opts.each_pair do |key, value|
      @usuario.update_attribute(key, value)
    end
    sign_in @usuario
    controller.stub(:current_usuario) { @usuario }
  end

  def logout
    sign_out @usuario
  end

  def login(email, password)
    visit root_path
    fill_in('E-mail', :with => email)
    fill_in('Senha', :with => password)
    click_button 'Login'
  end
end

Spork.each_run do
  require File.expand_path("../../config/routes", __FILE__)

  # Reload all models and controllers files when run each spec
  # otherwise there might be out-of-date testing
  Dir["#{Rails.root}/app/controllers/*.rb"].each do |controller|
    load controller
  end

  Dir["#{Rails.root}/app/models/*.rb"].each do |model|
    load model
  end

  # Reload factories
  FactoryGirl.factories.clear
  Dir.glob("#{::Rails.root}/spec/factories/*.rb").each { |file| load "#{file}" }
end

