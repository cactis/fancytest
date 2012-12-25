# -*- encoding : utf-8 -*-
class CreateAttaches < ActiveRecord::Migration
  def change
    create_table :attaches do |t|
      t.string :name
      t.string :prompt
      t.references :attachable, :polymorphic => true
      t.has_attached_file :file

      t.integer :comments_count, :default => 0
      t.boolean :public, :default => true
      t.boolean :active, :default => true
      t.text :_config
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :attaches, :name
    add_index :attaches, [:attachable_type, :attachable_id]
    add_index :attaches, :file_file_name
    add_index :attaches, :file_content_type
    add_index :attaches, :file_file_size
    add_index :attaches, :file_updated_at

    add_index :attaches, :comments_count

    add_index :attaches, :public
    add_index :attaches, :active
    add_index :attaches, :deleted_at
    add_index :attaches, :updated_at
    add_index :attaches, :created_at
  end
end
