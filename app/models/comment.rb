# encoding: utf-8 
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :upload_photo
  
  validates_presence_of :text, :message => "不能为空"
end
