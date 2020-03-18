class Admin::SessionsController < Admin::Base
  def new
    if current_admin
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render action: 'new'
    end
  end

  def create
    @form = Admin::LoginForm.new(admin_login_params)
    if @form.email.present?
      admin = User.find_by('LOWER(email)=?', @form.email.downcase)
    end
    if Admin::Authenticator.new(admin).authenticate(@form.password)
      flash.notice = '管理者としてログインしました。'
      session[:administrator_id] = admin.id
      redirect_to :admin_root
    else
      flash.alert = 'ログインできませんでした。'
      render action: 'new'
    end
  end

  def destroy
    session.delete(:administrator_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :admin_root
  end

  private
  def admin_login_params
    params.require(:admin_login_form).permit(:email, :password)
  end
end
