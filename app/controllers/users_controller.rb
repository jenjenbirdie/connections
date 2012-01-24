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
		#redirect_to @user    #this one works too
		redirect_to user_path(@user)  #alternative so rspec will understand
	else
		@title = "Sign up"
		render 'new'
	end
  end
end
