class TagsController < ApplicationController

  def index
      @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = "Tag successfully created"
      redirect_to tags_path
    else
      flash[:danger] = "Invalid entry"
      render :new
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end

end
