require 'test_helper'

class StaticPagesTest < ActionDispatch::IntegrationTest

  test "get top page" do
    get root_path
    assert_template root_path
    assert_select "a[href=?]", root_path, count: 4
    assert_select "a[href=?]", about_path, count: 4
    assert_select "a[href=?]", menus_path, count: 4
    assert_select "a[href=?]", rental_path, count: 3
    assert_select "a[href=?]", new_path, count: 0
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", "https://www.facebook.com/pages/Kuraru-Cafe/2372997022732741", count:4
    assert_select "a[href=?]", "tel:06-7713-0045", count:2
    assert_select "a[href=?]", "https://twitter.com/x0snxwlpr1cxkxz", count: 1
    assert_select "a[href=?]", "https://www.instagram.com/kurarucafe_official/?hl=tr", count: 1
  end

  test "get about page" do
    get about_path
    assert_select "a[href=?]", root_path, count: 4
    assert_select "a[href=?]", about_path, count: 3
    assert_select "a[href=?]", menus_path, count: 3
    assert_select "a[href=?]", rental_path, count: 3
    assert_select "a[href=?]", new_path, count: 0
    assert_select "a[href=?]", logout_path,
    count: 0
    assert_select "a[href=?]", "https://www.facebook.com/pages/Kuraru-Cafe/2372997022732741", count: 4
    assert_select "a[href=?]","tel:06-7713-0045", count: 1
    assert_select "a[href=?]", "https://twitter.com/x0snxwlpr1cxkxz", count: 1
    assert_select "a[href=?]", "https://www.instagram.com/kurarucafe_official/?hl=tr", count: 1
  end

  test "get rental page" do
    get about_path
    assert_select "a[href=?]", root_path, count: 4
    assert_select "a[href=?]", about_path, count: 3
    assert_select "a[href=?]", menus_path, count: 3
    assert_select "a[href=?]", rental_path, count: 3
    assert_select "a[href=?]", new_path, count: 0
    assert_select "a[href=?]", logout_path,
    count: 0
    assert_select "a[href=?]", "https://www.facebook.com/pages/Kuraru-Cafe/2372997022732741", count: 4
    assert_select "a[href=?]","tel:06-7713-0045", count: 1
    assert_select "a[href=?]", "https://twitter.com/x0snxwlpr1cxkxz", count: 1
    assert_select "a[href=?]", "https://www.instagram.com/kurarucafe_official/?hl=tr", count: 1
  end
end
