class ListsController < ApplicationController

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:success] = "List successfully created"
      redirect_to lists_path
    else
      flash[:danger] = "Invalid entry"
      render :new
    end
  end

  def index
    @lists = List.all
  end

  def show
    @tags = Tag.all
    @list = List.find(params[:id])
    @tasks = @list.tasks.current
    @complete_tasks = @list.tasks.complete
    @future_tasks = @list.tasks.future
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to lists_path
    else
      flash[:danger] = "Invalid entry"
      render :edit
    end
  end

  def destroy
    list = List.find(params[:id])
    list.tasks.each do |task|
      task.destroy
    end
    list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:title, :description)
  end

end
