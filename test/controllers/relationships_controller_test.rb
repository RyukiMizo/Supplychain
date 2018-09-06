require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "create should require logged-in user"
  assert_no_difference 'Relationship.count' do
    post relationships_path
  end
  assert_redirected_to login_url
  
  test "delete should require logged-in user"
  assert_no_difference 'Relationship.count' do
    delete relationship_path(relatioinships(:one))
  end
end
