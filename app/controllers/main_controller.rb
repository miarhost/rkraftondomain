class MainController < ApplicationController


  def home
    
  end

  def catalog
    @products = Product.all
  end

  def services
  end

  def contacts
  end

  def gallery
    @images = Image.paginate(:page => params[:page], :per_page => 15)
  end
  
end
