class UsersController < ApplicationController
  def new
    @user = User.new  #correcposd to new.html.erb w/o this, error.
	@title = "Sign up"
  end
  def show
	@user = User.find(params[:id])
	@title = @user.name
  end
  def create
	@user = User.new(params[:user])
	if @user.save
		sign_in @user
		#redirect_to @user    #this one works too
		flash[:success] = "Welcome to the Sample App!"
		redirect_to user_path(@user)  #alternative so rspec will understand
	else
		@title = "Sign up"
		@user.password = nil
		@user.password_confirmation = nil
		render 'new'
	end
  end
  def edit
	@user = User.find(params[:id])
	@title = "Edit user"
  end
  def update
	@user = User.find(params[:id])
	if @user.update_attributes(params[:user])
		flash[:success] = "Profile updated."
		redirect_to @user
	else
		@title = "Edit user"
		render 'edit'
	end
  end
end
