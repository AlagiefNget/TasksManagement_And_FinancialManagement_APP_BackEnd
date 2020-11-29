class Api::V1::ClientsController < ApplicationController

    def index
      clients = @current_user.clients.order('name ASC')
      render json:{data: clients}
    end
  
    def create
      errors = []
      errors << 'Please specify name' if params[:name].blank?
      errors << 'Please specify client phone number' if params[:phone_number].blank?
  
      if errors.empty?
        begin
          client = Client.new
          client.name = params[:name].strip if params[:name]
          client.phone_number = params[:phone_number] if params[:phone_number]
          client.email = params[:email].strip if params[:email]
          client.address = params[:address].strip if params[:address]
  
          client.user = @current_user
  
          client.save!
          render json: {success: 'Client successfully saved', data: client}
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
          client = Client.find(params[:id])
  
          client.name = params[:name].strip if params[:name]
          client.email = params[:email].strip if params[:email]
          client.phone_number = params[:phone_number].strip if params[:phone_number]
          client.address = params[:address].strip if params[:address]
  
          client.save!
          render json: {success: 'Client information successfully updated', client: client}
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
      client = Client.find(params[:id])
      errors << 'Client specified does not exist' if client.nil?
  
      if errors.empty?
        begin
          render json:{client: client, success: 'Client successfully loaded'}
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
      errors << 'Please specify client to delete' if params[:id].blank?
  
      if errors.empty?
        begin
          client = Client.find(params[:id])
          projects = client.projects.all.entries
          raise Exception, "You can not delete a client with assosciated projects" if projects.length > 0
          
            client.destroy
  
          render json: {success: 'Client successfully deleted'}
        rescue Exception => e
          errors << e.message
          render json: {error: true, errors: errors}
        end    
      else
        render json: {error: true, errors: errors}
      end
  
    end
  
    def get_client_count
      clients = @current_user.clients.count
      render json: {clients: clients}
    end
  
  end