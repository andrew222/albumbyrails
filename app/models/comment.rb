# encoding: utf-8 
class Comment
	include Mongoid::Document
  include Mongoid::Timestamps

	field :text
	field :upload_photo_id
	field :post_time

  belongs_to :user
  
  validates_presence_of :text, :message => "不能为空"
end
