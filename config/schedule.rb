# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

#  set :output, '/cron_log.log'

# Example:
#
# set :output, "/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

set :output, {:error => "log/error.log", :standard => "log/cron.log"}

job_type :curl, 'cd :path && curl :url :output'

every 1.days do
  curl 'Findar convênios já vencidos', :url => 'http://localhost:3000/findar_convenios'
end

