require 'test_helper'

class LunchMenusTest < ActionDispatch::IntegrationTest

    def setup
      @lunch = lunch_menus(:lunch)
    end

    test "lunch edit page should redirected to login page when not logged in" do
      get edit_lunch_menu_path(@lunch)
      assert_redirected_to login_path
    end
end
