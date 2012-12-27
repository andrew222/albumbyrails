# spec/models/comment.rb
require 'spec_helper'

describe Comment do
	it { should belong_to :upload_photo }
end