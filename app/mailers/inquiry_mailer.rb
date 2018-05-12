class InquiryMailer < ApplicationMailer

	 default to: "rghostme@gmail.com"
        
 before_action { @inquiry_sender, @inquiry_getter = params[:inquiry_sender], params[:inquiry_getter] }
 before_action :set_inquiry_sender


 def receive(email_address)
 	@email_address = email_address
 	email_address = @inquiry_sender.email_address
 	inquiry = Inquiry.find_by(inquiry_params[:email])
 	inquiry.send to:(@inquiry_getter.email_address)
 end


private

def set_inquiry_sender
params.require(:email)
end


end
