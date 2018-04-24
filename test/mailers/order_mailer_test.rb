require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Rkraftcomua order confirmation", mail.subject
    assert_equal ["marirbua@gmail.com"], mail.to
    assert_equal ["rghostme@gmail.com"], mail.from
    assert_match /1 x Lunch-Box/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Rkraftcomua order shipped", mail.subject
    assert_equal ["marirbua@gmail.com"], mail.to
    assert_equal ["rghostme@gmail.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Lunch-Box<\/td>/, mail.body.encoded
  end

end
