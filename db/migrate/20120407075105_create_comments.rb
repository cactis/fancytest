# -*- encoding : utf-8 -*-
class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :type
      t.references :commentable, :polymorphic => true
      t.string :subject
      t.text :body
      t.integer :parent_id, :lft, :rgt
      t.boolean :public, :default => true
      t.boolean :active, :default => true
      t.text :_config
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
