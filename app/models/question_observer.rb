# -*- encoding : utf-8 -*-
class QuestionObserver < ActiveRecord::Observer
  #  def after_update(record)
  #    # 計算本答題分數後，更新題目及試卷(s)難度
  #    record.quiz.update_location!
  #  end

  def before_save(record)
    if record.responses.present? && average = record.responses.average(:value)
      record.location = 1 - average
    end
  end

  def after_commit(record)
    # 計算本答題分數後，更新題目及試卷(s)難度
    record.quiz.save
  end
end 
