class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email
  field :name
  field :hashed_password
  field :salt

  # has_many :p_albums, dependent: :delete

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def to_s
    "#{email}"
  end

  attr_protected :_id, :salt

  attr_accessor :password, :password_confirmation

  def password=(pass)
    @password = pass
    self.salt = User.random_string(10) if !self.salt?
    self.hashed_password = User.encrypt(@password, self.salt)
  end

  def self.authenticate(name, pass)
    user = where(name: name).first
    return nil if user.nil?
    return user if User.encrypt(pass, user.salt)==user.hashed_password
    nil
  end
  
  protected
  
  def self.random_string(len)
   #generate a random password consisting of strings and digits
   chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
   newpass = ""
   1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
   return newpass
  end

  def self.encrypt(pass, salt)
    Digest::SHA1.hexdigest(pass+salt)
  end
end