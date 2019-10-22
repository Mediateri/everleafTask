class TasksController < ApplicationController
  before_action :authorize
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if params[:sort_expired]
      @tasks = Task.order('deadline DESC').page(params[:page])
    elsif params[:term]
      @tasks = Task.where('tittle LIKE ? or statuses LIKE ? ', "%#{params[:term]}%", "%#{params[:term]}%").order('id ASC').page(params[:page])
    else
      @tasks = Task.order('created_at DESC').page(params[:page])
    end
  end

  def show
  end

  def new
    @task = current_user.tasks.build
  end

  def edit
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:tittle, :content, :deadline, :term, :status, :statuses, :admin)
    end
end
