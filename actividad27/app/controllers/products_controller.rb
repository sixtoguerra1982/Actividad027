class ProductsController < ApplicationController

	def create
		@product = Product.new(product_params)
		respond_to do |format|
	      	if @product.save
	        	format.html { redirect_to @product.category, notice: 'Product was successfully created.' }
	      	else
	        	format.html { render :new }
	      	end
      	end
   	end

   	def destroy
   		@product = Product.find(params[:id])
   		@product.destroy
    	respond_to do |format|
      		format.html { redirect_to @product.category, notice: 'Movie was successfully destroyed.' }
      	end
    end
  

	private
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :category_id)
	end

end