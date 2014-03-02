class Admin::CategoriesController < Admin::ApplicationController
  before_filter :find_category, :only => [:edit, :update, :destroy]
  
  def index
    @categories = Category.page(params[:page])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to admin_categories_path
    else
      render :action => 'edit'
    end
    
  end

  def destroy
    @category.delete
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:code, :name)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
