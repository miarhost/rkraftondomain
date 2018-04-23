class SubscriptionMailer < ApplicationMailer
	default from: "rghostme@gmail.com"

	def subscribe(email_address)
	mail(to: email_address, subject: "You got a subscription")
    end 
    
end
