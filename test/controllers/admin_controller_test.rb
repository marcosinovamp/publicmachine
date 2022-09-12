require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get admin_home_url
    assert_response :success
  end

  test "should get unidade" do
    get admin_unidade_url
    assert_response :success
  end
end
