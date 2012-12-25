# -*- encoding : utf-8 -*-
class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.integer :user_id
      t.string :provider
      t.integer :uid
      t.string :token
      t.string :secret
      t.string :fresh_token
      t.text :_config
      t.timestamps
    end
  end
end
