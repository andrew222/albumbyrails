class Comment < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :text, :message => "不能为空"
end
