class CoopsController < ApplicationController
  # Sets coop based on id
  before_action :set_coop,         only: [:show, :edit, :update, :destroy]
  # Permission filters
  before_action :logged_in_user   
  before_action :admin_user,       only: [:new, :create, :destroy]
  before_action :manager_user,     only: [:edit, :update]


  def index
    @coops = Coop.paginate(page: params[:page])                
  end
  
  def show
  end

  def new
    @coop = Coop.new
  end

  def create
    @coop = Coop.new(coop_params)
    if @coop.save
      flash[:success] = "Creation successful!"
      redirect_to @coop
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @coop.update_attributes(coop_params)
      flash[:success] = "Coop updated!"
      redirect_to @coop
    else 
      render 'edit'
    end
  end

  def destroy
    @coop.destroy
    flash[:success] = "Coop deleted"
    redirect_to coops_url
  end

  private
    
    # Never trust parameters from the scary internet!
    # Only allow the whitelist through
    def coop_params
      params.require(:coop).permit(:name, :description)
    end

    def set_coop
      @coop = Coop.find(params[:id])
    end

    def manager_user
    end
end
