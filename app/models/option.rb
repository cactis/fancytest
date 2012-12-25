# -*- encoding : utf-8 -*-
require "redcarpet"
class Option < ActiveRecord::Base
  attr_accessible :checked, :prompt

  has_many :answers, :dependent => :destroy
  belongs_to :question, :foreign_key => 'quiz_id', :counter_cache => true

#  def prompt
#    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
#        :autolink => true, :space_after_headers => true)
#    markdown.render(self[:prompt])
#  end

  validates_presence_of :prompt

  scope :checked, lambda { where (["checked = ?", true])}
  scope :unchecked, lambda { where(["checked = ?", false])}

  #  def prompt
  #    assembler = Redcarpet::Render::HTML.new(:hard_wrap => true) # auto <br> in <p>
  #    renderer = Redcarpet::Markdown.new(assembler, {
  #      :autolink => true,
  #      :fenced_code_blocks => true
  #    })
  #    "<div>#{MarkdownConverter.convert(self[:prompt])}</div>".html_safe
  #  end
end
