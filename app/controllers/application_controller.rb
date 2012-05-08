class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
    def format_time
      @now = Time.now
      @now = @now.strftime("%Y-%m-%d %H:%M:%S")
    end
end
