class Admin::CategoriesController < Admin::ApplicationController
  def index
    @categories = Category.page(params[:page])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new
    @category.code = params[:category][:code]
    @category.name = params[:category][:name]
    if @category.save
      redirect_to admin_categories_path
    else
      render :action => 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.code = params[:category][:code]
    @category.name = params[:category][:name]
    if @category.update
      redirect_to admin_categories_path
    else
      render :action => 'edit'
    end
    
  end

  def destroy
    @category = Category.find(params[:id])
    @category.delete
    redirect_to admin_categories_path
  end
end
