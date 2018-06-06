module ApplicationHelper

	def full_title(page_title = '')
		base_title = 'Rkraftcomua'
	 if page_title.empty? 
		base_title
	 else
	 	page_title + " | " + base_title
	 end
    end

    def hidden_div_if(condition, attributes = {}, &block)
    	if condition 
    		attributes["style"] = "display:none"
    	end
    	content_tag("div", attributes, &block)
    end

    def gravatar_for(user, size)
     gravatar_id = Digest::MD5.hexdigest(user.email)
     gravatar_url =  "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
     image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end

end
