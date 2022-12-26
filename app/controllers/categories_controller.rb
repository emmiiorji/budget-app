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

    if !icon.original_filename.end_with?('.png', '.jpg', '.jpeg', '.gif')
      flash[:error] = "Icon must be a PNG, JPG, JPEG, or GIF"
      redirect_to new_user_category_path(params[:user_id]) and return
    end
    # Upload icon to Cloudinary
    cloudinary_icon = Cloudinary::Uploader.upload(icon.tempfile.path)
    params[:category][:icon] = cloudinary_icon['url']

    category = Category.new(category_params)
    category.user_id = current_user.id
    if category.save
      flash[:success] = "Category created!"
      redirect_to categories_path
    else
      flash[:error] = 'Something went wrong'
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
    category = params.require(:category).permit(:name, :icon, :description)
    category[:user] = current_user
    category
  end
end
