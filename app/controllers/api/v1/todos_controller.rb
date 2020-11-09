class Api::V1::TodosController < ApplicationController
  def index
    todos = Todo.order('scheduled_at DESC')
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

end
