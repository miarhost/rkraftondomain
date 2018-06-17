class EmailProcessor

 def initialize(email)
  @email = email
 end


 def process(inquiry)
  @inquiry = Inquiry.find_by_email(inquiry_params[:email])

 end

end