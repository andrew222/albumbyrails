#encoding: utf-8
require 'spec_helper'

describe "p_albums/new.html.haml" do
  before(:each) do
    assign(:p_album, stub_model(PAlbum, 
      :album_name => 'name',
      :album_description => 'album_description'
    ))
    assign(:albums, [
      stub_model(PAlbum,
        :album_name => "Name",
        :album_description => "album_description"
      ),
      stub_model(PAlbum,
        :album_name => "Name",
        :album_description => "album_description"
      )
      ])
    view.stub!(:allAlbum).and_return("")
    render
  end
  subject { rendered }
  it "has form with method=post" do
    should have_selector("form[method='post']") do |form|
      form.should have_selector("input#p_album_album_name[type='text']")
      form.should have_selector("input#p_album_album_description[type='textarea']")
    end
  end
end
