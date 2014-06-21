# encoding: utf-8

class SendEmailJob
  @queue = :send_email_job

  def self.perform(email_type, user_id)
  	@user = User.where(id: user_id).first
  	if email_type.downcase == "welcome"
  		UserMailer.welcome_email(@user).deliver
  	end
  end
end
