# -*- encoding : utf-8 -*-
class AnswerObserver < ActiveRecord::Observer
  def before_save(record)
    record.value = record.option.checked == record.checked ? 1 : 0
  end
end
