require 'test_helper'

class PAlbumsControllerTest < ActionController::TestCase
  setup do
    @p_album = p_albums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:p_albums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create p_album" do
    assert_difference('PAlbum.count') do
      post :create, :p_album => @p_album.attributes
    end

    assert_redirected_to p_album_path(assigns(:p_album))
  end

  test "should show p_album" do
    get :show, :id => @p_album
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @p_album
    assert_response :success
  end

  test "should update p_album" do
    put :update, :id => @p_album, :p_album => @p_album.attributes
    assert_redirected_to p_album_path(assigns(:p_album))
  end

  test "should destroy p_album" do
    assert_difference('PAlbum.count', -1) do
      delete :destroy, :id => @p_album
    end

    assert_redirected_to p_albums_path
  end
end
