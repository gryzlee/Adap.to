class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@roles = @user.roles.all
	end

  def create
    @user = User.new(user_params)
    @roles = Roles.all
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    @roles = Role.all
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was updated successfully' }
      else
        format.html { render :edit }
      end
    end
  end

	  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :role_ids => [])
  end

  
  protected
  def needs_password?(user, params)
    params[:password].present?
  end
end