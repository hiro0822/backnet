require "test_helper"

class ChatmessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chatmessages_index_url
    assert_response :success
  end
end
