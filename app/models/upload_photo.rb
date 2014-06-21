# encoding: utf-8 
class UploadPhoto
	include Mongoid::Document
  include Mongoid::Timestamps

 	field :title
 	field :description
 	field :photoURL
 	field :albumBelongTo
<<<<<<< HEAD
=======
 	
>>>>>>> railsPro
  belongs_to :p_album
  has_many :comments, dependent: :delete
 
  validates_presence_of :photoURL, :message => "图像地址不能为空"
  validates_format_of :photoURL.content_type.chomp, :with => /image/, :message => "必须以图片格式的图像"
  
  mount_uploader :avatar, AvatarUploader
end
