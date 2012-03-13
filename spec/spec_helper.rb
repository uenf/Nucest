# -*- encoding : utf-8 -*-

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'remarkable/active_record'
require 'remarkable/active_model'
require 'factory_girl_rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
  config.include Devise::TestHelpers, :type => :controller

  def login_usuario opts={}
    @usuario ||= Factory.create :usuario

    opts.each_pair do |key, value|
      @usuario.update_attribute(key, value)
    end

    sign_in @usuario

    controller.stub(:current_usuario) { @usuario }
  end

  def logout
    sign_out @usuario
  end

  config.include Delorean

  config.use_transactional_fixtures = false

  config.before :each do
    if example.metadata[:js]
      Capybara.server_port = 33333
      Capybara.current_driver = :selenium
    end
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

  def login email, password
    visit root_path
    fill_in 'E-mail', :with => email
    fill_in 'Senha', :with => password
    click_button 'Login'
  end
end

