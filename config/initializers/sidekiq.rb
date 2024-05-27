# extension for sidekiq to use the scheduler
require 'sidekiq/scheduler'

# sidekiq configuration, when the server starts
# scheduler has a hash of name of the action and detials of schedule
Sidekiq.configure_server do |config|
  config.on(:startup) do
    Sidekiq.schedule = {
      'session_update' => {
        'cron' => '*/3 * * * *', # Runs every 3 minutes
        'class' => 'SessionUpdateJob'
      }
    }
    # used to reload the schedule if its config changes dynamically
    Sidekiq::Scheduler.reload_schedule!
  end
end
