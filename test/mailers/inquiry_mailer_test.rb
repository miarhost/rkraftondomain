require 'test_helper'

class InquiryMailerTest < ActionMailer::TestCase

test "inquiry" do
 	email = InquiryMailer.reply("rghostme@gmail.com", "example@usermail.com", :deliver_later)
 	assert email 1 do
 	email.deliver_later
   end

   assert_equal ["rghostme@gmail.com"], email.from
   assert_equal ["example@usermail.com"], email.to
   assert_equal "Your inquiry is sent", email.subject
   assert_equal "We got your inquiry and will process it as soon as possible!", email.body.to_s
end
	

end
