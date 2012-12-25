# -*- encoding : utf-8 -*-
class PropertyObserver < ActiveRecord::Observer
  def before_save(record)
    unless record.subjectable_id.present?
      record.subjectable_id = record.user_id
      record.subjectable_type = 'User'
    end
    unless record.ownerable_type.present?
      record.ownerable_id = record.user_id
      record.ownerable_type = 'User'
    end
  end
end
