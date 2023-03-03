class HomeController < ApplicationController
  def index
    @products     =Product.all;
    #chọn sản phẩm sắp xếp theo id ( sản phẩm mới)
    @productsAccessoriess =Product.where('pro_active',1)
    .where(pro_category: "20")
    .order(pro_pay: :desc)
    .limit(10)

    # chọn sản phẩm sắp xếp theo hot (sản phẩm hot)
    @productsGlass=Product::where('pro_active',1)
     .where(pro_category: 10)
     .where(pro_category: 21)
    .order(pro_pay: :desc)
    .limit(10)

    # chọn sản phẩm sắp xếp theo hot (sản phẩm hot)
    $productsWatch =Product::where('pro_active',1)
         .where(pro_category: 11)
    .order(pro_pay: :desc)
        .limit(10)

    $listProduct1 =Product::where('pro_active',1)
     .where(pro_category: 1)
    .order(pro_pay: :desc)
    .limit(10)

    $listProduct2 =Product::where('pro_active',1)
     .where(pro_category: 2)
    .order(pro_pay: :desc)
    .limit(10)

    $listProduct3 =Product::where('pro_active',1)
     .where(pro_category: 3)
    .order(pro_pay: :desc)
    .limit(10)

    $listProduct4 =Product::where('pro_active',1)
     .where(pro_category: 4)
    .order(pro_pay: :desc)
    .limit(10)

    $listProduct5 =Product::where('pro_active',1)
     .where(pro_category: 5)
    .order(pro_pay: :desc)
    .limit(10)

    $listProduct6 =Product::where('pro_active',1)
     .where(pro_category: 6)
    .order(pro_pay: :desc)
    .limit(10)

    $listProduct7 =Product::where('pro_active',1)
     .where(pro_category: 7)
    .order(pro_pay: :desc)
    .limit(10)

  end
end
