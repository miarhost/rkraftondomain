class InquiryMailer < ApplicationMailer
	default from: "rghostme@gmail.com"

	def inquire(email_address)
		mail to:(email_address, subject: "Your inquiry is sent")
	end

end
