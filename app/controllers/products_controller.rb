class ProductsController < ApplicationController
  def index
    @title = 'Matieres'
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
    @title = @product.name.capitalize
  end
  
  def new
    @product = Product.new
    @title = "Ajouter"
  end
  
  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to products_place, :flash => { :success => "Matiere cree" }
    else
      @title = "Ajouter"
      render 'new'
    end
  end
  
  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Matiere detruite."
    redirect_to products_path
  end
    
end
