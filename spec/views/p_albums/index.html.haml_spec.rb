#encoding: utf-8
require 'spec_helper'

describe "p_albums/index.html.haml" do
	before(:each) do
		signed_in_as_a_valid_user
		visit '/p_albums'
	end
	
	context 'page' do
		subject { page }
		it { should have_selector('h2', text: '所有相册') }
		it { should have_selector('a', text: '创建新相册+') }
		it { should have_selector('th', text: '相册名称') }
		it { should have_selector('th', text: '相册描述') }
		it { should have_selector('th', text: '操作') }

	end

end