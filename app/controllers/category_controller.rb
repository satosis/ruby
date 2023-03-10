class CategoryController < ApplicationController
  def index
  end

  def show
    category = Category.where("c_slug", params[:slug]).first
    @products = Product.where([
      "category" => @category.id,
      "pro_active" => 1,
    ])
  end
end
