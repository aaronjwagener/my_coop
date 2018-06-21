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


  private
    
    def coop_params
      params.require(:coop).permit(:name, :description)
    end
end
