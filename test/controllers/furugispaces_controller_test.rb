require 'test_helper'

class FurugispacesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get furugispaces_index_url
    assert_response :success
  end

end
