# encoding: utf-8 
<<<<<<< HEAD
class Comment
	include Mongoid::Document
  include Mongoid::Timestamps

	field :text
	field :upload_photo_id
	field :post_time
	field :user_id

=======
class Comment < ActiveRecord::Base
  belongs_to :user
>>>>>>> 071f4fc9d905202194eb51a42654f30db5e438f5
  belongs_to :upload_photo
  
  validates_presence_of :text, :message => "不能为空"
end
