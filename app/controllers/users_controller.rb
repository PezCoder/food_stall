class UsersController < ApplicationController
  layout 'application'

  before_action :check_user_stamp,:except=>[:login,:login_attempt,:new,:create]

  def index
    @foods = User.find_by_id(session[:id]).foods.recent
  end

  def new
  	@user = User.new
  end

  def create
  	user = User.new(get_user_details)
  	if user.valid?
  		# It's a valid user
  		user.save
  		flash[:notice]="Profile #{user.email} created succesfully !"
  		redirect_to(:controller=>'users',:action=>'login')
  	else 
  		flash[:error]="Oops ! Something went wrong !"
      @user = User.new
  		render('new')
  	end
  end

  def show
    @user = User.find_by_id(session[:id])
  end
  def edit
  	@user = User.find_by_id(session[:id])
  end

  def update
  	user = User.find_by_id(params[:id])
  	if user.update_attributes(get_user_details)
  		flash[:notice]="Details updated succesfully ! "
  		redirect_to(:action=>'show',:id=>user.id)
  	# else
  	# 	flash[:error]="Oops ! Something went wrong !"
   #    @user = User.find_by_id(params[:id])
  	# 	render('edit')
  	end
  end

  def delete
  	@user = User.find_by_id(params[:id])
  end

  def destroy
  	user = User.find_by_id(params[:id])
  	user.destroy
  	flash[:notice]="Your account has been deleted succesfully !"
    #remove the stamps 
    session[:id]=nil
    session[:name]=nil
  	redirect_to(:controller=>'products',:action=>'index')
  end

  def login
  end

  def login_attempt
  	if params[:email].present? && params[:password].present?
      #note : find_by_email is not a case sensitive search ( for it : pezcoder = PezCoder)
  		valid_user = User.find_by_email(params[:email])
  		if(valid_user)
  			auth_user = valid_user.authenticate(params[:password])
  		end
      
      if auth_user 
        #giving stamp
        session[:id]=auth_user.id
        session[:name]=auth_user.name
        #redirections
        flash[:notice]="Welcome, #{auth_user.name.split(' ')[0]} "
        redirect_to(:controller=>'foods',:action=>'index')
      else
        flash[:error]="Wrong Credentials !"
        render('login')
      end


  	else
  		flash[:warning]="Fields can't be empty ! "
  		redirect_to(:action=>'login')
  	end

  end

  def logout
  	#remove stamps & redirect
  	session[:id]=nil
  	session[:name]=nil
  	flash[:notice]="Logged out !"
  	redirect_to(:controller=>'users',:action=>'login')

  end

    private
  	#Permitting the variables for mass assignment
  	def get_user_details
  		my_hash = params.require(:user).permit(:name,:email,:city,:phone_no,:password,:address)
      #it's imp. to downcase while storing or (Pezcoder & pecoder will recog. as same)
      if my_hash[:email]
        # if new user store 
        my_hash[:email].downcase!
      end
      
      return my_hash
  	end
end
