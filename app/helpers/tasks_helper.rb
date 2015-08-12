module TasksHelper

  def check_box_checked?(task)
    task.completed == true
  end

end
