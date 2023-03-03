# config/initializers/sidekiq_scheduler.rb
require 'sidekiq'
require 'sidekiq-scheduler'

puts "Initializing sidekiq scheduler"


Sidekiq.configure_server do |config|
  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file(File.expand_path('../scheduler.yml', __FILE__))
    SidekiqScheduler::Scheduler.instance.reload_schedule!
  end
end
