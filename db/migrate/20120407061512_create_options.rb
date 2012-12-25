# -*- encoding : utf-8 -*-
class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.belongs_to :user
      t.belongs_to :quiz
      t.string :prompt, :limit => 4096
      t.boolean :checked, :default => false

      t.integer :answers_count, :default => 0
      t.integer :comments_count, :default => 0

      t.boolean :public, :default => true
      t.boolean :active, :default => true
      t.text :_config
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
