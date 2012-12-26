# -*- encoding : utf-8 -*-
module AccountsHelper
  def links_to_user_tag(users)
    users.map{|user| link_to_user_tag(user)}.join.html_safe
  end

  def link_to_user_tag(user)
    "<span class='tag'>#{link_to_polymorphic user}</span>".html_safe
  end

  def link_to_user(user)
    user.login
  end
end
