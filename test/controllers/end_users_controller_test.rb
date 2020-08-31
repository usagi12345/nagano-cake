require 'test_helper'

class EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get end_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get end_users_edit_url
    assert_response :success
  end

  test "should get withdraw" do
    get end_users_withdraw_url
    assert_response :success
  end

  test "should get index" do
    get end_users_index_url
    assert_response :success
  end

end
