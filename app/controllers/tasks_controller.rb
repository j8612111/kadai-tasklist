class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "作成成功"
      redirect_to @task
    else
      flash.now[:danger] = '作成失敗'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(message_params)
      flash[:success] = '更新成功'
      redirect_to @task
    else
      flash.now[:danger] = '更新失敗'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    flash[:success] = '削除成功'
    redirect_to messages_url
  end
  
  private
  
  # Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  end
end
