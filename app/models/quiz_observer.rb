# -*- encoding : utf-8 -*-
class QuizObserver < ActiveRecord::Observer
  def after_update(record)
    record.parent.save if record.parent
  end

  def before_save(record)
     if record.questions.present?
      record.location = record.questions.average(:location)
      record.responses_count = record.responses.count
      record.options_count = record.questions.sum(:options_count)
    end
  end
end
