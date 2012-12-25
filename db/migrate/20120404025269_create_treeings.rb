# -*- encoding : utf-8 -*-
class CreateTreeings < ActiveRecord::Migration
  def change
    create_table :treeings do |t|
      t.string :type
      t.belongs_to :user
      t.belongs_to :tree
      t.references :treeable, :polymorphic => true
      t.float :value
      t.integer :comments_count, :default => 0
      t.boolean :public, :default => true
      t.boolean :active, :default => true
      t.text :_config
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
