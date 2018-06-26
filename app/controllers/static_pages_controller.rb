class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @joined_coops = current_user.joined_coops
    end
  end

  def help
  end

  def about
  end
end
