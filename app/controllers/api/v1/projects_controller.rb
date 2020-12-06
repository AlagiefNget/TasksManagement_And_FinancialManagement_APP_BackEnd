class Api::V1::ProjectsController < ApplicationController

    def index
      projects = @current_user.projects.order('name ASC')
      render json:{projects: projects}
    end
  
    def create
      errors = []
      errors << 'Please specify name' if params[:name].blank?

      if errors.empty?
        begin
          project = Project.new
          project.name = params[:name].strip if params[:name]
          project.status = params[:status] if params[:status]
          project.description = params[:description].strip if params[:description]
          project.due_date = params[:due_date] if params[:due_date]
          project.currency = params[:currency] if params[:currency]
          project.amount = params[:amount].strip.to_f if params[:amount]
          project.balance = params[:balance].strip.to_f if params[:balance]
          
          client = Client.find(params[:client_id])
          raise Exception, "Client does not exist" if client.nil?

          project.client_name = client.name
          project.client = client
  
          project.user = @current_user
  
          project.save!
          render json: {success: 'Project successfully saved', data: project}
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
      errors << 'Please specify project to edit' if params[:id].blank?
      errors << 'Please specify project name' if params[:name].blank?
    
  
      if errors.empty?
        begin
          project = Project.find(params[:id])
          project.name = params[:name].strip if params[:name]
          project.status = params[:status] if params[:status]
          project.description = params[:description].strip if params[:description]
          project.due_date = params[:due_date] if params[:due_date]
          project.currency = params[:currency] if params[:currency]
          project.amount = params[:amount].strip.to_f if params[:amount]
          project.balance = params[:balance].strip.to_f if params[:balance]
         
          client = Client.find(params[:client_id])
          raise Exception, "Client does not exist" if client.nil?

          project.client_name = client.name
          project.client = client
  
          project.user = @current_user
  
          project.save!
          render json: {success: 'Project successfully updated', data: project}
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
      project = Project.find(params[:id])
      errors << 'Project specified does not exist' if project.nil?
  
      if errors.empty?
        begin
          render json:{project: project, success: 'Project successfully loaded'}
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
      errors << 'Please specify project to delete' if params[:id].blank?
  
      if errors.empty?
        begin
          project = Project.find(params[:id])          
          project.destroy
  
          render json: {success: 'Project successfully deleted'}
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
    errors << 'Please specify project to mark as complete' if params[:project_id].blank?

    if errors.empty?
      begin
        project = Project.find(params[:project_id])
        project.status = 'Completed'

        project.save!
        render json: {success: 'Project successfully completed', project: project}
      rescue Exception => e
        errors << e.message
        render json: {error: true, errors: errors}
      end    
    else
      render json: {error: true, errors: errors}
    end
  end
  
  def get_client_count
    projects = @current_user.projects.count
    render json: {projects: projects}
  end

  def get_tiles_data
    total_projects = @current_user.projects.count
    completed_projects = @current_user.projects.where(status: 'Completed').count
    due_projects = @current_user.projects.where(due_date: 5.days.from_now).count
    
    render json:{data: {total_projects: total_projects,completed_projects:completed_projects, due_projects: due_projects}}
  end
  
  end