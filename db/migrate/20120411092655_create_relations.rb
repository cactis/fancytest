# -*- encoding : utf-8 -*-
class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.string :type
      t.belongs_to :user
      t.references :ownerable, :polymorphic => true
      t.references :subjectable, :polymorphic => true
      t.references :objectable, :polymorphic => true
      t.float :value
      t.boolean :public, :default => true
      t.boolean :active, :default => true
      t.text :_config
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
