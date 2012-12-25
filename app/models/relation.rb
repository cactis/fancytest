# -*- encoding : utf-8 -*-
class Relation < ActiveRecord::Base
  validates_uniqueness_of :subjectable_id, :scope => [:subjectable_type, :objectable_id, :objectable_type, :ownerable_id, :ownerable_type]
  # validates_presence_of :subjectable_id, :subjectable_type, :ownerable_type, :ownerable_id, :objectable_id, :objectable_type
  attr_accessible :objectable_type, :objectable_id

  belongs_to :ownerable, :polymorphic => true
  belongs_to :subjectable, :polymorphic => true
  belongs_to :objectable, :polymorphic => true
end
