# -*- encoding : utf-8 -*-
class AbilityObserver < ActiveRecord::Observer
  def before_save(record)
    # 重估用戶在各物件上的能力值
    # 物件: Quiz, Question
    record.value = record.objectable.responses.where(["papers.user_id = ?", record.user_id]).average(:value)
  end
end
