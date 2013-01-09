#encoding: utf-8
require 'spec_helper'

describe "p_albums/index.html.haml" do
	before(:each) do
		assign(:p_albums, [
      stub_model(PAlbum,
        :album_name => "Name",
        :album_description => 'album_description'
      ),
      stub_model(PAlbum,
        :name => "Name",
        :album_description => 'album_description1'
      )
    ])
    render
	end

	subject { rendered }
	it { should have_selector('h2', text: '所有相册') }
	it { should have_selector('a', text: '创建新相册+') }
	it { should have_selector('th', text: '相册名称') }
	it { should have_selector('th', text: '相册描述') }
	it { should have_selector('th', text: '操作') }
	# it { should have_selector("tr>td", :text => "Name".to_s, :count => 2) }
end