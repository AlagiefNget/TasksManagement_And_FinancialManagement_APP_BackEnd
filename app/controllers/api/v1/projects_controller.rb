class Api::V1::ProjectsController < ApplicationController

    def index
      projects = @current_user.projects.order('name ASC')
      render json:{data: projects}
    end
  
    def create
      errors = []
      errors << 'Please specify name' if params[:name].blank?
  
      if errors.empty?
        begin
          project = Project.new
          project.name = params[:name].strip if params[:name]
          project.status = params[:status] if params[:status]
          project.description = params[:email].strip if params[:email]
          project.due_date = params[:address].strip if params[:address]
          project.amount = params[:amount].strip if params[:amount]
          
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
      errors << 'Please specify client to edit' if params[:id].blank?
      errors << 'Please specify client name' if params[:name].blank?
      errors << 'Please specify client phone number' if params[:phone_number].blank?
  
      if errors.empty?
        begin
          project = Project.find(params[:id])
          project.name = params[:name].strip if params[:name]
          project.status = params[:phone_number] if params[:phone_number]
          project.description = params[:email].strip if params[:email]
          project.due_date = params[:address].strip if params[:address]
          project.amount = params[:amount].strip if params[:amount]
          project.balance = params[:balance].strip if params[:balance]
         
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
          project = Client.find(params[:id])          
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
  
    def get_client_count
      projects = @current_user.projects.count
      render json: {projects: projects}
    end
  
  end