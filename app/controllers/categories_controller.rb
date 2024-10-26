class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @today = Task.where(due_date: Date.today)
  end

  def show
    @category = Category.find(params[:id])
    @category_tasks = @category.tasks
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to @category
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy 
    @category = Category.find(params[:id])
    @category.destroy

    redirect to root_path, status: :see_other
  end

  private 
    def category_params
      params.require(:category).permit(:category_name, :details)
    end
end
