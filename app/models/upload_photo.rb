# encoding: utf-8 
class UploadPhoto
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :description
  field :photoURL
  field :albumBelongTo

  belongs_to :p_album
  has_many :comments, dependent: :delete
 
  validates_presence_of :photoURL, :message => "图像地址不能为空"
end
