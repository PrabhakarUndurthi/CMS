class AdminUsersController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in



  def index
    @admin_users = AdminUser.sorted
  end

  def new

    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)
    if @admin_user.save
      flash[:notice] = "Admin user created successfully."
      redirect_to('index')
    else
      flash[:notice] = "Admin user is not created."
      render('new')
    end
  end



  def edit
    @admin_user = AdminUser.find(params[:id])
   
  end

  def update
    @admin_user = AdminUser.find(param[:id])
    if @admin_user.update_attributes(admin_users_params)
      flash[:notice] = "Admin user updated successfully."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Admin user could not be updated."
      render('edit')
    end
  end



  def delete

    admin_user = AdminUser.find(params[:id])
  end

  def destroy
    admin_user = AdminUser.find(params[:id]).destroy 
    flash[:notice] = "Admin user deleted successfully."
    redirect_to(:action => 'index')
  end

  private 

  def admin_user_params
    params.require(:admin_user).permit(:first_name, :last_name, :email, :username, :password)
  end

end
