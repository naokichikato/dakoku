require 'test_helper'

class PepersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pepers_new_url
    assert_response :success
  end

end
