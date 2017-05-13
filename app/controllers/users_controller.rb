class UsersController < ApplicationController
  #before_action :auth
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if can? :update, User
        if @user.update(user_params)
          format.html {redirect_to @user, notice: 'ユーザー情報を更新しました。'}
        else
          format.html {render :edit}
        end
      else
        format.html {redirect_to @user, alert: 'ユーザー情報を更新する権限がありません。'}
      end
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :role)
  end

  def auth
    if !user_signed_in? || !current_user.admin?
      redirect_to root_path, alert: '権限がありません。'
    end
  end

end
