class PagesController < ApplicationController
  def index
    @orders = Order.all
    @products = Product.all
    @users = User.all
  end
end
