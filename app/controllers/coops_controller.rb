class CoopsController < ApplicationController
  def show
    @coop = Coop.find(params[:id])
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
    @coop = Coop.find(params[:id])
  end

  def update
    @coop = Coop.find(params[:id])
    if @coop.update_attributes(coop_params)
      flash[:success] = "Coop updated!"
      redirect_to @coop
    else 
      render 'edit'
    end
      
  end

  private
    
    # Never trust parameters from the scary internet!
    # Only allow the whitelist through
    def coop_params
      params.require(:coop).permit(:name, :description)
    end
end
