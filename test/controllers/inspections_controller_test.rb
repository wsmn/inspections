require 'test_helper'

class InspectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inspections_index_url
    assert_response :success
  end

end
