# encoding: utf-8 
class UserMailer < ActionMailer::Base
  default from: "zzcv20051122@gmail.com"

  def alert_email(user)
    @user = user
    mail(to: @user.email, subject: '有新的回复')
  end

  def welcome_email(user)
  	@user = user
  	mail(to: @user.email, subject: "欢迎注册为本站会员")
  end
end
