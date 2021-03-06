require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_redirected_to root_path
    follow_redirect!
    assert_template root_path
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", new_path
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_path
    follow_redirect!
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", new_path, count: 0
  end

  #adminのときで考える 直さなくてもテストはパスする
  test "new page should redirect to root page when not logged in" do
    get new_path
    assert_redirected_to root_path
  end

  #adminのときで考える 直さなくてもテストはパスする
  test "morning new page should redirect to root page when not logged in" do
    get new_morning_menu_path
    assert_redirected_to root_path
  end

  #adminのときで考える 直さなくてもテストはパスする
  test "lunch new page should redirect to root page when not logged in" do
    get new_lunch_menu_path
    assert_redirected_to root_path
  end

  #adminの時で考える 直さないとテストはパスしない
  test "should get new page with logged in" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_redirected_to root_path
    follow_redirect!
    assert_template root_path
    get new_path
    assert_template 'menu/new'
  end

  #adminの時で考える 直さないとテストはパスしない
  test "should get morning new page with logged in" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_redirected_to root_path
    follow_redirect!
    assert_template root_path
    get new_morning_menu_path
    assert_template 'morning_menus/new'
  end

  #adminの時で考える 直さないとテストはパスしない
  test "should get lunch new page with logged in" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_redirected_to root_path
    follow_redirect!
    assert_template root_path
    get new_lunch_menu_path
    assert_template 'lunch_menus/new'
  end
end
