# -*- encoding : utf-8 -*-
class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :user
      t.belongs_to :response
      t.belongs_to :option
      t.boolean :checked, :default => false
      t.float :value
      t.boolean :public, :default => true
      t.boolean :active, :default => true
      t.text :_config
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
