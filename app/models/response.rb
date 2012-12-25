# -*- encoding : utf-8 -*-
class Response < Paper
  belongs_to :user, :counter_cache => true

  belongs_to :paper
  belongs_to :sheet, :counter_cache => true, :foreign_key => 'paper_id'

  # belongs_to :question, :foreign_key => 'quiz_id', :counter_cache => true
  belongs_to :question, :foreign_key => 'paperable_id', :class_name => 'Question'
  belongs_to :paperable, :polymorphic => true

  def prompt; question.prompt; end

  has_many :answers, :dependent => :destroy, :foreign_key => 'paper_id'

  scope :by_current_user, lambda { where(["papers.user_id = ?", User.current.id]).order('created_at desc')}

  accepts_nested_attributes_for :answers
  attr_accessible :answers_attributes, :paperable_type,:paperable_id, :paper_id, :paperable
  def answers_attributes;end
  def answers_attributes=(params)
    debug params, 'params'
    self.save if self.new_record?
    params.each do |key, value|
      self.answers.create!(value)
    end

    # 將所有答案儲存後，計算本答題分數
    self.value = self.score
    self.save
  end

  def correct?
    value == 1
  end

  def level
    question.location >= Settings.skill_level.high ? 0 : question.location >= Settings.skill_level.middle ? 1 : 2
  end

  def _level
    %w(困難 普通 簡單)[level]
  end

  def _result
    correct = ["高手! 這麼難也會!", "還不錯哦!!", "答對了! 這題太簡單了!"]
    correct_answer? ? correct[level] : "答錯囉! 加油。"
  end

  def score
    # 目前的給分是全對才給分
    correct_answer? ? 1 : 0
  end


  private
  def correct_answer?
    # 目前的正確定義是全對定義
    answers.map{|answer| answer.checked == answer.option.checked}.select{|x| x == false}.empty? ? true : false
  end
end
