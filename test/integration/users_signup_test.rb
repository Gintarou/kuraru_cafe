require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # signup_pathを消したので書く必要なし
  # 念の為残しておく

  # test "invalid signup information" do
  #   get signup_path
  #   assert_no_difference 'User.count' do
  #     post users_path, params: { user: { name:  "",
  #                                        email: "user@invalid",
  #                                        password:              "foo",
  #                                        password_confirmation: "bar" } }
  #   end
  #   assert_template root_path
  # end
  #
  # test "valid signup information" do
  #   get signup_path
  #   assert_difference 'User.count', 1 do
  #     post users_path, params: { user: { name:  "Example User",
  #                                        email: "user@example.com",
  #                                        password:              "password",
  #                                        password_confirmation: "password" } }
  #   end
  #   follow_redirect!
  #   assert_template root_path
  # end
end
