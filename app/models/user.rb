<<<<<<< HEAD
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :p_album, :dependent => :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
=======
class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email
  field :name
  field :hashed_password
  field :salt

  has_many :p_albums, dependent: :delete
>>>>>>> railsPro

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  validates :name, :presence => true, :uniqueness => true
  validates :password,  presence: true, confirmation: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "invalid email"
  validates_uniqueness_of :email, message: "is already taken"
  
  def to_s
    self.name
  end

  attr_protected :_id, :salt

  attr_accessor :password, :password_confirmation

  def password=(pass)
    unless pass.nil?
      @password = pass
      self.salt = User.random_string(10) if !self.salt?
      self.hashed_password = User.encrypt(@password, self.salt)
    end
  end

  def self.authenticate(name, pass)
    unless name.nil? or pass.nil?
      user = where(name: name).first
      return nil if user.nil?
      return user if User.encrypt(pass, user.salt)==user.hashed_password
      nil
    end
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
