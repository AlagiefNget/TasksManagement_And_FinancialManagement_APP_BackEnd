class Api::V1::ChargesController < ApplicationController

    # def index
    #   projects = @current_user.projects.order('name ASC')
    #   render json:{projects: projects}
    # end
  
    def create
      errors = []
      errors << 'Please specify amount' if params[:amount].blank?

      if errors.empty?
        begin
          charge = Charge.new
          charge.amount = params[:amount].strip.to_f if params[:amount]
          charge.balance = params[:amount].strip.to_f if params[:amount]
          charge.discount = params[:discount].strip.to_f if params[:discount]
          charge.due_date = params[:due_date] if params[:due_date]
          charge.currency = params[:currency] if params[:currency]
          
          client = Client.find(params[:client_id])
          raise Exception, "Client does not exist" if client.nil?

          charge.client_name = client.name
          charge.client = client
  
          project = @current_user.projects.find(params[:project_id])

          charge.project_name = project.name
          charge.project = project
  
          charge.save!
          render json: {success: "Charge successfully created for the project #{charge.project_name}", data: charge}
        rescue Exception => e
          errors << e.message
          render json: {error: true, errors: errors}
        end
      else
        render json: {error: true, errors: errors}
      end
  
    end
  
  end