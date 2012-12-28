# encoding: utf-8

class SendEmailJob
  @queue = :album_send_email

  def self.perform
    puts 'testtest'
  end
  
end
