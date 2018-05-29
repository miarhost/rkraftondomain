require 'test_helper'

class SubscriptionMailerTest < ActionMailer::TestCase

test "subscribe" do 
 email = SubscriptionMailer.subscribe("example@usermail.com", Time.now)


assert email 1 do
	email.deliver_now
end

assert_equal ["rghostme@gmail.com"] , email.from
assert_equal ["example@usermail.com"], email.to
assert_equal "You got subscription", email.subject
assert_equal "Hello, your subscription is set on mail example@usermail.com !", email.body.to_s

	
end
end
