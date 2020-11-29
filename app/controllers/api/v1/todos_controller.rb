class Api::V1::TodosController < ApplicationController

  def index
    # todos = Todo.where(user_id: @current_user.id).order('task ASC')
    todos = @current_user.todos.order('date ASC')
    render json:{data: todos}
  end

  def create
    errors = []
    errors << 'Please specify task' if params[:task].blank?

    if errors.empty?
      begin
        todo = Todo.new
        todo.task = params[:task] if params[:task]
        todo.scheduled_at = params[:scheduled_at] if params[:scheduled_at]
        todo.date = params[:date] if params[:date]
        todo.status = params[:status] if params[:status]

        todo.user = @current_user

        todo.save!
        render json: {success: 'Task successfully saved', task: todo}
      rescue Exception => e
        errors << e.message
        render json: {error: true, errors: errors}
      end
    else
      render json: {error: true, errors: errors}
    end

  end

  def update
    errors = []
    errors << 'Please specify task to edit' if params[:id].blank?
    errors << 'Please specify task' if params[:task].blank?

    if errors.empty?
      begin
        todo = Todo.find(params[:id])

        todo.task = params[:task] if params[:task]
        todo.scheduled_at = params[:scheduled_at] if params[:scheduled_at]
        todo.date = params[:date] if params[:date]
        todo.status = params[:status] if params[:status]

        todo.save!
        render json: {success: 'Task successfully updated', task: todo}
      rescue Exception => e
        errors << e.message
        render json: {error: true, errors: errors}
      end
    else
      render json: {error: true, errors: errors}
    end
    
  end

  def show
    errors = []
    todo = Todo.find(params[:id])
    errors << 'Task specified does not exist' if todo.nil?

    if errors.empty?
      begin
        render json:{task: todo}
      rescue Exception => e
        errors << e.message
        render json: {error: true, errors: errors}
      end
    else
      render json: {error: true, errors: errors}
    end

  end

  def destroy
    errors = []
    errors << 'Please specify task to delete' if params[:id].blank?

    if errors.empty?
      begin
        todo = Todo.find(params[:id])
        todo.destroy

        render json: {success: 'Todo successfully deleted'}
      rescue Exception => e
        errors << e.message
        render json: {error: true, errors: errors}
      end    
    else
      render json: {error: true, errors: errors}
    end

  end

  def mark_as_complete
    errors = []
    errors << 'Please specify task to mark as complete' if params[:todo_id].blank?

    if errors.empty?
      begin
        todo = Todo.find(params[:todo_id])
        todo.status = 'Completed'

        todo.save!
        render json: {success: 'Todo successfully completed', task: todo}
      rescue Exception => e
        errors << e.message
        render json: {error: true, errors: errors}
      end    
    else
      render json: {error: true, errors: errors}
    end
  end

  def get_todos_count
    # todos = Todo.where.not(status: 'Completed').count
    todos = @current_user.todos.where.not(status: 'Completed').count
    render json: {_count: todos}
  end

end