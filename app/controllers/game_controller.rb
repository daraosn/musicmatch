class GameController < ApplicationController
  
  def index
    sleep 1
    if current_user
      
    else
      
    end
  end
  
  def facebook
    redirect_to '/auth/facebook'
  end
  
end