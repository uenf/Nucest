FactoryGirl.define do
  factory :convenio do
	  numero '5555'
	  tipo 1
	  association :instituicao_id, :factory => :instituicao
	end
end

