class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def show
    
    @user=User.find(params[:id])

  end

  def create
    @user=User.new(user_params)
    # logger.debug "Inside Create Action: #{@user.inspect}"
    # byebug
    if @user.save
      logger.debug "After saving user: #{flash}"
        flash[:notice] = "This account is created successfully"
        redirect_to user_path(@user)
    else 
        render "new"
    end
  end


  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
