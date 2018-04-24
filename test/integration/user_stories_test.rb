require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
 fixtures :products
 include ActiveJob::test_helper

 test "buying a product" do
 	start_order_count = Order.count
 	ordered_item = products(:product)

 	get "/"
 	assert_responce :success
 	assert_select 'h1', "Products"

 	post '/line_items', params: { product_id: ordered_item.id }, xhr: true
 	assert_responce :success

 	cart = Cart.find(session[:cart_id])
 	assert_equal 1, cart.line_items.size
 	assert_equal ordered_item, cart.line_items[0].product

 	get "/orders/new"
 	assert_responce :success
 	assert_select 'legend', 'Please Enter Your Details'

 	perform_enqueued_jobs do 
 		post "/orders", params: {
 			order: {
 				name: "Sam Myers",
 				address: "1234 The Country",
 				email: "example@example.com",
 				pay_type: "Check"
 			}
 		}
 	follow_redirect!

 	assert_responce :success
 	assert_select 'h1', "Products"
 	cart = Cart.find(session[:cart_id])
 	assert_equal 0 cart.line_items.size

 	assert_equal start_order_count +1, Order.count
 	order = Order.last

 	assert_equal "Sam Myers", order.name
 	assert_equal "1234 The Country", order.address
 	assert_equal "example@example.com", order.email
 	assert_equal "Check", order.pay_type
 	assert_equal 1, order.line_items.size
 	line_item = order.line_items[0]
 	assert_equal ordered_item, line_item.product

 	mail = ActionMailer::Base.deliveries.last
 	assert_equal ["example@example.com"], mail.to
    assert_equal 'Rghost <rghostme@gmail.com>', mail[:from].value
    assert_equal "Rkraftcomua Order Confirmation", mail.subject
   end
  end
end
