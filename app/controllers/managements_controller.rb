class ManagementsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user 
  
  def create
    coop = Coop.find(params[:managed_coop_id])
    coop.add_manager(params[:manager_id])
    redirect_to coop
  end

  def destroy
    managment = Management.find(params[:id])
    coop = managment.managed_coop
    coop.remove_manager(management.manager)
    redirect_to coop
  end
end
