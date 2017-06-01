class ProductsController < ApplicationController
 def index
   @products = Product.all    
 end

 def new
   #doenst need logic
 end

 def create
  product = Product.new(name: params[:name],
                        price: params[:price],
                        description: params[:description]
                        )
  product.save
  flash[:success] = "Product Successfully Created"
  redirect_to "/products/#{product.id}"
 end

 def show
   product_id = params[:id]
   @product = Product.find_by(id: product_id)
  
 end

 def edit
  @product = Product.find(params[:id]) ##same as def show just shorter
 end

 def update
  product = Product.find(params[:id])
  product.assign_attributes(
                            name: params[:name],
                            price: params[:price],
                            description: params[:description]
                            )
  product.save
  flash[:success] = "Product Updated"
  redirect_to "/products/#{product.id}"
 end

 def destroy
  product = Product.find(params[:id])
  product.destroy

  flash[:danger] = "Product Deleted"
  redirect_to "/"

   
 end

end
