class EmailProcessor

 def initialize(email)
  @email = email
 end


 def process(inquiry)
  @inquiry = Inquiry.find_by_email(inquiry_params[:email])
   to:       { full: 'rghostme@gmail.com',
       email: 'rghostme@gmail.com',
        token: 'to_smtp',
        host: 'gmail.com',
        name: nil }
  subject: @email.body 
  body: @email.subject 
 end

end