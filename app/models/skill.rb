# -*- encoding : utf-8 -*-
class Skill < Exam

  def _descriptioin
    Sanitize.clean(description, Sanitize::Config::BASIC).html_safe
  end

  # skill 的適性測驗
  def next_question
    # 用戶程度: 用戶最後前答題的難易度 或者
    # 未作過，並且題目適合用戶程度
    last_response = responses.by_current_user.first
    if last_response
      # 曾作過答
      if last_response.correct?
        # 先處理未作過的
        # 要取更難的
        ability_value = User.current._ability_value(self)
        question = questions.undone_list.harder(ability_value).first || questions.undone_list.easier(ability_value).first || questions.retry_list.first
      else
        question = questions.undone_list.easier(ability_value).first || questions.retry_list.first
      end
    else
      question = questions.undone_list.first
    end
    return question
  end
end
