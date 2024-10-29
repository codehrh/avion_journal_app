class TasksController < ApplicationController
  def index
    @tasks = Tasks.all
  end

  def show
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @task = @category.tasks.build
  end

  def create
    @category = Category.find(params[:category_id])
    @task = @category.tasks.create(task_params)
    redirect_to category_path(@category)
  end

  def edit
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to category_task_path(@category, @task)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
    @task.destroy
    redirect_to category_path(@category), status: :see_other
  end

  private
    def task_params
      params.require(:task).permit(:task_name, :details, :due_date)
    end
end
