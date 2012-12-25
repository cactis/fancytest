# -*- encoding : utf-8 -*-
class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :type
      t.belongs_to :user
      t.belongs_to :paper
      t.belongs_to :paperable, :polymorphic => true
      t.float :value
      t.integer :quota
      t.integer :elapsed
      t.integer :balance

      t.integer :responses_count, :default => 0
      t.integer :comments_count, :default => 0
      t.integer :answers_count, :default => 0

      t.boolean :public, :default => true
      t.boolean :active, :default => true
      t.text :_config
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :papers, :type
    add_index :papers, :user_id
    add_index :papers, :paper_id
    add_index :papers, [:paperable_type, :paperable_id]
    add_index :papers, :value
    add_index :papers, :quota
    add_index :papers, :elapsed
    add_index :papers, :balance
    add_index :papers, :responses_count
    add_index :papers, :answers_count
    add_index :papers, :comments_count

    drop_table :responses
    rename_column :answers, :response_id, :paper_id
  end
end
