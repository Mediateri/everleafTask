class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  def index
    if params[:sort_expired]
      @tasks = Task.order('deadline DESC').page(params[:page])
    elsif params[:term]
      @tasks = Task.where('tittle LIKE ? or statuses LIKE ? ', "%#{params[:term]}%", "%#{params[:term]}%").order('id ASC').page(params[:page])
    elsif params[:sort_priority]
      # status is column that is holding priority High,medium and finally low
      @tasks = Task.order('status DESC').page(params[:page])
    else
      @tasks = Task.order('created_at DESC').page(params[:page])
    end
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = current_user.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end
  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:tittle, :content, :deadline, :term, :status, :statuses)
    end
end
