require 'test_helper'

class MenuTest < ActiveSupport::TestCase

  def setup
    @menu = Menu.new(name:"test",price:100,commitment:"testa;sdlkfja;sldkfj ;lksdjf",allergy:"卵")
  end

  test "should be valid" do
    assert @menu.valid?
  end

  test "name should be present" do
    @menu.name = " "
    assert_not @menu.valid?
  end

  test "price should be present" do
    @menu.price = nil
    assert_not @menu.valid?
  end

  test "commitment should be present" do
    @menu.commitment = " "
    assert_not @menu.valid?
  end

  test "allergy should be present" do
    @menu.allergy = " "
    assert_not @menu.valid?
  end
end
