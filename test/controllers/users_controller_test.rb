require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @doctor = users(:doctor)
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should get show' do
    get user_url(@doctor)
    assert_response :success
  end

  test 'should get new' do
    get signup_url
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_url(@doctor)
    assert_response :success
  end

end
