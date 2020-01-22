require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Kuraru Cafe"
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "#{@base_title} | About"
  end

  test "should get rental" do
    get rental_path
    assert_response :success
    assert_select "title", "#{@base_title} | Rental"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "#{@base_title} | Contact"
  end
end
