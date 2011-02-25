# -*- encoding : utf-8 -*-

require 'database_cleaner'
require 'database_cleaner/cucumber'

# DatabaseCleaner configuration for the test enviroment
DatabaseCleaner[:active_record, :connection => :nucest_test].clean_with :truncation

# DatabaseCleaner.strategy para testes com javascript DEVE ser :truncation e de
# sem javascript é :transaction pois roda bem mais rápido que o :truncation.
DatabaseCleaner.strategy = (ENV['SELENIUM'] == 'true') ? :truncation : :transaction

