class MainController < ApplicationController

  include CurrentCart
  before_action :set_cart
  def home
    @products = Product.order(:title)
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
