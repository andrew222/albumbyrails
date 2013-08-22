class ApplicationController < ActionController::Base
  helper_method :current_user
  
  def current_user
		session[:current_user]
	end
	def login_required
    if session[:current_user]
      return true
    end

    flash[:error]='Please login to continue'
    redirect_to login_path
    return false 
  end

  def help
    Helper.instance
  end
   
  class Helper
    include Singleton
    include ActionView::Helpers::UrlHelper
  end
  
  private
  
    def format_time
      @now = Time.now
      @now = @now.strftime("%Y-%m-%d %H:%M:%S")
    end
end
