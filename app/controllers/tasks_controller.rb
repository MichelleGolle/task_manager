class TasksController < ApplicationController
  respond_to :json

  def index
    list = List.find(params[:list_id])
    @tasks = list.tasks.where(completed: false)
  end

  def show
    list = List.find(params[:list_id])
    @task = list.tasks.find(params[:id])
  end

  def new
    @tags = Tag.all
    @list = List.find(params[:list_id])
    @task = Task.new
  end

  def create
    list = List.find(params[:list_id])
    @task = list.tasks.new(task_params)
    if @task.save
      assign_tags
      flash[:notice] = "Task successfully created"
      redirect_to list_path(list)
    else
      @tags = Tag.all
        render :new
    end
  end

  def edit
    @tags = Tag.all
    list = List.find(params[:list_id])
    @task = list.tasks.find(params[:id])
  end

  def update
    list = List.find(params[:list_id])
    @task = list.tasks.find(params[:id])
    if @task.update(task_params)
      assign_tags
      redirect_to list_path(list)
    else
      @tags = Tag.all
      flash[:notice] = "Invalid entry"
      render :edit
    end
  end

  def change_status
    task = Task.find(params[:task_id])
    task.completed = params[:completed]
    if task.save
      respond_with Task.find(params[:task_id])
    else
      respond_with({errors => task.errors}, :status => 422, :location => list_path(task.list_id))
    end
  end

  private

  def task_params
    params.require(:task).permit(:title,
                                 :completed,
                                 :notes,
                                 :due_date,
                                 :start_date,
                                 :list_id
                                 )
  end

  def assign_tags
    tags = params[:task][:tag_ids].reject(&:empty?)
    tags.each do |id|
      @task.tags << Tag.find(id) unless @task.tags.include?(Tag.find(id))
    end
  end


end
