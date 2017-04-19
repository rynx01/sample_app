require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should require logged in user" do
  	get users_path
  	assert_redirected_to login_path
  	# assert_response :redirect
  	# assert_equal current_path, login_path
  end

  test "should allow logged in user" do
  	log_in_as(users(:michael))
  	get users_path
  	assert_response :success
  	# 2xx - success
  	# 301 - redirect
  	# 302 - permanent redirect
  	# 4xx - app is working, wrong parameters
  	# 5xx - server rror
  end

end