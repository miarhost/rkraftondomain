require 'email_processor'

class InquiriesController < ApplicationController
    
    #before_action :set_inquiry, only: [:create]
	skip_before_action :verify_authenticity_token

def new
@inquiry = Inquiry.new
end

def create
 @inquiry = Inquiry.new(inquiry_params) 
   if @inquiry.save
   	flash[:success] = "Your inquiry is sent"
   	#InquiryMailer.receive(inquiry_params[:email]).deliver_later
   	#EmailProcessor.process(inquiry_params[:email])
   	redirect_to home_path
   end
end





#def set_inquiry 
#@inquiry = Inquiry.find(params[:id])
#end
def inquiry_params
 params.require(:inquiry).permit(:email, :first_name, :second_name, :subject, :message)
end

end
