class SessionsController < ApplicationController

  # "email", "koko@g.com"], ["password", "123456"]

  def new
  	if admin_logged_in?
  	  redirect_to current_admin
  	else
  	  render 'new'
  	end
  end


  def create
    admin = Admin.find_by(email: params[:session][:email].downcase, password: params[:session][:password])

    if admin
  	  puts "--------------------------------------------------------------"
      admin_log_in admin
      redirect_to admin
    else
      render 'new'
    end

  end

  def destroy
  	admin_log_out
  	redirect_to login_path
  end



end
