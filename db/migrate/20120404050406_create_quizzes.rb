# -*- encoding : utf-8 -*-
class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :type
      t.belongs_to :user
      t.integer :parent_id, :lft, :rgt, :depth
      t.string :prompt, :limit => 4096
      t.text :description
      t.float :location
      t.float :discrimination
      t.float :pseudo_chance
      t.has_attached_file :logo


      t.integer :quizzes_count, :default => 0
      t.integer :questions_count, :default => 0
      t.integer :options_count, :default => 0
      t.integer :responses_count, :default => 0
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
