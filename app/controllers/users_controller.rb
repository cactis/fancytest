# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def show
    if params[:skill_id]
      @resource = Skill.find(params[:skill_id])
    end
    @user = User.find(params[:id])
  end
end
