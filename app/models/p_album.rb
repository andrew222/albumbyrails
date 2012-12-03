# encoding: utf-8 
class PAlbum
	include Mongoid::Document
  include Mongoid::Timestamps

 	field :album_name
 	field :album_description
 	field :user_id

	validates_presence_of :album_name, :presence => true, :message => "不能为空"
	validates_uniqueness_of :album_name, :uniqueness => true, :message => "必须唯一"

 	# belongs_to :user_id
end
