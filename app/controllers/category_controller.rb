class CategoryController < ApplicationController
  def index
    @products = Product.where("pro_active": 1)

    if params[:keyword]
      @products = @products.where('pro_name LIKE ?', "%" + params[:keyword] + "%")
    end

    case params[:price]
      when "1"
        @products = @products.where('pro_price < 2000000')
      when "2"
        @products = @products.where('pro_price >= 2000000 AND pro_price < 5000000')
      when "3"
        @products = @products.where('pro_price >= 5000000 AND pro_price < 10000000')
      when "4"
        @products = @products.where('pro_price >= 10000000 AND pro_price < 50000000')
      when "5"
        @products = @products.where('pro_price >= 50000000')
    end

    case params[:sort]
      when "desc"
        @products = @products.order(pro_price: :desc)
      when "asc"
        @products = @products.order(pro_price: :asc)
    end
    @products = @products.paginate(page: params[:page], per_page: 10)
    render "show"
  end

  def show
    @category = Category.find_by(c_slug: params[:id])
    # @category = Category.where("c_slug": params[:id]).first
    @products = Product.where("pro_active": 1)
    if @category
      @products = @products.where(
        "category_id": @category.id,
      )
    end

    @products = @products.paginate(page: params[:page], per_page: 10)
  end

end
