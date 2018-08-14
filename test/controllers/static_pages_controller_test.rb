require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", "Branding"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | Branding"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | Branding"
  end
  
  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | Branding"
  end
end
