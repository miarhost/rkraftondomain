class EmailProcessor

 def initialize(email)
  @email = email
  @to = env['CLOUDMAILIN_FORWARD_ADDRESS']
 end


 def process
   inquiry = Inquiry.find_by_email(@email.from[:email])
@email.to(
subject: @email.subject,
body: @email.body 
)
 end

end