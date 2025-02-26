class TodosController < ApplicationController
  before_action :set_user
  def index
    @todos=@user.todos
  end

  def create
    @todo=@user.todos.new(todo_params)
    if @todo.save  # Attempt to save the todo
      redirect_to todos_path, notice: "Todo created successfully."  # Redirect with a success message
     
    end
  end

  def destroy
    @todo=@user.todos.find(params[:id])
    if @todo.destroy
      redirect_to todos_path
    end

  end

  def update
    @todo = @user.todos.find(params[:todo][:id])
    if @todo.update(is_done: params[:todo][:is_done] )
      redirect_to todos_path, notice: "Todo updated successfully."
    else
      flash.now[:alert] = "Error updating todo."
      render :index
    end
  end
  
  private
  
  def set_user
    @user=User.find(session[:user_id])
  end
  def todo_params
    params.require(:todo).permit(:description, :is_done, :user)
  end

end
