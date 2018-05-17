require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest

setup do
line_item = line_items(:one)	
end

test "should get index" do
	get admins_url
	assert_responce :success
end

test "should get orders number" do
  assert_equal('LineItems.count') do
  end
end

end
