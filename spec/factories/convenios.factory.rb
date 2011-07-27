Factory.define :convenio do |f|
  f.numero '5555'
  f.tipo 1
  f.association :instituicao_id, :factory => :instituicao
end

