require 'test_helper'

class LayoutTestTest < ActionDispatch::IntegrationTest


  def setup
    @user = users(:michael)
  end
  
  test "Layout test with login" do
    log_in_as(@user)
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end
  
  test "Layout test with no login" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
end
