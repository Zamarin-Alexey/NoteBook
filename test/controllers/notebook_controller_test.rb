require "test_helper"

class NotebookControllerTest < ActionDispatch::IntegrationTest
  test "should get my_notes" do
    get notebook_my_notes_url
    assert_response :success
  end
end
