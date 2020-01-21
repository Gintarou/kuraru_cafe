require 'test_helper'

class MenusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get menus_path
    assert_response :success
  end

end
