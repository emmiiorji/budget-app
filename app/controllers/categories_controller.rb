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
    dimensions = FastImage.size(icon.tempfile.path)

    # Upload icon to Cloudinary
    cloudinary_icon = Cloudinary::Uploader.upload(icon.tempfile.path)
    params[:category][:icon] = cloudinary_icon

    category = Category.new(category_params)
    category.user_id = current_user.id
    if category.save
      flash[:success] = "Category created!"
      redirect_to user_categories_path(params[:user_id])
    else
      render :new, locals: { category: }
    end
  end

  def show
  end

  def splash_screen
    unless !current_user # If user is signed in, redirect to categories page
      redirect_to categories_path
      return
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon, :description, :user_id)
  end
end
