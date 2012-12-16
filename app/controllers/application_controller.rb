class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
		session[:current_user]
	end
	def login_required
    if session[:current_user]
      return true
    end

    flash[:warning]='Please login to continue'
    redirect_to :controller => "users", :action => "login"
    return false 
  end
  
  private
  
    def format_time
      @now = Time.now
      @now = @now.strftime("%Y-%m-%d %H:%M:%S")
    end
end
