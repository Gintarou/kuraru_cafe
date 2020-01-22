require 'test_helper'

class MorningMenusTest < ActionDispatch::IntegrationTest

  def setup
    @morning = morning_menus(:morning)
  end

  test "morning edit page should redirected to login page when not logged in" do
    get edit_morning_menu_path(@morning)
    assert_redirected_to login_path
  end
end
