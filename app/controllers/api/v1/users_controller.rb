class Api::V1::UsersController < ApplicationController
  before_action :authenticate_api_v1_user!
  before_action :set_users, only: [:index]
  before_action :set_user, only: [:update, :delete]

  def index
    render_success(200, nil, { data: format_users(@users) } )
  end

  def update
    if @user.update(user_params)
      render_success(200, 'success updated!', { data: format_users([@user]) } )
    else
      render_error(401, 'update error', { data: @user.errors.full_message } )
    end
  end

  def delete
    if @user.update(is_deleted: true)
      render_success(410, 'success deleted!', { data: format_users([@user]) } )
    else
      render_error(401, 'deleted error', { data: @user.errors.full_message } )
    end
  end

  private

    def set_users
      @users = current_api_v1_user.admin? ? User.all : [current_api_v1_user]
    end

    def set_user
      @user = current_api_v1_user.admin? ? User.find(params[:id]) : current_api_v1_user
    end
    
    def format_users(users)
      resp = users.map { |user| user.attributes.slice( 'first_name', 'last_name', 'email' ) }
    end

    def user_params
      if current_api_v1_user.admin?
        params.require(:user).permit(:first_name, :last_name, :email, :password, :role)
      else
        params.require(:user).permit(:first_name, :last_name, :email, :password)
      end
    end
end
