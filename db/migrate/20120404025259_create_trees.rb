# -*- encoding : utf-8 -*-
class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
      t.string :type
      t.string :name
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth
      t.integer :comments_count, :default => 0
      t.boolean :public, :default => true
      t.boolean :active, :default => true
      t.text :_config
      t.timestamps
    end
  end
end
