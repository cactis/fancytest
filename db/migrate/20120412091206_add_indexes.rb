# -*- encoding : utf-8 -*-
class AddIndexes < ActiveRecord::Migration
  def up
    add_index :users, :login
    add_index :users, :comments_count
    add_index :users, :responses_count
    add_index :users, :authorizations_count

    add_column :users, :public, :boolean
    add_column :users, :active, :boolean
    add_index :users, :public
    add_index :users, :active

    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at

    add_index :users, :created_at
    add_index :users, :updated_at

    add_index :users, :avatar_file_name
    add_index :users, :avatar_content_type
    add_index :users, :avatar_file_size
    add_index :users, :avatar_updated_at

    add_index :authorizations, :user_id
    add_index :authorizations, :provider
    add_index :authorizations, :uid
    add_index :authorizations, :token
    add_index :authorizations, :secret
    add_index :authorizations, :fresh_token
    add_column :authorizations, :deleted_at, :datetime
    add_index :authorizations, :deleted_at
    add_index :authorizations, :created_at
    add_index :authorizations, :updated_at

    add_index :trees, :type
    add_index :trees, :name
    add_index :trees, :parent_id
    add_index :trees, :lft
    add_index :trees, :rgt
    add_index :trees, :depth
    add_index :trees, :comments_count
    add_index :trees, :public
    add_index :trees, :active
    add_column :trees, :deleted_at, :datetime
    add_index :trees, :deleted_at
    add_index :trees, :created_at
    add_index :trees, :updated_at

    add_index :treeings, :type
    add_index :treeings, :user_id
    add_index :treeings, :tree_id
    add_index :treeings, [:treeable_type, :treeable_id]
    add_index :treeings, :value
    add_index :treeings, :comments_count
    add_index :treeings, :public
    add_index :treeings, :active
    add_index :treeings, :deleted_at
    add_index :treeings, :created_at
    add_index :treeings, :updated_at


    add_index :quizzes, :type
    add_index :quizzes, :user_id
    add_index :quizzes, :parent_id
    add_index :quizzes, :lft
    add_index :quizzes, :rgt
    add_index :quizzes, :depth
    add_index :quizzes, :prompt
    add_index :quizzes, :location
    add_index :quizzes, :discrimination
    add_index :quizzes, :pseudo_chance
    add_index :quizzes, :logo_file_name
    add_index :quizzes, :logo_content_type
    add_index :quizzes, :logo_file_size
    add_index :quizzes, :logo_updated_at
    add_index :quizzes, :quizzes_count
    add_index :quizzes, :options_count
    add_index :quizzes, :questions_count
    add_index :quizzes, :responses_count
    add_index :quizzes, :comments_count
    add_index :quizzes, :public
    add_index :quizzes, :active
    add_index :quizzes, :deleted_at
    add_index :quizzes, :created_at
    add_index :quizzes, :updated_at

    add_index :options, :user_id
    add_index :options, :quiz_id
    add_index :options, :prompt
    add_index :options, :checked
    add_index :options, :answers_count
    add_index :options, :comments_count
    add_index :options, :public
    add_index :options, :active
    add_index :options, :deleted_at
    add_index :options, :updated_at
    add_index :options, :created_at


    add_index :responses, :user_id
    add_index :responses, :quiz_id
    add_index :responses, :value
    add_index :responses, :answers_count
    add_index :responses, :public
    add_index :responses, :active
    add_index :responses, :deleted_at
    add_index :responses, :updated_at
    add_index :responses, :created_at

    add_index :answers, :user_id
    add_index :answers, :response_id
    add_index :answers, :option_id
    add_index :answers, :checked
    add_index :answers, :value
    add_index :answers, :public
    add_index :answers, :active
    add_index :answers, :deleted_at
    add_index :answers, :updated_at
    add_index :answers, :created_at

    add_index :comments, :type
    add_index :comments, [:commentable_type, :commentable_id]
    add_index :comments, :subject
    add_index :comments, :parent_id
    add_index :comments, :lft
    add_index :comments, :rgt
    add_index :comments, :public
    add_index :comments, :active
    add_index :comments, :deleted_at
    add_index :comments, :updated_at
    add_index :comments, :created_at


    add_index :relations, :type
    add_index :relations, :user_id
    add_index :relations, [:ownerable_type, :ownerable_id]
    add_index :relations, [:subjectable_type, :subjectable_id]
    add_index :relations, [:objectable_type, :objectable_id]
    add_index :relations, :value
    add_index :relations, :public
    add_index :relations, :active
    add_index :relations, :deleted_at
    add_index :relations, :updated_at
    add_index :relations, :created_at

  end

  def down
  end
end
