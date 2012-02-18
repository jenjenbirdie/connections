class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy
  
  before_filter :user_in, :only => [:new, :create]

  
  def index
	@title = "All users"
	#@users = User.all  replaced by
	@users = User.paginate(:page => params[:page])
  end
  
 
  def new
    @user = User.new  #correcposd to new.html.erb w/o this, error.
	@title = "Sign up"
  end
  def show
	@user = User.find(params[:id])
	@microposts = @user.microposts.paginate(:page => params[:page])
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
	#@user = User.find(params[:id])  remove coz already in correct_user p. 381 ror tutorial
	@title = "Edit user"
  end
  def update
	#@user = User.find(params[:id])
	if @user.update_attributes(params[:user])
		flash[:success] = "Profile updated."
		redirect_to @user
	else
		@title = "Edit user"
		render 'edit'
	end
  end
  
   def destroy
	User.find(params[:id]).destroy
	flash[:success] = "User destroyed"
	redirect_to users_path
  end
  
  private
	def authenticate
		deny_access unless signed_in?
	end
	
	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_path) unless current_user?(@user)
	end
	
	def admin_user
		redirect_to(root_path) unless current_user.admin?
	end
	
	def user_in
		# redirect_to(root_path) if signed_in? 
		if signed_in?
			flash[:warning] = "You are currently logged in. Log out to create a new user."
			redirect_to(root_path)
		end
	end
	
end
