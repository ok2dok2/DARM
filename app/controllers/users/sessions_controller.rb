class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'Logged in as guest user'
  end

  def guest_admin_sign_in
    user = User.guest_admin
    sign_in user
    redirect_to root_path, notice: 'Logged in as admin guest user'
  end
end