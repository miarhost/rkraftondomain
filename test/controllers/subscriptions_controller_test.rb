require 'test_helper'

class SubscriptionsControllerTest < ActionDispatch::IntegrationTest

setup do
 @subscription = subscriptions(:one)
end

should "create subscription" do
 assert_difference('Subscrtiptions.count')
 post_subscriptions_url , params: { email: @subscription.email }
 assert_responce :success 
 end

end
