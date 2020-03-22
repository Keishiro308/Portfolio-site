class Admin::UsersController < Admin::Base

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_user_info(user_params)
      flash.notice = '更新できました。'
      redirect_to :admin_root
    else
      flash.now.alert = '更新できませんでした。'
      render action: 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :email, :new_password
    )
  end
end
