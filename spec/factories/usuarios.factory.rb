# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :usuario do
  	email "teste@nucest.uenf.br"
  	password "nucest123"
  	password_confirmation "nucest123"
  end
end

