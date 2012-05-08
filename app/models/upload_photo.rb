# encoding: utf-8 
class UploadPhoto < ActiveRecord::Base  
  belongs_to :user
  has_many :comments
 
  validates_presence_of :photoURL, :message => "图像地址不能为空"


  #validates_format_of :photoURL.content_type.chomp, :with => /image/, :message => "必须以图片格式的图像"
end
