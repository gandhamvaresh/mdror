class SessionsController < ApplicationController
  before_filter :login_required, :only => [:destroy]
  before_filter :check_for_mobile
  
  def new
    unless current_user.blank?
      redirect_to reports_index_path if current_user.admin?
      redirect_to clients_path if current_user.staff?
      redirect_to doctor_dashboard_users_path if current_user.doctor?
      redirect_to patients_path if current_user.front_desk? 
    end
  end

  def create
    user = User.not_deleted.find_by_email(params[:email])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to reports_index_path if user.admin?
      redirect_to clients_path if user.staff?
      redirect_to doctor_dashboard_users_path if current_user.doctor?
      redirect_to patients_path if user.front_desk?
    else
      flash.now.alert = "Invalid email or password."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, :notice => "Logged out!"
  end
end