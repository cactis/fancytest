# -*- encoding : utf-8 -*-
class WelcomeController < ApplicationController
  def index
    @skills = Skill.page(params[:page]).order('updated_at desc')
  end
end
