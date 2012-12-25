# -*- encoding : utf-8 -*-
require "redcarpet"
class Question < Quiz

  belongs_to :quiz, :foreign_key => 'parent_id', :counter_cache => true

  has_many :options, :dependent => :destroy, :foreign_key => 'quiz_id'

  has_many :responses, :dependent => :destroy, :as => :paperable

  validates_presence_of :prompt

  has_many :abilities, :as => :objectable

  scope :undone_list, lambda { includes(:responses).joins(:options).where(["papers.user_id is null or papers.user_id != ?", User.current.id]) }
  scope :done_list,   lambda { includes(:responses).joins(:options).where(["papers.user_id = ?", User.current.id]) }

  scope :harder,    lambda { |location| where(["quizzes.location >= ? or quizzes.location is null", location]).order('quizzes.location asc') }
  scope :easier,    lambda { |location| where(["quizzes.location < ? or quizzes.location is null", location]).order('quizzes.location asc') }

  scope :retry_list,  lambda { done_list.joins(:abilities).where(["relations.user_id = ? and relations.value < ?", User.current.id, Settings.skill_level.high]).order('quizzes.location asc') }

  scope :done_q,    lambda { done_list.first   }
  scope :undone_q,  lambda { undone_list.first }
  # scope :retry_q,   lambda { self.retry_list.first  }

  def timing
    [((self[:location] ? self[:location] : 1) * 60).to_i, 25].max
  end

#  def prompt
#    assembler = Redcarpet::Render::HTML.new(:hard_wrap => true) # auto <br> in <p>
#    renderer = Redcarpet::Markdown.new(assembler, {
#      :autolink => true,
#      :fenced_code_blocks => true
#    })
#    "<div>#{MarkdownConverter.convert(self[:prompt])}</div>".html_safe
#  end

  def get_options
    # 智慧取選項
    # 單選或複選
    # 複選則至少有 1 正確
    status = 1
    case status
    when 1
      # 單選: 1 正確，其餘錯誤
      checkeds = options.checked.sort_by{rand()}
      uncheckeds = options.unchecked.sort_by{rand()}[0,3]
      checkeds = checkeds[0, 4 - uncheckeds.count]
      (checkeds + uncheckeds).sort_by{rand()}
    when 2
      # 複選
    end
  end

  accepts_nested_attributes_for :options
  attr_accessible :options_attributes, :parent_id, :prompt, :location
  def options_attributes;end
  def options_attributes=(params)
    self.save if self.new_record?
    params.each do |key, value|
      destroy = value.delete('_destroy')
      if option = self.options.find_by_id(key.to_i)
        if destroy == '1'
          option.destroy
        else
          option.update_attributes!(value)
        end
      else
        if destroy == 'false'
          self.options.create!(value)
          # else
          # do nothing about canceling after adding
        end
      end
    end
    self.touch
  end

  def single_choice?
    options.where(["checked = ?", true]).count == 1 ? true : false
  end


  def _info
    %Q(
    總答題數: #{self.responses_count} 題次,
    難度: #{self.location}
    ).html_safe
    # 更新：#{self.updated_at}
  end
end
