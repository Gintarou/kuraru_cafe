require 'test_helper'

class MorningMenusTest < ActionDispatch::IntegrationTest

  def setup
    @morning = morning_menus(:morning)
  end

  #adminのときで考える 直さなくてもテストはパスする
  test "morning edit page should redirected to root page when not logged in" do
    get edit_morning_menu_path(@morning)
    assert_redirected_to root_path
  end
end
