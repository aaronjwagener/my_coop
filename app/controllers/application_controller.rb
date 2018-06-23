class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper

  def hello
    render html: "hello, world!"
  end

  ### BEGIN PRIVATE FUNCTIONS ###

  private

    # Confirms a logged in user                                                 
    def logged_in_user                                                          
      unless logged_in?                                                         
        store_location                                                          
        flash[:danger] = "Please log in."                                       
        redirect_to login_url                                                   
      end                                                                       
    end 

    # Confirms that a user is admin                                             
    def admin_user                                                              
      redirect_to(root_url) unless current_user.admin?                          
    end  
  
end
