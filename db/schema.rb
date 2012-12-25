# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120415090609) do

  create_table "answers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "paper_id"
    t.integer  "option_id"
    t.boolean  "checked",    :default => false
    t.float    "value"
    t.boolean  "public",     :default => true
    t.boolean  "active",     :default => true
    t.text     "_config"
    t.datetime "deleted_at"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "answers", ["active"], :name => "index_answers_on_active"
  add_index "answers", ["checked"], :name => "index_answers_on_checked"
  add_index "answers", ["created_at"], :name => "index_answers_on_created_at"
  add_index "answers", ["deleted_at"], :name => "index_answers_on_deleted_at"
  add_index "answers", ["option_id"], :name => "index_answers_on_option_id"
  add_index "answers", ["paper_id"], :name => "index_answers_on_response_id"
  add_index "answers", ["public"], :name => "index_answers_on_public"
  add_index "answers", ["updated_at"], :name => "index_answers_on_updated_at"
  add_index "answers", ["user_id"], :name => "index_answers_on_user_id"
  add_index "answers", ["value"], :name => "index_answers_on_value"

  create_table "attaches", :force => true do |t|
    t.string   "name"
    t.string   "prompt"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "comments_count",    :default => 0
    t.boolean  "public",            :default => true
    t.boolean  "active",            :default => true
    t.text     "_config"
    t.datetime "deleted_at"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "attaches", ["active"], :name => "index_attaches_on_active"
  add_index "attaches", ["attachable_type", "attachable_id"], :name => "index_attaches_on_attachable_type_and_attachable_id"
  add_index "attaches", ["comments_count"], :name => "index_attaches_on_comments_count"
  add_index "attaches", ["created_at"], :name => "index_attaches_on_created_at"
  add_index "attaches", ["deleted_at"], :name => "index_attaches_on_deleted_at"
  add_index "attaches", ["file_content_type"], :name => "index_attaches_on_file_content_type"
  add_index "attaches", ["file_file_name"], :name => "index_attaches_on_file_file_name"
  add_index "attaches", ["file_file_size"], :name => "index_attaches_on_file_file_size"
  add_index "attaches", ["file_updated_at"], :name => "index_attaches_on_file_updated_at"
  add_index "attaches", ["name"], :name => "index_attaches_on_name"
  add_index "attaches", ["public"], :name => "index_attaches_on_public"
  add_index "attaches", ["updated_at"], :name => "index_attaches_on_updated_at"

  create_table "authorizations", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.integer  "uid"
    t.string   "token"
    t.string   "secret"
    t.string   "fresh_token"
    t.text     "_config"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.datetime "deleted_at"
  end

  add_index "authorizations", ["created_at"], :name => "index_authorizations_on_created_at"
  add_index "authorizations", ["deleted_at"], :name => "index_authorizations_on_deleted_at"
  add_index "authorizations", ["fresh_token"], :name => "index_authorizations_on_fresh_token"
  add_index "authorizations", ["provider"], :name => "index_authorizations_on_provider"
  add_index "authorizations", ["secret"], :name => "index_authorizations_on_secret"
  add_index "authorizations", ["token"], :name => "index_authorizations_on_token"
  add_index "authorizations", ["uid"], :name => "index_authorizations_on_uid"
  add_index "authorizations", ["updated_at"], :name => "index_authorizations_on_updated_at"
  add_index "authorizations", ["user_id"], :name => "index_authorizations_on_user_id"

  create_table "comments", :force => true do |t|
    t.string   "type"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "subject"
    t.text     "body"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.boolean  "public",           :default => true
    t.boolean  "active",           :default => true
    t.text     "_config"
    t.datetime "deleted_at"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "comments", ["active"], :name => "index_comments_on_active"
  add_index "comments", ["commentable_type", "commentable_id"], :name => "index_comments_on_commentable_type_and_commentable_id"
  add_index "comments", ["created_at"], :name => "index_comments_on_created_at"
  add_index "comments", ["deleted_at"], :name => "index_comments_on_deleted_at"
  add_index "comments", ["lft"], :name => "index_comments_on_lft"
  add_index "comments", ["parent_id"], :name => "index_comments_on_parent_id"
  add_index "comments", ["public"], :name => "index_comments_on_public"
  add_index "comments", ["rgt"], :name => "index_comments_on_rgt"
  add_index "comments", ["subject"], :name => "index_comments_on_subject"
  add_index "comments", ["type"], :name => "index_comments_on_type"
  add_index "comments", ["updated_at"], :name => "index_comments_on_updated_at"

  create_table "options", :force => true do |t|
    t.integer  "user_id"
    t.integer  "quiz_id"
    t.string   "prompt",         :limit => 4096
    t.boolean  "checked",                        :default => false
    t.integer  "answers_count",                  :default => 0
    t.integer  "comments_count",                 :default => 0
    t.boolean  "public",                         :default => true
    t.boolean  "active",                         :default => true
    t.text     "_config"
    t.datetime "deleted_at"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.float    "location"
    t.float    "discrimination"
    t.float    "pseudo_chance"
  end

  add_index "options", ["active"], :name => "index_options_on_active"
  add_index "options", ["answers_count"], :name => "index_options_on_answers_count"
  add_index "options", ["checked"], :name => "index_options_on_checked"
  add_index "options", ["comments_count"], :name => "index_options_on_comments_count"
  add_index "options", ["created_at"], :name => "index_options_on_created_at"
  add_index "options", ["deleted_at"], :name => "index_options_on_deleted_at"
  add_index "options", ["discrimination"], :name => "index_options_on_discrimination"
  add_index "options", ["location"], :name => "index_options_on_location"
  add_index "options", ["prompt"], :name => "index_options_on_prompt", :length => {"prompt"=>255}
  add_index "options", ["pseudo_chance"], :name => "index_options_on_pseudo_chance"
  add_index "options", ["public"], :name => "index_options_on_public"
  add_index "options", ["quiz_id"], :name => "index_options_on_quiz_id"
  add_index "options", ["updated_at"], :name => "index_options_on_updated_at"
  add_index "options", ["user_id"], :name => "index_options_on_user_id"

  create_table "papers", :force => true do |t|
    t.string   "type"
    t.integer  "user_id"
    t.integer  "paper_id"
    t.integer  "paperable_id"
    t.string   "paperable_type"
    t.float    "value"
    t.integer  "quota"
    t.integer  "elapsed"
    t.integer  "balance"
    t.integer  "responses_count", :default => 0
    t.integer  "comments_count",  :default => 0
    t.integer  "answers_count",   :default => 0
    t.boolean  "public",          :default => true
    t.boolean  "active",          :default => true
    t.text     "_config"
    t.datetime "deleted_at"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "papers", ["answers_count"], :name => "index_papers_on_answers_count"
  add_index "papers", ["balance"], :name => "index_papers_on_balance"
  add_index "papers", ["comments_count"], :name => "index_papers_on_comments_count"
  add_index "papers", ["elapsed"], :name => "index_papers_on_elapsed"
  add_index "papers", ["paper_id"], :name => "index_papers_on_paper_id"
  add_index "papers", ["paperable_type", "paperable_id"], :name => "index_papers_on_paperable_type_and_paperable_id"
  add_index "papers", ["quota"], :name => "index_papers_on_quota"
  add_index "papers", ["responses_count"], :name => "index_papers_on_responses_count"
  add_index "papers", ["type"], :name => "index_papers_on_type"
  add_index "papers", ["user_id"], :name => "index_papers_on_user_id"
  add_index "papers", ["value"], :name => "index_papers_on_value"

  create_table "quizzes", :force => true do |t|
    t.string   "type"
    t.integer  "user_id"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "prompt",            :limit => 4096
    t.text     "description"
    t.float    "location"
    t.float    "discrimination"
    t.float    "pseudo_chance"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "quizzes_count"
    t.integer  "options_count",                     :default => 0
    t.integer  "questions_count",                   :default => 0
    t.integer  "responses_count",                   :default => 0
    t.integer  "comments_count",                    :default => 0
    t.boolean  "public",                            :default => true
    t.boolean  "active",                            :default => true
    t.text     "_config"
    t.datetime "deleted_at"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

  add_index "quizzes", ["active"], :name => "index_quizzes_on_active"
  add_index "quizzes", ["comments_count"], :name => "index_quizzes_on_comments_count"
  add_index "quizzes", ["created_at"], :name => "index_quizzes_on_created_at"
  add_index "quizzes", ["deleted_at"], :name => "index_quizzes_on_deleted_at"
  add_index "quizzes", ["depth"], :name => "index_quizzes_on_depth"
  add_index "quizzes", ["discrimination"], :name => "index_quizzes_on_discrimination"
  add_index "quizzes", ["lft"], :name => "index_quizzes_on_lft"
  add_index "quizzes", ["location"], :name => "index_quizzes_on_location"
  add_index "quizzes", ["logo_content_type"], :name => "index_quizzes_on_logo_content_type"
  add_index "quizzes", ["logo_file_name"], :name => "index_quizzes_on_logo_file_name"
  add_index "quizzes", ["logo_file_size"], :name => "index_quizzes_on_logo_file_size"
  add_index "quizzes", ["logo_updated_at"], :name => "index_quizzes_on_logo_updated_at"
  add_index "quizzes", ["options_count"], :name => "index_quizzes_on_options_count"
  add_index "quizzes", ["parent_id"], :name => "index_quizzes_on_parent_id"
  add_index "quizzes", ["prompt"], :name => "index_quizzes_on_prompt", :length => {"prompt"=>255}
  add_index "quizzes", ["pseudo_chance"], :name => "index_quizzes_on_pseudo_chance"
  add_index "quizzes", ["public"], :name => "index_quizzes_on_public"
  add_index "quizzes", ["questions_count"], :name => "index_quizzes_on_questions_count"
  add_index "quizzes", ["quizzes_count"], :name => "index_quizzes_on_quizzes_count"
  add_index "quizzes", ["responses_count"], :name => "index_quizzes_on_responses_count"
  add_index "quizzes", ["rgt"], :name => "index_quizzes_on_rgt"
  add_index "quizzes", ["type"], :name => "index_quizzes_on_type"
  add_index "quizzes", ["updated_at"], :name => "index_quizzes_on_updated_at"
  add_index "quizzes", ["user_id"], :name => "index_quizzes_on_user_id"

  create_table "relations", :force => true do |t|
    t.string   "type"
    t.integer  "user_id"
    t.integer  "ownerable_id"
    t.string   "ownerable_type"
    t.integer  "subjectable_id"
    t.string   "subjectable_type"
    t.integer  "objectable_id"
    t.string   "objectable_type"
    t.float    "value"
    t.boolean  "public",           :default => true
    t.boolean  "active",           :default => true
    t.text     "_config"
    t.datetime "deleted_at"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "relations", ["active"], :name => "index_relations_on_active"
  add_index "relations", ["created_at"], :name => "index_relations_on_created_at"
  add_index "relations", ["deleted_at"], :name => "index_relations_on_deleted_at"
  add_index "relations", ["objectable_type", "objectable_id"], :name => "index_relations_on_objectable_type_and_objectable_id"
  add_index "relations", ["ownerable_type", "ownerable_id"], :name => "index_relations_on_ownerable_type_and_ownerable_id"
  add_index "relations", ["public"], :name => "index_relations_on_public"
  add_index "relations", ["subjectable_type", "subjectable_id"], :name => "index_relations_on_subjectable_type_and_subjectable_id"
  add_index "relations", ["type"], :name => "index_relations_on_type"
  add_index "relations", ["updated_at"], :name => "index_relations_on_updated_at"
  add_index "relations", ["user_id"], :name => "index_relations_on_user_id"
  add_index "relations", ["value"], :name => "index_relations_on_value"

  create_table "treeings", :force => true do |t|
    t.string   "type"
    t.integer  "user_id"
    t.integer  "tree_id"
    t.integer  "treeable_id"
    t.string   "treeable_type"
    t.float    "value"
    t.integer  "comments_count", :default => 0
    t.boolean  "public",         :default => true
    t.boolean  "active",         :default => true
    t.text     "_config"
    t.datetime "deleted_at"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "treeings", ["active"], :name => "index_treeings_on_active"
  add_index "treeings", ["comments_count"], :name => "index_treeings_on_comments_count"
  add_index "treeings", ["created_at"], :name => "index_treeings_on_created_at"
  add_index "treeings", ["deleted_at"], :name => "index_treeings_on_deleted_at"
  add_index "treeings", ["public"], :name => "index_treeings_on_public"
  add_index "treeings", ["tree_id"], :name => "index_treeings_on_tree_id"
  add_index "treeings", ["treeable_type", "treeable_id"], :name => "index_treeings_on_treeable_type_and_treeable_id"
  add_index "treeings", ["type"], :name => "index_treeings_on_type"
  add_index "treeings", ["updated_at"], :name => "index_treeings_on_updated_at"
  add_index "treeings", ["user_id"], :name => "index_treeings_on_user_id"
  add_index "treeings", ["value"], :name => "index_treeings_on_value"

  create_table "trees", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.integer  "comments_count", :default => 0
    t.boolean  "public",         :default => true
    t.boolean  "active",         :default => true
    t.text     "_config"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.datetime "deleted_at"
  end

  add_index "trees", ["active"], :name => "index_trees_on_active"
  add_index "trees", ["comments_count"], :name => "index_trees_on_comments_count"
  add_index "trees", ["created_at"], :name => "index_trees_on_created_at"
  add_index "trees", ["deleted_at"], :name => "index_trees_on_deleted_at"
  add_index "trees", ["depth"], :name => "index_trees_on_depth"
  add_index "trees", ["lft"], :name => "index_trees_on_lft"
  add_index "trees", ["name"], :name => "index_trees_on_name"
  add_index "trees", ["parent_id"], :name => "index_trees_on_parent_id"
  add_index "trees", ["public"], :name => "index_trees_on_public"
  add_index "trees", ["rgt"], :name => "index_trees_on_rgt"
  add_index "trees", ["type"], :name => "index_trees_on_type"
  add_index "trees", ["updated_at"], :name => "index_trees_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.integer  "authorizations_count",   :default => 0
    t.integer  "responses_count",        :default => 0
    t.integer  "comments_count",         :default => 0
    t.text     "_config"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "public"
    t.boolean  "active"
    t.datetime "deleted_at"
  end

  add_index "users", ["active"], :name => "index_users_on_active"
  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["authorizations_count"], :name => "index_users_on_authorizations_count"
  add_index "users", ["avatar_content_type"], :name => "index_users_on_avatar_content_type"
  add_index "users", ["avatar_file_name"], :name => "index_users_on_avatar_file_name"
  add_index "users", ["avatar_file_size"], :name => "index_users_on_avatar_file_size"
  add_index "users", ["avatar_updated_at"], :name => "index_users_on_avatar_updated_at"
  add_index "users", ["comments_count"], :name => "index_users_on_comments_count"
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["created_at"], :name => "index_users_on_created_at"
  add_index "users", ["deleted_at"], :name => "index_users_on_deleted_at"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["public"], :name => "index_users_on_public"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["responses_count"], :name => "index_users_on_responses_count"
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true
  add_index "users", ["updated_at"], :name => "index_users_on_updated_at"

end
