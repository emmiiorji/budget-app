class UsersController < ApplicationController
  before_action :authenticate_user!

  def destroy
    
  end
end