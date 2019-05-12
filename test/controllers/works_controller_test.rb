require 'test_helper'

class WorksControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get works_edit_url
    assert_response :success
  end

end
