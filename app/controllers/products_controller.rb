class ProductsController < ApplicationController
  before_filter :increment_views, :only => [:show]
  
  def index
    @title = 'Matieres'
    @products, @paginator = Product.alpha_scope :name, params[:ltr]
  end
  
  def show
    @product = Product.find(params[:id])
    @title = @product.name
  end
  
  def new
    @product = Product.new
    @title = "Ajouter"
  end
  
  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to root_path
    else
      @title = "Ajouter"
      render 'new'
    end
  end
  
  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Matiere detruite."
    redirect_to root_path
  end
  
  private
  
  def increment_views
    @product = Product.find(params[:id])
    @product.increment!(:views)
  end
    
end
