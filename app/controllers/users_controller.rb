class UsersController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @users = User.all
  	@book = Book.new
  end

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
    if @user != current_user
      @user = current_user
      @book = Book.new
      redirect_to user_path(@user.id)
    end
  end

  def update
  	@user = User.find(params[:id])
    if  @user != current_user
        redirect_to current_user_path
    elsif
      @user.update(user_params)
        flash[:notice] = "User was successfully update."
        redirect_to user_path(@user.id)
  	else
        render 'edit'
    end
  end

  def new
 
  end

  def create
  	
  end






private
  def user_params
	  params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
