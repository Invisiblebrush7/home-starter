require 'test_helper'

class FurnituresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get furnitures_index_url
    assert_response :success
  end

  test "should get show" do
    get furnitures_show_url
    assert_response :success
  end

  test "should get new" do
    get furnitures_new_url
    assert_response :success
  end

  test "should get create" do
    get furnitures_create_url
    assert_response :success
  end

  test "should get edit" do
    get furnitures_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get furnitures_destroy_url
    assert_response :success
  end

end
