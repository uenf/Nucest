all: clear unit acceptance

acceptance: clear functional javascript

simple: clear unit functional

clear:
	@clear

unit:
	@echo ""
	@echo "========================"
	@echo "Rodando testes unitários"
	@echo "========================"
	@echo ""
	@rspec spec --format progress

functional:
	@echo ""
	@echo "========================="
	@echo "Rodando testes funcionais"
	@echo "========================="
	@echo ""
	@cucumber features --tag ~@javascript --format progress

javascript:
	@echo ""
	@echo "============================"
	@echo "Rodando testes de javascript"
	@echo "============================"
	@echo ""
	@export SELENIUM=true; cucumber features --tag @javascript --format progress

banco:
	@echo "================================"
	@echo "Recriando banco de dados do zero"
	@echo "================================"
	@rake db:drop:all
	@rake db:create:all
	@rake db:migrate
	@sed -i '1 i \# -*- encoding : utf-8 -*-' db/schema.rb

	@[ "$RAILS_ENV" != 'test' ] && rake db:test:prepare && rake db:seed

