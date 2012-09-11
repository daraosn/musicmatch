class GameController < ApplicationController
  
  def index
    
  end
  
  def facebook
    redirect_to '/auth/facebook'
  end
  
end