# encoding: utf-8 
class PAlbum < ActiveRecord::Base
 validates_presence_of :album_name, :presence => true, :message => "不能为空"
 validates_uniqueness_of :album_name, :uniqueness => true, :message => "必须唯一"

 belongs_to :user
end
