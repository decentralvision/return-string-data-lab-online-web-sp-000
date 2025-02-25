class ProductsController < ApplicationController
    
    def new
        @product = Product.new
    end

    def create
        product_hash = params["product"]
        @product = Product.create(product_params)
        redirect_to products_path
    end

    def index
        @products = Product.all
    end

    def inventory
        @product = Product.find(params["id"])
        if @product.inventory.to_i > 0
            render plain: "true"
        else
            render plain: "false"
        end
    end

    def description
        @product = Product.find(params["id"])
        render plain: @product.description
    end

    private

    def product_params
      params.require(:product).permit(:description, :inventory, :name, :price)
    end

end
