# -*- encoding : utf-8 -*-

Então /^eu devo ter (\d+) supervisores$/ do |quantidade|
  Supervisor.all.should have(quantidade.to_i).supervisor
end

