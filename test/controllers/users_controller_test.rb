require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @doctor = users(:doctor)
  end

  test 'should get index' do
    log_in_as @doctor
    assert is_logged_in?

    get users_url
    assert_response :success
  end

  test 'should get show' do
    log_in_as @doctor
    assert is_logged_in?

    get user_url(@doctor)
    assert_response :success
  end

  test 'should get new' do
    get signup_url
    assert_response :success
  end

  test 'should get edit' do
    log_in_as @doctor
    assert is_logged_in?

    get edit_user_url(@doctor)
    assert_response :success
  end

end
