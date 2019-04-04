class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email_params)
    if user && user.authenticate(password_params[:password])
      log_in user
      redirect_to topics_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end

  private
    def log_in(user)
      session[:user_id] = user.id
    end

    # Rails06課題　SessionsControllerにストロングパラメーターを実装してください
    def email_params
      params.require(:session).permit(:email)
    end
    # Rails06課題　SessionsControllerにストロングパラメーターを実装してください
    def password_params
      params.require(:session).permit(:password)
    end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
#
#
# def create
#   @user = User.new(user_params)
#   if @user.save
#     redirect_to root_path, success: '登録が完了しました'
#   else
#     flash.now[:danger] = "登録に失敗しました"
#     render :new
#   end
# end
#
# private
# def user_params
#   params.require(:user).permit(:name, :email, :password, :password_confirmation)
# end
