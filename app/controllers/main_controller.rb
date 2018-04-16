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
  end
  
end
