class UsersController < ApplicationController
  # Fetches user based on ID
  before_action :set_user,       only: [:show, :edit, :update, :destroy]
  # Only allows if user logged in
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  # Only allows if user is correct
  before_action :correct_user,   only: [:edit, :update]
  # Only allows if user is admin
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to My Coop!"
      log_in(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end


  ########## ENTERING PRIVATE FUNCTIONS ##########

  private

    # Parameters
    # Never trust parameters from the scary internet,
    # only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, 
                                   :password_confirmation)
    end

    # Before Filters
    

    # Sets the user for show, edit, update and destroy
    def set_user
      @user = User.find(params[:id])
    end

    # Confirms a logged in user as the correct one
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
