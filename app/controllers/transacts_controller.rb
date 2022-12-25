class TransactsController < ApplicationController
  before_action :authenticate_user!

  def new
    @category = Category.where(user_id: current_user.id).where(id: params[:category_id])[0]
    
    # If category does not exist, redirect to categories page
    if @category.nil?
      flash[:error] = "User did not create this category"
      redirect_to categories_path
    end

    @transact = @category.transacts.new
    @categories = Category.where(user_id: current_user.id)
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