#encoding: utf-8
require 'spec_helper'

describe "p_albums/show.html.haml" do
  before(:each) do
    assign(:p_album, stub_model(PAlbum, 
      :album_name => 'name',
      :album_description => 'album_description'
    ))
    render
  end
  subject { rendered }
  it { should have_selector("tr>td", :text => "name")}
  it { should have_selector("tr>td", :text => "album_description")}
  it { should have_selector("a[href='/p_albums']", :text => "后退")}

end
