class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: %i[update destroy]
  protected

  # パスワードなしで更新できるメソッド
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # 編集後のリダイレクト先を指定するメソッド
  def after_update_path_for(resource)
    user_path(resource)
  end

  def ensure_normal_user
    if resource.email == 'guest@gmail.com'
      redirect_to root_path, alert: "Guest user cannot be deleted"
    end
  end
end