class TransactsController < ApplicationController
  before_action :authenticate_user!

  def new
    @category = Category.where(user_id: current_user.id).where(id: params[:category_id])[0]

    # If category does not exist, redirect to categories page
    if @category.nil?
      flash[:error] = 'User did not create this category'
      redirect_to categories_path
    end

    @transact = @category.transacts.new
    @categories = Category.where(user_id: current_user.id)
  end

  def create
    @category = Category.where(user_id: current_user.id).where(id: params[:category_id])[0]

    # If category does not exist, redirect to categories page
    if @category.nil?
      flash[:error] = 'User did not create this category'
      redirect_to categories_path
    end

    @transact = @category.transacts.new(transact_params)

    if @transact.save
      @category.transacts << @transact
      # CategoryTransacts.create(category_id: @category.id, transact_id: @transact.id)
      flash[:success] = 'Transaction created successfully!'
      redirect_to category_path(@category)
    else
      flash[:error] = 'Transaction could not be created'
      render :new, locals: { category: @category }
    end
  end

  def destroy
    @transact = Transact.where(author_id: current_user.id).where(id: params[:id])[0]

    # If category does not exist, redirect to categories page
    if @transact.nil?
      flash[:error] = 'User did not create this transaction'
      redirect_to categories_path and return
    end

    if @transact.destroy
      flash[:success] = 'Transaction was successfully deleted.'
      redirect_to category_path(params[:category_id]) and return
    else
      flash[:error] = 'Something went wrong'
      render :show and return
    end
  end

  private

  def transact_params
    transact = params.require(:transact).permit(:name, :amount)
    transact[:author] = current_user
    transact
  end
end
