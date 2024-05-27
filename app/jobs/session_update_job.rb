
class SessionUpdateJob < ApplicationJob
    # push the instances into default queue
    queue_as :default
  
    # method to update active sessions where expires_at time has passed
    # entry point
    def perform(*args)
      ActiveSession.where("expires_at < ?", Time.current.utc ).update_all(active: false)
    end
  end
  