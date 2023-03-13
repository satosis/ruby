class ProductsController < ApplicationController
  # before_action :authorized_json, only: [:favourite]


  def show
    @product = Product.find_by(pro_slug: params[:id])
  end

  def favourite
    @product = Product.find(params[:id])
    if (!@product)
      return response(['messages' => 'Không tồn tại sản phẩm']);
    end

    @userFavourite = UserFavourite.where('user_id': current_user.id, 'product_id': @product.id)
  end
end
