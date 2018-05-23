class EmailProcessor

 def initialize(email)
  @email = email
 end


 def process(inquiry)
  @inquiry = Inquiry.find_by_email(inquiry_params[:email])
  reply_to = env['CLOUDMAILIN_FORWARD_ADDRESS']

 end

end