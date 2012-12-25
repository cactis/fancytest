# -*- encoding : utf-8 -*-
class ResponseObserver < ActiveRecord::Observer
  def after_commit(record)
    # 答題後，需更新
    # 作答者

    # 題目
    record.question.save

    # 試卷
    # 計算本答題分數後，更新題目及試卷(s)難度


    # 更新個人答題後的相關數據
    # 個人在試題上的能力值
    record.user.ability_about!(record.question)
    # 個人在測驗上的能力值
    record.user.ability_about!(record.question.quiz)

    # 個人在類別上的能力值
  end
end
