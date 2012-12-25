# -*- encoding : utf-8 -*-
class Authorization < ActiveRecord::Base
  store_configurable
  attr_accessible :_config, :fresh_token, :provider, :secret, :token, :uid, :user_id
  belongs_to :user
end
