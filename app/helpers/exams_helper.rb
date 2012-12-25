# -*- encoding : utf-8 -*-
module ExamsHelper
  def link_to_skill(skill)
    link_to quiz_logo(skill), polymorphic_path(skill), :target => '_blank'
  end

  def quiz_logo(quiz)
    image_tag quiz.logo.url(:medium)
  end

  def link_to_build_exam(exam='skill')
    link_to "<i class='icon-leaf'></i> 建立#{exam.classify.constantize.model_name.human}考題".html_safe, eval("new_#{exam}_path"), :class => 'btn btn-large'
  end
end
