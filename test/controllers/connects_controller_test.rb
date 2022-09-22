require "test_helper"

class ConnectsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get connects_destroy_url
    assert_response :success
  end
end
