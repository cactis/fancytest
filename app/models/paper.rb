# -*- encoding : utf-8 -*-
class Paper < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :responses, :dependent => :destroy

  scope :created_by_current_user, lambda { where(["user_id = ?", User.current.id])}
end
