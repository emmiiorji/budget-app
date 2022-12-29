class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:splash_screen]

  def index
    @current_user = current_user
    @categories = Category.where(user_id: current_user.id)
  end

  def new
    @category = Category.new
  end

  def create
    icon = params[:category][:icon]

    unless icon.original_filename.end_with?('.png', '.jpg', '.jpeg', '.gif')
      flash[:error] = 'Icon must be a PNG, JPG, JPEG, or GIF'
      redirect_to new_user_category_path(params[:user_id]) and return
    end
    # Upload icon to Cloudinary
    cloudinary_icon = Cloudinary::Uploader.upload(icon.tempfile.path)
    params[:category][:icon] = cloudinary_icon['url']

    category = Category.new(category_params)
    category.user_id = current_user.id
    if category.save
      flash[:success] = 'Category created!'
      redirect_to categories_path
    else
      flash[:error] = 'Something went wrong'
      render :new, locals: { category: }
    end
  end

  def show
    # Get category and its transacts as long as it was created by the current user
    @category = Category.includes(:transacts).where(user_id: current_user.id).where(id: params[:id])[0]

    # If category does not exist, redirect to categories page
    if @category.nil?
      flash[:error] = 'User did not create this category'
      redirect_to categories_path
    end
    @transacts = @category.transacts.order(created_at: :desc)
  end

  def splash_screen
    return unless user_signed_in? # If user is signed in, redirect to categories page

    redirect_to categories_path
    nil
  end

  def destroy
    # Get category as long as it was created by the current user
    @category = Category.where(user_id: current_user.id).where(id: params[:id])[0]

    # If category does not exist, redirect to categories page
    if @category.nil?
      flash[:error] = 'User did not create this category'
      redirect_to categories_path
    end

    if @category.destroy
      flash[:success] = 'category was successfully deleted.'
      redirect_to categories_path
    else
      flash[:error] = 'Something went wrong'
      render :show
    end
  end

  private

  def category_params
    category = params.require(:category).permit(:name, :icon, :description)
    category[:user] = current_user
    category
  end
end
