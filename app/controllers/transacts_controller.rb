class TransactsController < ApplicationController
  before_action :authenticate_user!

  def new
    @transact = Transact.new
  end

  def create
    @transact = Transact.new(transact_params)
    if @transact.save
      flash[:success] = "Transaction created!"
      redirect_to root_url
    else
      render 'new'
    end
  end
end