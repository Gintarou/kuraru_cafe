require 'test_helper'

class LunchMenusTest < ActionDispatch::IntegrationTest

  def setup
    @lunch = lunch_menus(:lunch)
  end

  #adminのときで考える 直さなくてもテストはパスする
  test "lunch edit page should redirected to root page when not logged in" do
    get edit_lunch_menu_path(@lunch)
    assert_redirected_to root_path
  end
end
