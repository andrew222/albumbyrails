require 'spec_helper'

describe "p_albums/edit.html.haml" do
  before(:each) do
    assign(:p_album, stub_model(PAlbum,
      :name => "name",
      :description => "description"
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
    view.stub!(:allAlbum).and_return('')
    render
  end

  it "renders the edit p_album form" do
    rendered.should have_selector("form[method='post']") do |form|
      form.should have_selector("input#p_album_album_name[type='text']")
      form.should have_selector("input#p_album_album_description[type='textarea']")
    end
  end
end
