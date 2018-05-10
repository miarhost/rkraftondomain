class MainController < ApplicationController


  def home
    @subscription = Subscription.new
  end

  def catalog
    @products = Product.all
  end

  def services
  end

  def contacts
    @inquiry = Inquiry.new
    @inquiries = Inquiry.all
  end

  def gallery
    @images = Image.paginate(:page => params[:page], :per_page => 15)
  end
  
end
