# encoding: utf-8 
class PAlbum
	include Mongoid::Document
  include Mongoid::Timestamps

 	field :album_name
 	field :album_description

	validates_presence_of :album_name, :presence => true, :message => "不能为空"
	validates_uniqueness_of :album_name, :uniqueness => true, :message => "必须唯一"

 	has_many :upload_photos, dependent: :delete
 	# belongs_to :user
 	
end
