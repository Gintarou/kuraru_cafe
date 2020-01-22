require 'test_helper'

class MenuControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Kuraru Cafe"
  end

  test "should get index" do
    get menus_path
    assert_response :success
    assert_select "title", "#{@base_title} | Menu"
  end
end
