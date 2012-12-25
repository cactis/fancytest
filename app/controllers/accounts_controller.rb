# -*- encoding : utf-8 -*-
class AccountsController < Devise::RegistrationsController

  def show
    @user = User.find(params[:id])
  end

  def destroy
    resource.soft_delete!
    sign_out_and_redirect("/login")
    set_flash_message :notice, :destroyed
  end
end
