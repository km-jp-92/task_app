class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :complete]

  def index
    @tasks = current_user.tasks.pending.order(due_date: :asc)
  end

  def show; end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Todoを作成しました", status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Todoを更新しました", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    flash.now[:notice] = "Todoを削除しました"
  end

  def complete
    @task.completed!
    flash.now[:notice] = "Todoを完了しました"
  end

  def high_priority
    @tasks = current_user.tasks.pending.high.order(due_date: :asc)
    render :index
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :due_date, :priority)
  end
end
