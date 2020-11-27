class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create

    # 商業判斷邏輯不要放在controller，搬去Model
    # pw = Digest::SHA1.hexdigest("a#{params[:user][:password]}z")
    # @user = User.find_by(email: params[:user][:email], password: pw)
    # if @user......  else...... end

    u = User.login(params[:user])
    if u
      #發號碼牌(session只能接數字或文字)
      session[:user2222] = u.id

      redirect_to root_path, notice: '登入成功！'
    else
      redirect_to new_user_session_path, notice: '登入失敗！'
    end
  end

  def destroy
    session[:user2222] = nil
    redirect_to root_path, notice: '已登出！'
  end
  
end