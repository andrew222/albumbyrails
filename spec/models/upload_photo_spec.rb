# spec/models/upload_photo.rb
require 'spec_helper'

describe UploadPhoto do
	before(:each) do
	end
	it { should belong_to(:p_album) }
end